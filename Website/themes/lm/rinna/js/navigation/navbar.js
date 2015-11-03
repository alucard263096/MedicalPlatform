$(function() {

	// Do our DOM lookups beforehand
	var nav_container = $(".nav-container");
	var nav = $(".navbar-inner");

	nav_container.waypoint({
		handler: function(event, direction) {
			nav.toggleClass('sticky', direction=='down');
			
			if (direction == 'down') nav_container.css({ 'height':nav.outerHeight() });
			else nav_container.css({ 'height':'auto' });
		},
		offset: 15
	});
	var sections = $("section");
	var navigation_links = $("nav a");
	
	sections.waypoint({
		handler: function(event, direction) {
		
			var active_section;
			active_section = $(this);
			if (direction === "up") active_section = active_section.prev();

			var active_link = $('nav a[href="#' + active_section.attr("id") + '"]');
			navigation_links.removeClass("selected");
			active_link.addClass("selected");

		},
		offset: '25%'
	})

});