var clickEvent = ('ontouchstart' in window) ? 'touchend' : 'click',
	isMobile = function() { return Modernizr.mq('only screen and (max-width: 640px)'); },
	isTablet = function() { return Modernizr.mq('only screen and (max-width: 960px)'); },
	isOld =  function() { return $('body').hasClass('ie9'); };

/* Prevent iPad Bug: Zooming in on switch from portrait to landscape */
if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
    var viewportmeta = document.querySelector('meta[name="viewport"]');
    if (viewportmeta) {
        viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0';
        document.body.addEventListener('gesturestart', function () {
            viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=1.6';
        }, false);
    }
}

$(document).ready(function() {
	var $teaser = $('#teaser'),
		teaserHeight = $teaser.height(),
		teaserWidth = $teaser.width();

	if( isMobile() ) {
		$('body').addClass('mobile');
	}
	else {
		//Navigation platzieren
		$('#navigation').prependTo('#header');

		$('<li class="print"><a>Print</a></li>').appendTo($('#metaNavi')).on(clickEvent, function() {
			if( location.search.indexOf('print=1') > -1 ) {
				window.print();
			}
			else { //Öffne Vorschau
				var newLoc = location.href + ((location.search) ? '&' : '?') + 'print=1',
					printWin = window.open(newLoc, 'printWindow', 'width=664, height=700, left=300, top=150, scrollbars=1, resizable=yes');
				
				printWin.focus();
				if( navigator.userAgent.indexOf('MSIE') > -1 ) {
					printWin.print();
				}
				else {
					printWin.onload = function() {
						printWin.print();
					};
				}
			}
		});
	}

	/* Header */
	$('#header .dropdown .label').on('click', function() {
		var $dropdown = $(this).parent();

		if( $dropdown.hasClass('open') ) {
			$dropdown.find('.pane').slideUp(200, function() {
				$dropdown.removeClass('open');
			});
		}
		else {
			$dropdown.addClass('open');
			$dropdown.find('.pane').slideDown(200);
		}
	});
	
	/* Function to activate flyout */
	var activateFlyout = function($this) {
		var $flyout = $this,
			$li = $flyout.closest('li'),
			$allLi = $li.siblings(),
			$stage = $('#stage');

		$flyout.on('click.outside-flyout', function(e) {
			e.stopPropagation();
		});
			
		$flyout.siblings('a').on('click', function(e) {	
			e.preventDefault();
			e.stopPropagation();

			if( $li.hasClass('open') ) {
				$li.removeClass('open');
				$flyout.slideUp(300, function() {
					if ($li.hasClass('wc')) {
						/* reset before end */
						softResetWebCatalogueFlyout();
					}
				});
				$(document).off('click.outside-flyout');
				$stage.cycle('resume');
				/*
				$stage.find('.slide').not('.cycle-slide-active').each(function() {
					$img = $(this).find('img');
					$img.attr('src', $img.data('image'));
				});
				*/
				$teaser.find('.carousel').each(function() {
					$(this).trigger('resume');
				});
				$('#content .teaser.news .slider').each(function() {
					$(this).cycle('resume');
				});
			}
			else {
				$stage.cycle('pause');
				/*
				$stage.find('.slide').not('.cycle-slide-active').each(function() {
					$img = $(this).find('img');
					$img.data('image', $img.attr('src'));
					$img.attr('src', '');
				});
				*/
				$teaser.find('.carousel').each(function() {
					$(this).trigger('pause');
				});
				$('#content .teaser.news .slider').each(function() {
					$(this).cycle('pause');
				});
				$li.toggleClass('open');
				if ($li.hasClass('wc')) {
					/* reset before start */
					resetWebCatalogueFlyout();
				}
				if( !isMobile() ) {
					$allLi.removeClass('open')
						.find('.flyout').hide();
					$(document).on('click.outside-flyout', function() {
						$allLi.add($li).filter('.open').find('> a').trigger('click');
					});
				}
				$flyout.slideDown(300);
			}

		});
	};
	
	$('#navigation .flyout').each(function() {
		activateFlyout($(this));
	});

	/* Edelmetallteaser */
	$teaser.find('.carousel').each(function() {
		var $teaser = $(this);

		$teaser.after('<div class="gradient"></div>');
		$teaser.carouFredSel({
			items: {
				visible: 3
			},
			auto: {
				items: 1,
				duration: 700,
				timeoutDuration: 5000,
				onBefore: function(data) {
					$teaser.find('.slide.active').removeClass('active', 200)
						.next().addClass('active', 200);
				}
			},
			height: '100%',
			direction: "up"
		});
		$teaser.find('.slide:eq(1)').addClass('active');
	});

	/* Access Portal Teaserlayer */
	$('#content .teaser:not(.wide)').each(function(index) {
		var $this = $(this),
			$link = $this.find('> a'),
			$layer = $this.find('.layer'),
			complete = function() { //Ende der Animation
				var chartWidth = $layer.find('.chart-wrapper').width(),
					chartHeight = $layer.find('.chart-wrapper').height();

				// Verstecke Links wegen Touchgeräten
				$link.on('click.stop', function(e) {
					e.preventDefault();
					return false;
				});
				// Größe der Edelmetallteaser setzen
				var chart = accessPortal.chart;
				if (chart && chart.length) {
					for(var i = 0, ii = chart.length; i < ii; i++) {
						chart[i].setSize( chartWidth, chartHeight );
					}
					$layer.find('.chart.' + $('#chartselect :selected').val()).show();
				}
			};

		$link
			.on('touchmove', function(e) {
				if (!$link.data('scrolling')) {
					$link.data('scrolling', true);
				}
			})
			.on(clickEvent, function(e) {
				e.preventDefault();

				if ($link.data('scrolling')) {
					$link.data('scrolling', false);
					return;
				}

				var height = $('#teaser').height(),
					width = $('#teaser').width(); //width = $layer.outerWidth();

				//Schließe alle anderen Layer
				$('#content .teaser .layer').css({
					display: '',
					height: '',
					'margin-top': ''
				});
				if( isMobile() ) {
					$layer
						.height('auto')
						.css('margin-top', $this.outerHeight() * -1)
						.slideDown(400, complete);
				}
				else if ( isOld() ) {
					$layer.animate({
						height: '100%',
						padding: '13px 15px',
						width: '99.75%'
					}, null, null, complete);
				}
				else {
					$layer.addClass('zoomed');
				}
				
				
				if( window._gaq ) {
					var text = $link.text();
					if( $link.find('.carousel').length ) {
						text = $this.find('h3').text();
					}
					_gaq.push(['_trackEvent', 'Tile Tracking', text.trim() , window.location.pathname ]);
				}
			})
			.removeAttr('href');

		if ($this.hasClass('charts')) {
			$layer.on('transitionend webkitTransitionEnd', function(e) {
				if (e.originalEvent.propertyName === 'height') {
					complete();
				}
			});
		}

		/* Close Layer */
		$layer
			.on(clickEvent, function(e) {
				e.stopPropagation();
			})
			.append('<a class="close"></a>')
			.find('.close')
			.on(clickEvent, function(e) {
				if( isMobile() ) {
					$layer.slideUp(400, function() {
						$this.find('> a').off('click.stop');
					});
				}
				else if ( isOld() ) {
					$layer.animate({
						height: 0,
						padding: 0,
						width: 0
					});
				}
				else {
					$layer.removeClass('zoomed');
				}
			});
	});

	$('#content .teaser.wide .layer').each(function() {
		var	$this = $(this),
			$parent = $this.parents('.teaser'),
			$layers = $parent.find('.layer'), //to find all news layers
			$link = $this.parent();
			
		$link.find('.layer').append('<a class="close"></a>');
		$link.on(clickEvent, function(e) {
			e.preventDefault();

			var href = $(e.target).attr('href');
			if (href) {
				window.location.href = href;
				return false;
			}

			if( isTablet() && !isMobile() ) {
				$layers.css('top', 'auto').css('bottom', 0);
			}
			else {
				$layers.css('top', $parent.position().top * -1).css('bottom', 'auto');
			}

			$('#content .teaser .layer').removeClass('open');
			$link.addClass('open');
			$layers
				.addClass('zoomed')
				.height(0)
				.show()
				.animate({
					height: $teaser.height()
				}, 300);
		})
		.find('.close')
		.on(clickEvent, function(e) {
			e.stopPropagation();

			var $layer = $(this).parent('.layer');
			
			//$layer.removeClass('zoomed'); //TODO: Close all layers on news teaser
			$layer.animate({
				height: 0
			}, 300, function() {
				$layers.removeClass('zoomed').height(0).hide(); //TODO: Close all layers on news teaser
				$link.removeClass('open');
			});
		});
	});
	
	/* News Access Portal */
	$('#content .teaser.news .slider').each(function() {
		var $this = $(this),
			$slide = $this.find('.slide'),
			$layers = $this.find('.layer');

		/* Newsslider */
		if( $slide.length > 1 ) {
			$this.append('<div class="slidenav"></div>');
			$this.find('.layer').append('<span class="prev"></span><span class="next"></span>');
			$this.cycle({
				autoHeight: 'calc',
				fx: 'scrollHorz',
				log: false,
				next: '.next',
				pager: '.slidenav',
				pagerActiveClass: 'active',
				pauseOnHover: (Modernizr.touch) ? false : true,
				prev: '.prev',
				slides: '.slide',
				speed: 900,
				swipe: true,
				timeout: 5000
			});
		}
		/* Show Layer */
		$slide
			.on('touchmove', function(e) {
				if (!$slide.data('scrolling')) {
					$slide.data('scrolling', true);
				}
			})
			.on(clickEvent, function() {
				$this.addClass('open').cycle('pause');
				if ($slide.data('scrolling')) {
					$slide.data('scrolling', false);
					return;
				}			
				if( window._gaq ) { 
					var text = 'News - ';
					text += $(this).find('.summary').first().text();
					_gaq.push(['_trackEvent', 'Tile Tracking', text.trim() , window.location.pathname ]);
				}
			})
			.find('.close').on(clickEvent, function() {
				$this.removeClass('open').cycle('resume')

			});
			
		$layers.find('a').on(clickEvent, function(e) {
			e.stopPropagation();
			return true;
		});
		$this.find('.prev, .next').on(clickEvent, function(e) {
			e.stopPropagation();
		});
	});

	/* Stage */
	var $stage = $('#stage');
	if( $stage.length && 1 < $stage.find('.slide').length ) {
		if( isOld() ) {
			//Fake IE9 shadow
			$('#stage h3').each(function() {
				$(this).wrapInner('<span></span>');
				$(this).append('<span class="shadow">' + $(this).text() + '</span>');
			});
		}

		$stage
			.append('<div class="prev"><span></span></div><div class="next"><span></span></div>')
			.cycle({
				autoHeight: 'calc',
				fx: 'fade',
				log: false,
				manualSpeed: 660,
				next: '#stage .next',
				pauseOnHover: (Modernizr.touch) ? false : true,
				prev: '#stage .prev',
				slides: '.slide',
				speed: 2000,
				swipe: true,
				timeout: 8000
			});

		var $infoboxes = $stage.find('.infobox');

		if ($infoboxes) {
			$('<div class="close"/>')
				.appendTo($infoboxes.find('.infotext'))
				.on('click', function() {
					$stage.cycle('resume');

					$(this)
						.parents('.infobox')
						.stop()
						.fadeOut(300);
				});

			$('<div class="infobutton">i</div>')
				.appendTo($stage)
				.on('click', function() {
					var $infobox = $stage.find('.cycle-slide-active .infobox');

					if (!$infobox.length) {
						return;
					}

					if ($infobox.is(':visible')) {
						$infobox
							.stop()
							.fadeOut(300);
						$stage.cycle('resume');
					} else {
						$infobox
							.stop()
							.fadeIn(300);
						$stage.cycle('pause');
					}
				});

			$('.infotitle').on('click', function () {
				    var $infobox = $stage.find('.cycle-slide-active .infobox');

				    if (!$infobox.length) {
				        return;
				    }

				    if ($infobox.is(':visible')) {
				        $infobox
							.stop()
							.fadeOut(300);
				        $stage.cycle('resume');
				    } else {
				        $infobox
							.stop()
							.fadeIn(300);
				        $stage.cycle('pause');
				    }
				});

			$stage.on('cycle-after', function() {
				$stage
					.find('.cycle-slide-active .infobox')
					.stop()
					.fadeOut(300);
			});
		}
	}

	/* Touchgeräte */
	if( !Modernizr.touch ) {
		$('#content .teaser > a')
			.hoverIntent({
				over: function() {
					$(this).addClass('hover', 400);
				},
				out: function() {
					$(this).removeClass('hover', 400);
				},
				interval: 40
			});
		// Hovereffekt für Imageteaser
		$('#content .teaser .imageteaser a')
			.append('<div class="hover"><span></span></div>')
			.hoverIntent({
				over: function() {
					$(this).find('.hover').fadeTo(200, 1);
				},
				out: function() {
					$(this).find('.hover').fadeTo(200, 0);
				},
				interval: 20
			});
	}

	/* Übersichtsseite - Filter & Layer */
	$('#content .overview li').each(function() {
		var $li = $(this),
			$layer = $li.find('.layer');

		$li.addClass( $.trim( $li.children('a').text() ).substring(0,1) );
		$li.filter(':nth-child(5n)').addClass('right');
		if( $layer.length ) {
			$layer.append('<span class="close"></span>');

			$li.find('> a').on('click', function(e) {
				e.preventDefault();

				//schließe alle anderen Layer
				$li.siblings().find('.layer').hide();

				if( isMobile() ) {
					$layer
						.css('height', 'auto')
						.css('width', 'auto')
						.css('top', $li.children('a').outerHeight() * -1)
						.slideDown(300);
				}
				else {
					var width = $li.width() * 2 + parseInt($li.css('margin-right')) * 2 + 2,
						height = $li.height() * 2 + parseInt($li.css('margin-bottom'));

					// bestimme, ob Layer nach oben geöffnet werden soll
					if( $(this).offset().top + height > $('#footer').offset().top ) {
						$layer.css('bottom', 0).css('top', 'auto');
					}
					else {
						$layer.css('top', '');
					}
					$layer
						.show()
						.css('height', 0)
						.animate({
							height: height,
							width: width
						},300);
				}
			});
			$layer.find('.close').on('click', function() {
				if( isMobile() ) {
					$layer.slideUp(300, function() {
						$layer.hide();
					});
				}
				else {
					$layer.animate({
						height: 0,
						width: 0
					}, 300, function() {
						$layer.hide();
					});
				}
			});
		}
	});
	
	if( $('#content .filter').length ) {	
		var $sort = $('#content .filter li, #content .filter .all');
		$('#content .overview').mixitup({
			targetSelector: 'li',
			filterSelector: '#content .filter li, #content .filter .all',
			onMixEnd: function() {
				$('#content .overview li').removeClass('right').filter(':visible').each(function(index) {
					if( index % 5 == 4 ) {
						$(this).addClass('right');
					}
				});
			}
		});
		$('#content .filter .all').addClass('highlight');
		$sort.on('click', function() {
			$sort.removeClass('highlight');
			$(this).addClass('highlight');
		});
	}

	/* A-Z Slider Übersicht */
	if( isTablet() ) {
		$('#content .filter .selected').initFilterSlider('65%');
	}

	/* Suchpaging */
	$('#content.search .paging').initFilterSlider('90%');

	/* Edelmetalllayer -  Highcharts */
	$('.home .teaser.charts .layer').each(function() {
		var $this = $(this);

		// set Variable for chart saving
		accessPortal.chart = [];
		$this.find('#chartselect option').each(function(index) {
			var $div = $('<div class="chart ' + $(this).val() + '"></div>');

			$this.find('.chart-wrapper').append($div);
			$div.initSmallChart( $(this).val() );
			$div.hide();
		});
		$this.find('#chartselect').on('change', function() {
			$this.find('.chart').hide();
			$this.find('.chart.' + $(this).val()).show();
		});
	});

	/* Applikationsfilter (Detailseite) */
	$('#content .apps select').on('change', function() {
		var value = $(this).val(),
			$links = $('#content .apps .output a');

		if( value!= '' ) {
			$links.hide()
				.filter('[data-filter~="' + value + '"]').show();
		}
		else {
			$links.show();
		}
	});
	
	/* Browserhinweis */
	if( $('body').hasClass('home') ) {
		var userAgent = navigator.userAgent.toLowerCase();
		if( userAgent.indexOf('msie 8.0') > -1 || userAgent.indexOf('msie 7.0') > -1 || userAgent.indexOf('msie 6.') > -1 || userAgent.indexOf('Firefox/3.') > -1 ) {
			$('body').prepend('<div id="browserinfo"><div><span class="icon"></span><p><strong>' + accessPortal.browserInfoHead + '</strong><br />' + accessPortal.browserInfoText + '</p><div class="right"><a href="http://www.mozilla.org/de/firefox/new/" class="firefox" target="_blank">Firefox</a><a href="http://www.google.de/intl/de/chrome/browser/" class="chrome" target="_blank">Chrome</a><a href="http://windows.microsoft.com/de-at/internet-explorer/download-ie" class="msie" target="_blank">Internet Explorer</a></div><span class="close"></span></div></div>');
			$('#browserinfo .close').on('click', function() {
				$('#browserinfo').remove();
			});
		}
	}
	
	/* Website Catalogue */
	var hideJsScrollbars = function() {
			$('#wc-col-container').find('.wc-col .wc-links-container').getNiceScroll().hide();
		},
		softResetWebCatalogueFlyout = function() {
			hideJsScrollbars();
			$('#wc-back').trigger('click');
		},
		resetWebCatalogueFlyout = function() {
			hideJsScrollbars();
			$('#wc-col-container').attr('class', 'wc-category-show');
			$('#wc-col-container').find('#wc-category .active').removeClass('active');
		},
		initWebsiteCatalogue = function() {
			if($('#wc-col-container').length) {
				var $wc = $('#wc-col-container'),
					hideUnusedLinkFilters = function(subtree, col) {
						/*
						 * subtree = search only on visible links
						 * col = column of the current clicked link (all or wc-theme, wc-industry, ...)  
						 **/
						
						/* 1. hide all filters */
						if (col == "all") {
							$('#wc-country li a, #wc-theme li a, #wc-industry li a').each(function() {
								$(this).closest('li').not('.wc-link-global').addClass('wc-filter-inactive');
							});
						}
						else if ($("#" + col).find('.wc-headline span').text() == 2) {
							/* if clicked a link in second column, hide only links in 3rd column */
							if (col == "wc-country") {
								/* if second is country, third can only be theme or industry*/
								$('#wc-theme li a, #wc-industry li a').each(function() {
									$(this).closest('li').not('.wc-link-global').addClass('wc-filter-inactive');
								});								
							}
							else if (col == "wc-industry" || col == "wc-theme") {
								/* if second is industry or theme, third is country*/
								$('#wc-country li a').each(function() {
									$(this).closest('li').not('.wc-link-global').addClass('wc-filter-inactive');
								});	
							}
						}
						
						if (subtree) {
							var $wcLinks = $('#wc-links li.wc-visible');
						}
						else {
							var $wcLinks = $('#wc-links li');
						}
						
						/* 2. show filer where link exits */
						$wcLinks.each(function() {
							var $this = $(this),
								countries = $this.data('country'),
								themes = $this.data('theme'),
								industries = $this.data('market');
								
								if (themes.length || industries.length) {
									/* show filters which have a link */
									if (col === 'all' && themes.length) {
										$(countries).each(function(index, id) {
											$('#wc-country li a[data-id=' + id + ']').closest('li').removeClass('wc-filter-inactive');
										});
									}
									else if ($("#" + col).find('.wc-headline span').text() <= 2 && (col == "wc-theme" || col == "wc-industry")) {
										$(countries).each(function(index, id) {
											$('#wc-country li a[data-id=' + id + ']').closest('li').removeClass('wc-filter-inactive');
										});										
									}
									if (col === 'all' || ($("#" + col).find('.wc-headline span').text() == 2 && col == "wc-country")) {
										if (themes.length) {
											$(themes).each(function(index, id) {
												$('#wc-theme li a[data-id=' + id + ']').closest('li').removeClass('wc-filter-inactive');
											});
										}
										if (industries.length) {
											$(industries).each(function(index, id) {
												$('#wc-industry li a[data-id=' + id + ']').closest('li').removeClass('wc-filter-inactive');
											});
										}
									}
								}
						});
					},
					removeJsScrollbars = function() {
						$wc.find('.wc-col').not('.wc-selected-col').find('.wc-links-container').getNiceScroll().remove();
					},
					activateJsScrollbars = function($this) {
						/* init nics scroller */
						removeJsScrollbars();
						$this.find('.wc-links-container').niceScroll({cursorcolor:"#cccccc", cursoropacitymin: 0.3, cursorwidth: 10, hidecursordelay: 100, horizrailenabled: false});
						$this.find('.wc-links-container').getNiceScroll().show();
						$this.find('.wc-links-container').getNiceScroll().resize();
					},
					resizeJsScrollbars = function() {
						$wc.find('.wc-links-container').getNiceScroll().resize();
					},
					backFunction = function(moveTo, showBackLink) {
						/* function to slide a wp-links container if it is to large to be shown in one column */
						var $wcLinks = $wc.find('#wc-links'),
							$cols = $wc.find('.wc-col').not('#wc-links'),
							multiplicator = 1.05;
							/* multiplicator is needed for slide all other cols out of users sight must be adjusted if moveTo changes */

						$wc.add('#wc-col-content').css('min-height', $('#wc-links').outerHeight(false)); /* set min-height for wc-links (if wc-links has position: absolute) */
						
						/* remove all nice scrollbars */
						hideJsScrollbars();
						
						if ($wc.hasClass("wc-theme-show") && $wc.hasClass("wc-country-show") || !$wc.hasClass("wc-industry-show") && $wc.hasClass("wc-country-show")) {
							/* reset country list before fly in */
							if ($wc.hasClass('wc-country-position-change')) {
								$('#wc-theme').removeClass('wc-selected-col');
							}
							else {
								$('#wc-country').removeClass('wc-selected-col');
							}
						}

						/* animate wc-links and move to moveTo */
						$wcLinks.animate({ left: moveTo }, {
							duration: 983, 
							step: function(now, fx) {
								/* on each step calculate css left of all columns new to move them out of the way, works in both ways, left or right slide because we start on new */
								$cols.css('left', (parseInt(now) - 983) * multiplicator);
							},
							complete: function() {
								/* if animation is complete show back button or hide it */
								if (showBackLink) {
									$('#wc-back').show();
									$wc.add('#wc-col-content').css('min-height', $('#wc-links').outerHeight(false)); /* set min-height for wc-links (if wc-links has position: absolute) */
								}
								else {
									$('#wc-back').hide();
									/* resize scrollbars */
									activateJsScrollbars($wc.find('.wc-col.wc-selected-col .wc-links-container:visible').closest('.wc-col'));
									$wc.add('#wc-col-content').css('min-height', 0); /* reset min-height see above*/
									if (!$wc.hasClass("wc-theme-show") && !$wc.hasClass("wc-country-show") && !$wc.hasClass("wc-industry-show")) {
										$wc.attr('class','wc-category-show');
									}
									$('#wc-links').attr('style','');
								}
							}
						});
					},
					doOnOrientationChange = function() {
						/* we need to do a height calcualtion if orientation changes */
						if ($wc.hasClass('wc-links-show')) {
							$wc.add('#wc-col-content').css('min-height', $('#wc-links').outerHeight(false)); /* set min-height for wc-links (if wc-links has position: absolute) */						
						}
					},
					testSelectedId = function(array, id) {
						/* we need to check the id in the list */
						var returnValue = false;
						$(array).each(function(index, testId) {
							if (testId == id) {
								returnValue = true;
							}
						});
						return returnValue;
					},
					showFilteredLinks = function($link) {
						var columnname = $link.closest('.wc-col').attr('id');
						/* function selects links using data- attributes with ids of other links/categories/... */
						if (columnname != 'wc-category') {
							/* column category does a reset of all shown links */
							if ($link.closest('.wc-col').find('.wc-headline span').text() == 2) {
								/* if we are in column 2 */
								if ($link.data('country')) {
									/* and data-country attribute is not empty*/
									var countries = $link.data('country');
									$('#wc-country li').addClass('wc-inactive');
									$(countries).each(function(index, id) {
										/* show closest li which has the id which is in the list of countries */
										$('#wc-country').find('a[data-id=' + id + ']').closest('li').removeClass('wc-inactive');
									});
								}
								if ($link.data('theme')) {
									var themes = $link.data('theme');
									$('#wc-theme li').addClass('wc-inactive');
									$(themes).each(function(index, id) {
										/* show closest li which has the id which is in the list of themes */
										$('#wc-theme').find('a[data-id=' + id + ']').closest('li').removeClass('wc-inactive');
									});
								}
							}

							/* remove/reset all selected links */
							$('#wc-links li').removeClass('wc-visible'); /* reset all links before show */

							var countryActive = $('#wc-country a.wc-active').data('id') && typeof($('#wc-country a.wc-active').data('id')) == "number",
								themeActive = $('#wc-theme a.wc-active').data('id') && typeof($('#wc-theme a.wc-active').data('id')) == "number",
								industryActive = $('#wc-industry a.wc-active').data('id') && typeof($('#wc-industry a.wc-active').data('id')) == "number";


							/* show all links with the selected filter (country, industry and theme) */
							$('#wc-links li').each(function() {
								var $this = $(this),
									countries = $this.data('country'),
									themes = $this.data('theme'),
									industries = $this.data('market'),
									visibleCountry = false,
									visibleTheme = false,
									visibleIndustry = false;

								if (countries && countries != "" && countryActive) {
									visibleCountry = testSelectedId(countries, $('#wc-country a.wc-active').data('id'));
									/* check if selected country is in countries list of actual link */
								}
								if (themes && themes != "" && themeActive) {
									visibleTheme = testSelectedId(themes, $('#wc-theme a.wc-active').data('id'));
									/* check if selected theme is in themes list of actual link */
								}
								if (industries && industries != "" && industryActive) {
									visibleIndustry = testSelectedId(industries, $('#wc-industry a.wc-active').data('id'));
									/* check if selected industry is in industries list of actual link */
								}
								
								if (countryActive) {
									var test = 0;
									/* country list is visible and a country has been clicked */
									if (visibleCountry && !themeActive && !industryActive) {
										/* link is visible when: 
										 * visibleCountry: country of link is identical to actual clicked country 
										 * themeActive and industryActive are not active which means user clicked on "websites by country"
										 */
										$this.addClass('wc-visible');
									}
									else if (themeActive && visibleCountry && visibleTheme) {
										/* link is visible when: 
										 * themeActive: theme list is visible
										 * visibleCountry and visibleTheme are true: links country and theme are identical to the actual clicked country and theme
										 */
										$this.addClass('wc-visible');
									}
									else if (industryActive && visibleCountry && visibleIndustry) {
										/* link is visible when: 
										 * industryActive: industry list is visible
										 * visibleCountry and visibleIndustry are true: links country and industry are identical to the actual clicked country and industry
										 */
										$this.addClass('wc-visible');
									}
									else if ($this.data('global') === true) {
										/* link is global AND */
										if (visibleIndustry || visibleTheme) {
											/* visibleTheme or visibleIndustry are true: link theme or industry are identical to the actual clicked theme or industry */
											$this.addClass('wc-visible');
										}
									}
								}
								
								if (themeActive) {
									/* theme list is visible and a theme has been clicked */
									if (visibleTheme && !countryActive && !industryActive) {
										/* link is visible when: 
										 * visibleTheme: theme of link is identical to actual clicked theme 
										 * countryActive and industryActive are not active which means user clicked on "websites by themes"
										 */
										$this.addClass('wc-visible');
									}
									else if (visibleCountry && visibleTheme) {
										/* link is visible when: 
										 * visibleCountry and visibleTheme are true: links country and theme are identical to the actual clicked country and theme
										 */
										$this.addClass('wc-visible');
									}
								}
								
								if (industryActive) {
									/* industry list is visible and a industry has been clicked */
									if (visibleIndustry && !countryActive && !themeActive) {
										/* link is visible when: 
										 * visibleIndustry: industry of link is identical to actual clicked industry 
										 * countryActive and themeActive are not active which means user clicked on "websites by industry"
										 */
										$this.addClass('wc-visible');
									}
									else if (visibleCountry && visibleIndustry) {
										/* link is visible when: 
										 * visibleCountry and visibleIndustry are true: links country and industry are identical to the actual clicked country and industry
										 */
										$this.addClass('wc-visible');
									}
								}
								
							});

							hideUnusedLinkFilters(true, columnname);
						}

						if (columnname != "wc-country") {
							if ($('#wc-links .wc-links-container + .wc-links-container li.wc-visible').length) {
								$('#wc-country .wc-link-global').removeClass('wc-inactive');
							}
							else {
								$('#wc-country .wc-link-global').addClass('wc-inactive');
							}
						}
					},
					initJsSelect = function() {
						/* create a js select box instead of the real one to get the same design in all browsers */
						$('.wc-links-container select').each(function() {
							/* create js select on all visible wc-links-container */
							var $this = $(this),
								$dropdown = $('<span class="js-select">' + $(':selected', $this).text() + '</span>');
							
							if (!$this.closest('li').find('.js-select').length) {
								/* only if not available */
								$this.after($dropdown);
								$this.height($dropdown.outerHeight())
									.css('line-height', $dropdown.innerHeight() + "px")
									.width($dropdown.outerWidth());

								$this.bind('change', function() {
									/* execute on select change event */
									$dropdown.text( $(':selected', $(this)).text() );
									$(this).closest('li').find('a').attr('href', $(':selected', $(this)).attr('value'));
								});
							}
						});
					},
					updateSelectedFilter = function($this) {
						/* if highlighted link has more than one row (height > 20px) then display a larger button (wc-large) */
						if ($this.closest('.wc-col').find('.wc-headline span').text() == 2) {
							$wc.find('a.wc-active').removeClass('wc-active');
						}
						$this.addClass('wc-active');
						$this.closest('li').siblings().find('a.wc-active').removeClass('wc-active');
						
						if ($this.closest('.wc-col').find('.wc-selected span span').outerHeight() > 20) {
							$this.closest('.wc-col').find('.wc-selected').addClass('wc-large');
						}
						else {
							$this.closest('.wc-col').find('.wc-selected').removeClass('wc-large');
						}
					
						resizeJsScrollbars();
					};

				if (userAgent.indexOf('msie 8.0') == -1) {
					/* event listener for orientation change */
					window.addEventListener('orientationchange', doOnOrientationChange);
				}
			
				/* add close button and close function */
				$wc.append('<div class="close-flyout"></div>');
				$wc.find('.close-flyout').on('click', function() {
					$(this).closest('li').find('> a').trigger('click');
				});
				
				/* add global link to countries */
				var globalText = "Global";
				if ($wc.data('globalText') && $wc.data('globalText') != "") {
					globalText = $wc.data('globalText');
				}
				$('<li class="wc-link-global"><a href="#">' + globalText + '</a></li>').insertBefore('#wc-country ul:first li:first');

				/* set design to all select input fields */
				initJsSelect();
				
				$wc.find('.wc-col li a').on('click', function(e) {
					/* listen on each link inside the flyout */
					var $this = $(this),
						columnname = $(this).closest('.wc-col').attr('id'), /* columnname in which the link is clicked */
						$col = $this.closest('.wc-col'), /* corresponding col of clicked link */
						visibleLinks = "",
						visibleCountries = "";
					
					/* show global link */
					if ($this.closest('li').hasClass('wc-link-global')) {
						$('#wc-links').addClass('wc-global-active');
					}
					else {
						$('#wc-links').removeClass('wc-global-active');
					}


					updateSelectedFilter($this); /* resize active filter if needed*/
					showFilteredLinks($this); /* select and mark all filtered links to be shown (.wc-visible) */

					
					if ($this.closest('li').hasClass('wc-link-global')) {
						visibleLinks = $('#wc-links .wc-links-container + .wc-links-container').find('li.wc-visible').length; /* amount of filtered and visible links inside second ul (global) */			
					}
					else {
						visibleLinks = $('#wc-links .wc-links-container').find('li.wc-visible').length; /* amount of filtered and visible links */					
					}
					visibleCountries = $('#wc-country ul li').not('.wc-inactive').length;
					
					if (columnname == "wc-category") { /* click on first column link (category link)*/
						e.preventDefault();
						var attr = $(this).data('select'); /* get select attribute of link to descide which second column is to show */
						if (attr) {
							$('.wc-col li').not('#wc-category li').not('#wc-links li').removeClass('wc-inactive'); /* reset all links, not for wc-links */
							$('#wc-links li').removeClass('wc-visible'); /* show all links*/
							$wc.find('.wc-col').removeClass('wc-selected-col');
							$wc.find('.wc-col a.wc-active').removeClass('wc-active');
							removeJsScrollbars();
							if( isMobile() && $this.closest('li').hasClass('active') ) {
								$this.closest('li').siblings().removeClass('wc-inactive-link'); /* remove class for mobile css selectors */
								$this.closest('li').removeClass('active');
								$wc.attr('class', 'wc-category-show');
							}
							else {
								$col.siblings().find('.wc-selected').removeClass('active'); /* delete all active classes on every link */
								$wc.attr('class', attr + "-show"); /* activate second column and overwrite any existing settings */
								$this.closest('li').addClass('active'); /* active class = highlight actual link */
								$this.closest('li').siblings().removeClass('active'); /* remove highlight on any other link */
								visibleLinks = 10;
								if (attr == "wc-links" && visibleLinks > 2 && !isMobile()) {
									$('#wc-links').addClass('wc-full-size'); /* if links container has more than 11 links, display in "full screen", so we need to deactivate the first column (category) */
									backFunction(60, true);
								}
								else {
									$('#wc-links').removeClass('wc-full-size'); /* show category column (first column is allways category column) */
									$('#wc-back').hide(); /* hide back button (used for full screen links column which has no navigation) */
								}
								$col.siblings().removeClass('wc-selected-col'); /* remove all settings to one column */
							}
							
							if (attr == "wc-country") {
								$('#wc-country .wc-link-global').hide();
							}
							else {
								$('#wc-country .wc-link-global').show();
							}
							
							if (attr == "wc-links") {
								/* identify corporate websites */
								$('#wc-links').find('li[data-corporate=true]').addClass('wc-visible');
							}
							
							/* reset unused filters */
							hideUnusedLinkFilters(false, "all");
						}
					}
					else if (columnname != "wc-links") { /* click on industry or theme */
						e.preventDefault();
						$wc.addClass(columnname + "-show");
						$col
							.find('.wc-selected').attr('href', $this.attr('href')).addClass('active')
							.find('span span').text($this.text()); /* set href and text of headline link to the actial clicked link */

						if (columnname == "wc-theme" || columnname == "wc-industry") {
							if ($wc.hasClass('wc-country-show')) {
								if (visibleLinks > 11 && !isMobile()) {
									$wc.addClass('wc-links-show'); /* show links column */
									$('#wc-links').addClass('wc-full-size'); /* if links container has more than 11 links, display in "full screen", so we need to deactivate the first column (category) */
									if ($wc.hasClass('wc-country-position-change')) {
										/* execute only if country is in second column and industry or theme is in second column */
										backFunction(60, true);
									}
								}
								else {
									if (!$wc.hasClass('wc-country-position-change') && (visibleLinks <= 5 || visibleCountries <= 3)) {
										$wc.removeClass('wc-country-show');
										$wc.addClass('wc-no-country'); /* wc-no-country: special link column if no country is shown */
									}
									else {
										$wc.removeClass('wc-no-country'); /* remove special link column */
									}
									$col.addClass('wc-selected-col'); /* set column to one column width */
									activateJsScrollbars($col);
									$('#wc-links').removeClass('wc-full-size'); /* show category column (first column is allways category column) */
									$('#wc-back').hide(); /* hide back button (used for full screen links column which has no navigation) */
									$wc.addClass('wc-links-show'); /* show links column */
								}
							}
							else {
								$col.addClass('wc-selected-col'); /* set column to one column width */
								activateJsScrollbars($col);
								if (visibleLinks <= 5 || visibleCountries <= 3) {
									$wc.addClass('wc-links-show wc-no-country'); /* wc-no-country: special link column if no country is shown */
								}
								else {
									$wc.removeClass('wc-no-country'); /* remove special link column */
									$wc.addClass('wc-country-show'); /* show country column */
									
									$('#wc-country').insertBefore($('#wc-links')); /* reset position of country */
									$wc.removeClass('wc-country-position-change'); /* reset info of changed country position */
								}
							}
						}
						else if (columnname == "wc-country") { /* click on country */
							if (!$wc.hasClass('wc-industry-show') && !$wc.hasClass('wc-theme-show')) {
								/* if country is second column (industry and theme not shown) show theme column (first column is allways category column) */
								$('#wc-country').insertAfter($('#wc-category')); /* move country column to first column */
								$wc.addClass('wc-country-position-change');
								$col.addClass('wc-selected-col'); /* set column to one column width */
								activateJsScrollbars($col);
								$wc.addClass('wc-theme-show'); /* activate show of theme column */
							}
							else {
								/* if theme or industry is second column and country is third */
								$wc.addClass('wc-links-show'); /* show links */
								if (visibleLinks > 11 && !isMobile()) {
									$('#wc-links').addClass('wc-full-size'); /* if links container has more than 11 links, display in "full screen", so we need to deactivate the first column (category) */
									if (!$wc.hasClass('wc-country-position-change')) {
										/* execute only if country is NOT in second column and industry or theme is in second column */
										backFunction(60, true);
									}
								}
								else {
									$col.addClass('wc-selected-col'); /* set column to one column width */
									activateJsScrollbars($col);
									$('#wc-links').removeClass('wc-full-size'); /* show category column (first column is allways category column) */
									$('#wc-back').hide(); /* hide back button (used for full screen links column which has no navigation) */
									$wc.addClass('wc-links-show'); /* show links column */
								}
							}
						}
						
						$('#' + columnname).nextAll('.wc-col:visible').each(function(index) {
							/* reset all columns which are behind the actual column, no reset if next column is wc-links */
							if (index == 0 && $(this).attr('id') != "wc-links") {
								/* remove class wc-selected-col to get more than on column */
								$(this).removeClass('wc-selected-col');
							}
							else if (index == 1 && $(this).attr('id') == "wc-links") {
								$wc.removeClass("wc-links-show");
								/* remove class of last column to hide */
							}
						});
						
					}

					updateSelectedFilter($this); /* resize active filter if needed*/

					$wc.find('.wc-col:visible').each(function(index) {
						/* change the number of the cols depending of their appearance  */
						$(this).find('.wc-headline span').text(index + 1);
					});

					$('#wc-links ul').each(function(index) {
						/* hide columns with no links */
						var $this = $(this);
						if (!$('#wc-links').hasClass('wc-global-active')) {
							/* do this if country: global is not active */
							if ($this.find('li.wc-visible').length) {
								$this.closest('.wc-links-container').show();
							}
							else {
								$this.closest('.wc-links-container').hide();
							}
						}
						else {
							if (index == 0) {
								$this.closest('.wc-links-container').hide();
							}
							else {
								$this.closest('.wc-links-container').show();
							}
						}
					});
					
				});
				
				/* only mobile, on not mobile preventDefault
				 * click on a link and hide all others, if click on selected link, deactivate selected and show all others again
				 * hiding of links is done by css selectors on mobile pages only
				 */
				$wc.find('.wc-selected').on('click', function(e) {
					e.preventDefault();
					if( isMobile() ) {
						var $this = $(this),
							$col = $this.closest('.wc-col'),
							$colNextSiblings = $col.nextAll('.wc-col');
							
						$this.removeClass('active');
						$this.closest('.wc-col').find('a.wc-active').removeClass('wc-active');
						$colNextSiblings.each(function() {
							$(this).closest('.wc-col').find('a.wc-active').removeClass('wc-active');
							$(this).find('.wc-selected').removeClass('active');
							$wc.removeClass($(this).attr('id') + '-show');
						});
					}
				});
				$wc.find('#wc-category li.active').on('click', function(e) {
					e.preventDefault();
					if( isMobile() ) {
						$(this).removeClass('active');
					}
				});
				
				$('#wc-back').on('click', function(e) {
					/* click on back link, hide the link, if on wc-links at wc-category remove the active link and set initial state and execute slider */
					e.preventDefault();
					$('#wc-back').hide();
					if ($('#wc-category').find('li a.active').data('select') == "wc-links") {
						$('#wc-category').find('li a.active').removeClass('active');
						$wc.addClass('wc-category-show'); /* css class to set the initial state of the flyout */
					}
					backFunction(983, false);
				});
			
				hideUnusedLinkFilters(false, "all");
			}
		};
	
	/* initialise flyout at page load */
	if ($('#navigation li.wc a').length) {
		if ($('#navigation li.wc a').attr('href') !== "") {
			var wcFlyout =	$.ajax($('#navigation li.wc a').attr('href'), {
								dataType: 'html'
							});
			
			wcFlyout.done(function(data) {
				$(data).find('.flyout').insertAfter('#navigation li.wc a');
				activateFlyout($('#navigation li.wc .flyout'));
				initWebsiteCatalogue();
			});
		}
	}
});

