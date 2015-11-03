$(document).ready(function($) {
	/*
	Dropdown
	=========================== */
	$('ul li.dropdown').hover(function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
		}, function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
	});
	
	/*
	Mobile navigation
	=========================== */
    //build dropdown
    $("<select />").appendTo(".navbar-inner nav ul");
 
    //Default option "Voir les rubriques�"
    $("<option />", {
       "selected": "selected",
       "value"   : "",
       "text"    : "Select menu"
    }).appendTo(".navbar-inner nav ul select"); 
 
    //Menu items
    $(".navbar-inner nav ul li a").each(function() {
        var el = $(this);
        $("<option />", {
            "value"   : el.attr("href"),
            "text"    : el.text()
        }).appendTo(".navbar-inner nav ul select");
    });
 
    //Link
    $(".navbar-inner nav ul select").change(function() {
        window.location = $(this).find("option:selected").val();
    });

	/*
	team hover
	=========================== */
	$('.team-wrapper').hover(function(){
		$(".avatar-left", this).stop().animate({left:'50%'},{queue:false,duration:550});
		$(".avatar-right", this).stop().animate({right:'50%'},{queue:false,duration:550});
	}, function() {
		$(".avatar-left", this).stop().animate({left:'0'},{queue:false,duration:550});
		$(".avatar-right", this).stop().animate({right:'0'},{queue:false,duration:550});
	});	
	
	/*
	Tooltips
	=========================== */
	$('.tooltips').tooltip({
		 selector: "a[data-tooltips='tooltip']"
	})
	
	/*
	Ticker
	=========================== */	
	$('.ticker').list_ticker({
			speed:5000,
			effect:'fade'
	});	
	
	/*
	Bounce animated
	=========================== */	
	$(".e_bounce").hover(
		function () {
		$(this).addClass("animated bounce");
		},
		function () {
		$(this).removeClass("animated bounce");
		}
	);
	
	/*
	Hidden
	=========================== */	
	$(".logo-hover, .social-hover, .hover-frame, .folio-caption").css({'opacity':'0','filter':'alpha(opacity=0)'});	

	/*
	Top hover	
	=========================== */	
	$('.box-nav, .slides li, .about-nav').hover(
		function() {			
			$(this).find('.hover-frame').stop().fadeTo(900, 0.2);
		},
		function() {
			$(this).find('.hover-frame').stop().fadeTo(900, 0);
		}
	)	
	
	/*
	Client logo hover
	=========================== */		
	$('.client-link').hover(
		function() {
			$(this).find('.logo-hover').stop().fadeTo(900, 1);
			$(this).find('.client-logo').stop().fadeTo(900, 0);
		},
		function() {
			$(this).find('.logo-hover').stop().fadeTo(900, 0);
			$(this).find('.client-logo').stop().fadeTo(900, 1);
		}
	)	

	/*
	Client logo hover
	=========================== */		
	$('.socila-link').hover(
		function() {
			$(this).find('.social-hover').stop().fadeTo(900, 1);
			$(this).find('.social-icon').stop().fadeTo(900, 0);
		},
		function() {
			$(this).find('.social-hover').stop().fadeTo(900, 0);
			$(this).find('.social-icon').stop().fadeTo(900, 1);
		}
	)
	
	
	/*
	portfolio hover	
	=========================== */	
	$('.folio-thumb').hover(
		function() {			
			$(this).find('.folio-caption').stop().fadeTo(900, 0.8);
			$('.zoom', this).stop().animate({top:'35%'},{queue:false,duration:300});
			return false; 			
		},
		function() {
			$(this).find('.folio-caption').stop().fadeTo(900, 0);
			$('.zoom', this).stop().animate({top:'100%'},{queue:false,duration:300});
			return false;			
		}
	)	
	
});	