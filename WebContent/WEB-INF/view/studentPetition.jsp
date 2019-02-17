<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<title>Internship Petition</title>
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
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.bgimg-1 {
	background-position: center;
	background-size: cover;
	background-image: url("https://i.imgur.com/0TWDBDA.png");
	min-height: 100%;
}
</style>
<body items="${student}" var="student" onload="">



	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-sand w3-card w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-blue-gray w3-large w3-sand"
				href="javascript:void(0);" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="/ds/api/studentTest/${student.sid}"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white w3-hover-blue-gray">Αρχική</a>
			<div class="topnav-right">
				<a href="<c:url value="/logout" />"
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki w3-right">Αποσύνδεση</a>
			</div>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-sand w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="#"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Αρχική</a>
			<c:url value="/logout" />
			" class="w3-bar-item w3-button w3-padding-large
			w3-hover-blue-gray">Αποσύνδεση</a>

		</div>
	</div>

	<!-- Header -->
	<header class="bgimg-1 w3-container " style="padding: 58px 16px;">
		<h1 class="w3-xlarge  ">Χρήστης, ${student.first_name}.</h1>
	</header>
	<div class="w3-row-padding  w3-padding-64 w3-container" id="join">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>Αίτηση Πρακτικής</h1>
				<div class="w3-container " id="">

					<form:form action="addPetition" id="internform" method="post">
						<input id="hide1" type="hidden" name="choice" value="">
						<input type="hidden" name="sid" value="${student.sid}">
						<p>
							<input id="desta" class="w3-input w3-border" type="text"
								placeholder="Όνομα εταιρίας" required name="dest">
						</p>
						<p>
							<textarea id="pett" class="w3-input w3-border"
								placeholder="Αίτηση Πρακτικής." style="height: 200px"
								form="internform" name="pett" path="pett"></textarea>
						</p>
						<p class="w3-right w3-block">
							<input type="submit"
								class="w3-button w3-light-grey w3-hover-blue-gray w3-hover-text-light-gray w3-large "
								value="Καταχώρηση Αίτησης">

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
	</script>

</body>
</html>