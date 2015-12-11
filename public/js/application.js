$(document).ready(function() {
   var btn = $("#question-btn")
   var form = $("#question-form")

   form.hide();
	 btn.on('click',function() {
    /* AJAX calls and insertion into #productionForm */
   btn.hide();
   form.show();

});
	formHandler();
	logoutHandler();
});

var formHandler = function() {
	$('body').on('click', '.popup_form', function(event) {
		event.preventDefault();
		var targetUrl = $(this).attr('href')
		var response = $.ajax({
			method: 'GET',
			url: targetUrl
		});
		response.done(function(data) {
			clearForms();
			$('.show_form').append(data);
		});
	});
}

var logoutHandler = function() {
	$('body').on('click', '#log_out', function(event) {
		event.preventDefault();
		var userId = $(this).attr('href').match(/\d+/)
		var response = $.ajax({
			method: 'DELETE',
			url: '/sessions/' + userId
		});
		response.done(function() {
			location.reload();
		});
		response.fail(function() {
			console.log('Logout Failed');
		});
	});
}

var clearForms = function () {
	$('.show_form').empty();
}

$("#form1").submit(function() {
    /* AJAX calls and insertion into #productionForm */
    $("#productionForm").show();
    return false;
});
