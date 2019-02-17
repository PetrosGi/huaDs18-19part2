<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>
<title>Internship Office</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fa-university, .fa-coffee {
	font-size: 200px
}

.bgimg-1 {
	background-position: center;
	background-size: cover;
	background-image: url("https://i.imgur.com/vUznwYS.jpg");
	min-height: 100%;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	box-sizing: border-box;
}

.container {
	padding: 4%;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	width: 50%; /* Could be more or less, depending on screen size */
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
<body>

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-sand w3-card w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-blue-gray w3-large w3-sand"
				href="javascript:void(0);" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="#"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white w3-hover-blue-gray">Αρχική</a>
			<a href="#logform"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki"
				onclick="document.getElementById('logform').style.display='block'; document.getElementById('idt').focus();"
				style="width: auto;">Σύνδεση</a> <a href="#about"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki">Πληροφορίες</a>
			<a href="#join"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki"
				id="navid">Συμμετοχή</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-sand w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="#"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Αρχική</a>
			<a href="#"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Σύνδεση</a>
			<a href="#"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Πληροφορίες</a>
			<a href="#"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Συμμετοχή</a>
		</div>
	</div>

	<!-- Header -->
	<header class="bgimg-1 w3-container  w3-center "
		style="padding: 258px 16px">
		<h1 class="w3-margin w3-jumbo w3-text-sand">Γραφείο Πρακτικής</h1>
		<c:if test="${param.error != null}">
			<div align="center" style="z-index: 1;">
				<div class="w3-panel w3-red w3-display-container w3-card-4"
					style="width: 60%; position: absolute; z-index: 2; left: 20%;">
					<span onclick="this.parentElement.style.display='none'"
						class="w3-button w3-large w3-display-topright">&times;</span>
					<h3>ERROR!</h3>
					<p>Λάθος στοιχεία σύνδεσης, προσπαθήστε ξανά.</p>
				</div>
			</div>
		</c:if>
		<button
			class="w3-button w3-sand w3-hover-khaki w3-padding-large w3-large w3-margin-top"
			onclick="document.getElementById('logform').style.display='block'; document.getElementById('idt').focus();"
			style="width: auto;">Σύνδεση</button>

	</header>
	<!-- First Grid -->
	<div class="w3-row-padding w3-padding-64 w3-container" id="about">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>Πληροφορίες</h1>
				<h5 class="w3-text-grey">Μέσω του γραφείου μας μπορεί
					οποιοσδήποτε φοιτητής του ιδρύματός μας να συνδεθεί με τον
					λογαριασμό που του παρέχεται στην εγγραφή. Μπορεί μέσω των
					υπηρεσιών μας να κάνει αίτηση για πρακτική σε κάποιον οργανισμό που
					συνεργάζεται μαζί μας και να δει τις αιτήσεις που έχει ήδη κάνει.</h5>
				<h5 class="w3-text-grey">Παρέχεται επίσης η δυνατότητα σε
					οποιονδήποτε οργανισμό να κάνει αίτηση για να ενταχθεί στους
					οργανισμούς που συνεργαζόνται μαζί μας.</h5>
			</div>

			<div class="w3-third w3-center">
				<i class="fa fa-university w3-padding-64 w3-text-khaki"></i>
			</div>
		</div>
	</div>

	<!-- Second Grid -->
	<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container"
		id="join">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>Συμμετοχή</h1>
				<div class="w3-container w3-light-grey" id="contact">

					<form:form action="api/addcorp" id="corpform" method="post">
						<p>
							<input class="w3-input w3-border" type="text"
								placeholder="Όνομα εταιρίας" required name="cname" path="cname">
						</p>
						<p>
							<input class="w3-input w3-border" type="text"
								placeholder="Email επικοινωνίας" required name="email"
								path="email">
						</p>
						<p>
							<textarea class="w3-input w3-border"
								placeholder="Αίτηση για συνεργασία με το γραφείο μας."
								style="height: 200px" form="corpform" name="petition"
								path="petition"></textarea>
						</p>
						<p class="w3-right w3-block">
							<input type="submit" class="w3-button w3-block w3-black"
								name="submit">

						</p>
					</form:form>
					
				</div>
			</div>
		</div>
	</div>

	<div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
		<h1 class="w3-margin w3-xlarge">
			<script type="text/javascript"
				src="https://www.brainyquote.com/link/quotebr.js"></script>
		</h1>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-padding-64 w3-center w3-opacity">
		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">w3.css</a>
		</p>
	</footer>



	<div id="logform" class="modal">
		<form:form class="modal-content animate w3-sand"
			action="${pageContext.request.contextPath}/authUser" method="POST">

			<div class="container">
				<label for="uname"><b>Όνομα Χρήστη</b></label> <input type="text"
					placeholder="Εισάγετε όνομα χρήστη" name="username" id="idt"
					required> <label for="psw"><b>Κωδικός</b></label> <input
					type="password" placeholder="Εισάγετε κωδικό" name="password"
					required>

				<button
					class="w3-block w3-khaki w3-hover-blue-gray w3-padding-mid w3-large"
					type="submit">Σύνδεση</button>
				<button type="button"
					onclick="document.getElementById('logform').style.display='none'"
					class="cancelbtn w3-block  w3-khaki w3-hover-blue-gray w3-padding-mid w3-large">Ακύρωση</button>
			</div>
		</form:form>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		// Get the modal
		var modal = document.getElementById('logform');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		$("a").on('click', function(event) {

			// Make sure this.hash has a value before overriding default behavior
			if (this.hash !== "") {
				// Prevent default anchor click behavior
				event.preventDefault();

				// Store hash
				var hash = this.hash;

				// Using jQuery's animate() method to add smooth page scroll
				// The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
				$('html, body').animate({
					scrollTop : $(hash).offset().top
				}, 900, function() {

					// Add hash (#) to URL when done scrolling (default click behavior)
					window.location.hash = hash;
				});
			} // End if
		});
	</script>

</body>
</html>
