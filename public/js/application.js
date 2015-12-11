$(document).ready(function() {

   var btn = $("#question-btn");
   var form = $("#question-form");

   var btnComment = $("#comment-btn");
   var formComment = $("#comment-form");

   var btnAnswer = $("#answer-btn");
   var formAnswer = $("#answer-form");

   formAnswer.hide();
   formComment.hide();
   form.hide();

	 btn.on('click',function() {
   btn.hide();
   form.show();
});

  btnComment.on('click',function() {
   btnComment.hide();
   formComment.show();
});

   btnAnswer.on('click',function() {
   btnAnswer.hide();
   formAnswer.show();
});

$('input[type=submit]').click(function() {
  // event.preventDefault();
  // console.log(this)
  // console.log($(this))
  // console.log($(this).parent())
  // $(this).parent().child.hide();
  console.log($(this).siblings()[0])
  $(this).hide()
  $(this).siblings().show();
})

// $(".formzform").hide();
// for (i = 0; i < numberofbuttons; i++) {

//    var btnComment = $("#comment-btn" + i);
//    var formComment = $("#comment-form" + i);

//    // console.log(formComment);
//    // console.log(btnComment);
//    btnComment.on('click',function() {

//    btnComment.hide();
//    formComment.show();
//   });
// }



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
