/**
 * @name 前台UI&TOOLS
 * @author kingdee
 * @url http://www.kingdee.com
 */

;(function($){
    $.kingdee.front = {
        settings: {
			
            down_menu_box: '.J_down_menu_box',
            down_menu: '.J_down_menu',
			down_hover: 'down_hover',
			returntop: '#J_returntop',
			search_box : '.J_searchBox'
        },
        init: function(options){
            options && $.extend($.kingdee.front.settings, options);
            $.kingdee.front.return_top();
            $.kingdee.front.drop_down();
			$.kingdee.front.search_box();
			
			$.kingdee.front.sub_nav_show();
			$.kingdee.front.nav_slider();
			$.kingdee.front.about_web_slider();
			
			
        },
        //返回顶部
        return_top: function() {
			var s = $.kingdee.front.settings;
            $(s.returntop)[0] && $(s.returntop).returntop();
        },
		
		 //搜索框
		search_box : function(){
			var s = $.kingdee.front.settings,
				searchBox = $(s.search_box);
				
				searchBox.children('input').focus(function(){
						$(this).css({color:'#8b8b8b'}).parent().addClass('focus');
						if(this.value === this.defaultValue){
							$(this).val('');
						}
				});
				searchBox.children('input').blur(function(){
						$(this).css({color:'#fff'}).parent().removeClass('focus');		
						if($.trim(this.value) === ''){
							$(this).val(this.defaultValue);
						}
				});
				
				searchBox.children('a').click(function(){
					$(this).siblings('input').trigger('focus');									   
				});
				
				
		},
		
		//相关网站
		about_web_slider : function(){
			$('.J-about-web').hover(function(){
					$(this).children('.uplinks').show();
				},function(){
					
					$(this).children('.uplinks').hide();
				});
		},
		
		
		nav_slider : function(){
			$('.J-subnav-wrap').cycle({ 
				fx:      'scrollLeft', 
				delay:   -2000,
				timeout : 0,
				speed : 300,
				//easing:'easeInSine',
				pager: '.J-nav-button-hide'
			});
			
			$('.J-mian-nav').each(function(index){
				
				$(this).click(function(){
					
					$('.J-nav-button-hide a').eq(index).trigger('click');
					var width = 0;
					$(".subnav-li").eq(index).find('dl').each(function(index, element) {
                        width += $(this).width();
                    });
					width += $(".subnav-li").eq(index).find('.nav-image').width();
					
					$(".subnav-li").eq(index).find('dl').eq(0).css({"padding-left" : parseInt((980-width)/2)});
					
					
				});
			});
		},
		
		// 二级菜单显示隐藏
		
		sub_nav_show : function(){
			var timer = null,
				close = function(){
					timer = window.setTimeout(function(){
						$('.menu').find('.J-nav-arrow').hide();
						$('.J-subnav').stop().animate({height:0},200,'easeOutSine',function(){
							$(this).css({display:'none'}).data({open:false});	
						});							   
					},1000);
				};
			
			
			$('.J-mian-nav').click(function(){
				$(this).data({current:true}).siblings().data({current:false});
				$(this).find('.J-nav-arrow').show().end().siblings().find('.J-nav-arrow').hide();
				
				if($('.J-subnav').data('open')){return;}
				$('.J-subnav').css({display:'block',height:0}).stop().animate({height:50},300,'easeInSine',function(){
					$(this).data({open : true});	
				});
			});
			
			$('.menu').add($('.J-subnav')).hover(function(e){
					clearTimeout(timer);	
			},function(){
				if($('.J-subnav').data('open')){
						close();
					}
					
			});
		},
		

        //下拉菜单
        drop_down: function() {
			var s = $.kingdee.front.settings;
            var h = null,
                onshow = false;
            $(s.down_menu_box).css({position:'relative'});
            $(s.down_menu_box).hover(
                function(){
                    var self = $(this);
                    if (!onshow) {
                        h = setTimeout(function(){
                            self.addClass(s.down_hover).find(s.down_menu).show();
                            onshow = true;
                        }, 300);
                    }
                },
                function(){
                    var self = $(this);
                        clearTimeout(h);
                        self.removeClass(s.down_hover).find(s.down_menu).hide();
                        onshow = false;
                }
            );
        }
    };
    
    var search = function(){
    	var key = $.trim($("#sKey").val());
    	var url = "/search.action";
    	if(!App.isBlank(key) && key != "搜索"){
    		url += "?keyword=" + key;
    	}
    	window.location.href = url;
    };
    $("#sBtn").click(function(){
    	search();
    });
    $("#sKey").keydown(function(event) {
		if (event.keyCode == '13') {
			$("#sBtn").click();
			return false;
		}
	});
})(jQuery);


;(function($){
    //淡入淡出
    $.kingdee.fade = function(options) {
        var settings = {
            obj: '',
            init: 0.6,
            over: 1.0,
            out: 0.6
        };
        if(options) {
            $.extend(settings, options);
        }
        if($(settings.obj)[0]){
			$(settings.obj).each(function(){
				$(this).css('opacity', settings.init);
			}).hover(function(){
				$(this).animate({opacity:settings.over});
			}, function(){
				$(this).animate({opacity:settings.out});
			});
		}
    };
	/*相关网站 */
    $(".J_about_webside_box ol").hide();
	$(".J_about_webside_box").hover(function(){
		    $(".J_about_webside_box ol").show();
		},
		function(){
			$(".J_about_webside_box ol").hide();
		}
	);

	
})(jQuery);