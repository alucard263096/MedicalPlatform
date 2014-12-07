/*
Demo: Despiration Tutorial Parallax Demo
Author: Elias Ghosn - Despiration.com
Author URL: http://www.despiration.com/
Tutorial URL: http://www.ianlunn.co.uk/blog/code-tutorials/recreate-nikebetterworld-parallax/

License: http://creativecommons.org/licenses/by-sa/3.0/ (Attribution Share Alike). Please attribute work to Despiration.com simply by leaving these comments in the source code or if you'd prefer, place a link on your website to http://www.despiration.com/.

Dual licensed under the MIT and GPL licenses:
http://www.opensource.org/licenses/mit-license.php
http://www.gnu.org/licenses/gpl.html
*/

$(document).ready(function() { //when the document is ready...


	//save selectors as variables to increase performance
	var $window = $(window);
	var $firstBG = $('.parallax');
	var main_image = $(".parallax .main-image");
	var main_pattern = $(".parallax .main-pattern");
	
	var windowHeight = $window.height(); //get the height of the window
	
	
	//apply the class "inview" to a section that is in the viewport
	$('.parallax').bind('inview', function (event, visible) {
			if (visible == true) {
			$(this).addClass("inview");
			} else {
			$(this).removeClass("inview");
			}
		});

	//function that is called for every pixel the user scrolls. Determines the position of the background
	/*arguments: 
		x = horizontal position of background
		windowHeight = height of the viewport
		pos = position of the scrollbar
		adjuster = adjust the position of the background
		inertia = how fast the background moves in relation to scrolling
	*/
	function newPos(x, windowHeight, pos, adjuster, inertia){
		return x + "% " + (-((windowHeight + pos) - adjuster) * inertia)  + "px";
	}
	
	//function to be called whenever the window is scrolled or resized
	function Move(){ 
		var pos = $window.scrollTop(); //position of the scrollbar

		//if the first section is in view...
		if($firstBG.hasClass("inview")){
			//call the newPos function and change the background position
			$firstBG.css({'backgroundPosition': newPos(0, windowHeight, pos, 654, 0)}); 
			//call the newPos function and change the second background position
			main_image.css({'backgroundPosition': newPos(100, windowHeight, pos, 654, 0.1)});
			//call the newPos function and change the second background position
			main_pattern.css({'backgroundPosition': newPos(0, windowHeight, pos, 654, 0.2)}); 			
		}
	}
		
	$window.bind('scroll', function(){ //when the user is scrolling...
		Move(); //move the background images in relation to the movement of the scrollbar
	});
	
});