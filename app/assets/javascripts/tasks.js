$(function() {
	$('.form-inline input[type=checkbox]').click(function() {
		$(this).closest('form').submit();
	});
});