$(window).on('resize', function() {
	if( isMobile() && !$('body').hasClass('mobile')) {
		$('body').addClass('mobile');

		//Navigation platzieren
		$('#main').after( $('#navigation') );
	}
	else if( !isMobile() && $('body').hasClass('mobile')){
		$('body').removeClass('mobile');

		//Navigation platzieren
		$('#navigation').prependTo('#header');
	}

	/* A-Z Slider Übersicht */
	if( $('#content .filter .caroufredsel_wrapper').length == 0 && isTablet() ) {
		$('#content .filter .selected').initFilterSlider('65%');
	}
	else if( $('#content .filter .caroufredsel_wrapper').length > 0 && !isTablet() ) {
		$('#content .filter .selected').trigger("destroy", true);
		$('#content .filter .sort').find('.prev, .next').remove();
	}

	/* Chartsize */
	if( $('#teaser .teaser.charts .layer').hasClass('zoomed') ) {
		var chart = accessPortal.chart,
			chartWidth = $('#teaser .teaser.charts .chart-wrapper').width(),
			chartHeight = $('#teaser .teaser.charts .chart-wrapper').height();
		if (chart && chart.length) {
			for(var i = 0, ii = chart.length; i < ii; i++) {
				chart[i].setSize( chartWidth, chartHeight );
			}
		}
	}
});