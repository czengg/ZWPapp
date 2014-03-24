$(document).ready(function() {
	$(".show_hide").hide();
	$(".show_hide").addClass("plus").show();

	$(".show_hide").click(function() {
		function() {
			$(this).addClass("minus");
			$(this).removeClass("plus");
		},
		function() {
			$(this).addClass("plus");
			$(this).removeClass("minus");
		}
	});
});