$(document).ready(function() {
	$(".navbar-toggler").on("click", function() {
		$(".mobileMenu").toggleClass("open");
	});
});


function validate_form() {
	if (document.form.name.value == "") {
		alert("Enter Your Name");
		return false;
	}
	if (document.form.email.value == "") {
		alert("Enter Your Email Address");
		return false;
	}
	if (document.form.text.value == "") {
		alert("Enter Some Text");
		return false;
	}
	alert("Sucessfully Submitted");
}