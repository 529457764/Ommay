$(function () {
	var $navbar = $("nav.navbar");
	var navTop = $navbar.offset().top;
	$(window).bind("scroll", function(e) {
		var winScrollTop = $(this).scrollTop();
		//到一定高度，设置nav为navbar-fixed-top
		if (winScrollTop >= navTop -1) {
			$navbar.addClass("navbar-fixed-top");
		} else {
			$navbar.removeClass("navbar-fixed-top");
		}
	});
})