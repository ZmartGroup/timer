//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker

$(document).ready(function(){

	$('.datepicker').datepicker({
		format: 'yyyy-mm-dd',
		todayBtn: true,
		autoclose: true
	});

});