
	//Footer Show when scrolled to bottom
	var lastScrollTop = 0;
	$(window).scroll(function(event){
		var st = $(this).scrollTop();
		if (st < lastScrollTop){
			$("nav.navbar-fixed-bottom").hide();
		} 
		lastScrollTop = st;
	});
	$(window).on("scroll", function() {
		if($.browser.chrome) {
			if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
				$("nav.navbar-fixed-bottom").show();
			}
		}
		if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			$("nav.navbar-fixed-bottom").show();
		}
	});
