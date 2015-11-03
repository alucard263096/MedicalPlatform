$(document).ready(function() {
	
	/* --- PROFILE SUBNAV --- */
	var profileNav = false;
	 $("#n-profile .gnav").hover(function(){
            if (profileNav) clearTimeout(profileNav);
            $("#subnav_profile").fadeIn("fast");
            $("#n-profile .gnav").addClass('on');
        }, function() {
            profileNav = setTimeout(function() {$("#subnav_profile").fadeOut("fast");$("#n-profile .gnav").removeClass('on');}, 250);
        });
        $("#subnav_profile").hover(function(){
            if (profileNav) clearTimeout(profileNav);
        }, function() {
            profileNav = setTimeout(function() {$("#subnav_profile").fadeOut("fast");}, 250);
           	$("#n-profile .gnav").removeClass('on');
    });	
	
	/* --- PEOPLE SUBNAV --- */
	var peopleNav = false;
	 $("#n-people .gnav").hover(function(){
            if (peopleNav) clearTimeout(peopleNav);
            $("#subnav_people").fadeIn("fast");
            $("#n-people .gnav").addClass('on');
        }, function() {
            peopleNav = setTimeout(function() {$("#subnav_people").fadeOut("fast");$("#n-people .gnav").removeClass('on');}, 250);
        });
        $("#subnav_people").hover(function(){
            if (peopleNav) clearTimeout(peopleNav);
        }, function() {
            peopleNav = setTimeout(function() {$("#subnav_people").fadeOut("fast");}, 250);
           	$("#n-people .gnav").removeClass('on');
    });	
	
	/* --- PORTFOLIO SUBNAV --- */
	var portfolioNav = false;
	 $("#n-portfolio .gnav").hover(function(){
            if (portfolioNav) clearTimeout(portfolioNav);
            $("#subnav_portfolio").fadeIn("fast");
            $("#n-portfolio .gnav").addClass('on');
        }, function() {
            portfolioNav = setTimeout(function() {$("#subnav_portfolio").fadeOut("fast");$("#n-portfolio .gnav").removeClass('on');}, 250);
        });
        $("#subnav_portfolio").hover(function(){
            if (portfolioNav) clearTimeout(portfolioNav);
        }, function() {
            portfolioNav = setTimeout(function() {$("#subnav_portfolio").fadeOut("fast");}, 250);
           	$("#n-portfolio .gnav").removeClass('on');
    });
	
	/* --- PRESS SUBNAV --- */
	var pressNav = false;
	 $("#n-press .gnav").hover(function(){
            if (pressNav) clearTimeout(pressNav);
            $("#subnav_press").fadeIn("fast");
            $("#n-press .gnav").addClass('on');
        }, function() {
            pressNav = setTimeout(function() {$("#subnav_press").fadeOut("fast");$("#n-press .gnav").removeClass('on');}, 250);
        });
        $("#subnav_press").hover(function(){
            if (pressNav) clearTimeout(pressNav);
        }, function() {
            pressNav = setTimeout(function() {$("#subnav_press").fadeOut("fast");}, 250);
           	$("#n-press .gnav").removeClass('on');
    });
	
});

/*  SIGN UP FOCUS FIELD */		
$(document).ready(function() {
			$('input[type="text"]').addClass("idleField");
       		$('input[type="text"]').focus(function() {
       			$(this).removeClass("idleField").addClass("focusField");
    		    if (this.value == this.defaultValue){ 
    		    	this.value = '';
				}
				if(this.value != this.defaultValue){
	    			this.select();
	    		}
    		});
    		$('input[type="text"]').blur(function() {
    			$(this).removeClass("focusField").addClass("idleField");
    		    if ($.trim(this.value) == ''){
			    	this.value = (this.defaultValue ? this.defaultValue : '');
				}
    		});
});