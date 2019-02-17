<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>
<title>Student Information</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fas {
	font-size: 100px
}

.bgimg-1 {
	background-position: center;
	background-size: cover;
	background-image: url("https://i.imgur.com/0TWDBDA.png");
	min-height: 100%;
}
</style>
<body items="${student}" var="student"
	onload="show1();show2();show3();">



	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-sand w3-card w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-blue-gray w3-large w3-sand"
				href="javascript:void(0);" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="listStudents"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white w3-hover-blue-gray">Φοιτητές</a>
			<a href="listCorps"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white w3-hover-blue-gray">Εταιρίες</a>
				
				<a href="#info"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki">Στοιχεία
				φοιτητή</a>
				 <a id="pet1nav" href="#pet1"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki">Αίτηση
				#1</a>
				 <a id="pet2nav" href="#pet2"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki">Αίτηση
				#2</a> 
				<a id="pet3nav" href="#pet3"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki">Αίτηση
				#3</a>
				
				
			<div class="topnav-right">
				<a href="<c:url value="/logout" />"
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-khaki w3-right">Αποσύνδεση</a>
			</div>
		</div>


		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-sand w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="listStudents"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Φοιτητές</a>
			<a href="listCorps"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Εταιρίες</a>
			<a href="
				<c:url value="/logout" />"
				class="w3-bar-item w3-button w3-padding-large w3-hover-blue-gray">Αποσύνδεση</a>


		</div>
	</div>
	<!-- Header -->
	<header class="bgimg-1 w3-container " style="padding: 58px 16px;">
		<h1 class="w3-xlarge  "></h1>
	</header>

		<form:form action="changeStudent"  modelAttribute="student" items="${student}" var="student"  method="post">
		<input name="sid" path="sid" type="hidden" value="${student.sid}">
	<!-- First Grid -->
	<div id="info" class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>Στοιχεία φοιτητή</h1>
				<h5 class="w3-light-grey ">Όνομα : ${student.first_name}</h5>
				<h5>Επίθετο : ${student.last_name}</h5>
				<h5 class="w3-light-grey " >ΑΜ : ${student.sid}</h5>
				<h5>Email : ${student.email}</h5>
				<h5 class="w3-light-grey ">Έτος εγγραφής : ${student.registration_year}</h5>
				<h5>Αριθμός υπολειπόμενων μαθημάτων : ${student.remaining_classes}</h5>
				

				<input id="remclasses" type="hidden"
					value="${student.remaining_classes}"> <input id="regyear"
					type="hidden" value="${student.registration_year}">
			</div>

		</div>
	</div>

	<!-- second Grid -->
	<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container"
		id="pet1">
		<input id="hide1" type="hidden" value="${student.petition1}">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>Αιτηση #1</h1>
				<h5 class="w3-padding-15">Προς: ${student.dest1}</h5>
				<h5 class="w3-padding-15">Κατάσταση: ${student.status1}</h5>
				<h5 class="w3-padding-15">Αλλαγή κατάστασης σε : <form:select name="status1" path="status1">
						<form:option value="PENDING">PENDING</form:option>
						<form:option value="APPROVED">APPROVED</form:option>
						<form:option value="DENIED">DENIED</form:option>
					</form:select></h5>
		
				<p class="w3-text-grey">${student.petition1}
			
			</div>
			<div class="w3-third w3-center">
				<i class="fas fa-align-left w3-padding-64 w3-text-khaki"></i>
			</div>

			
		</div>
	</div>

	<!-- third Grid -->
	<div id="pet2" class="w3-row-padding w3-padding-64 w3-container ">
		<div class="w3-content">
			<input id="hide2" type="hidden" value="${student.petition2}">

			<div class="w3-third w3-center">
				<i class="fas fa-align-right w3-padding-64 w3-text-khaki"></i>
			</div>

			<div class="w3-twothird">
				<h1>Αιτηση #2</h1>
				<h5 class="w3-padding-15">Προς: ${student.dest2}</h5>
				<h5 class="w3-padding-15">Κατάσταση: ${student.status2}</h5>
				<h5 class="w3-padding-15">Αλλαγή κατάστασης σε : <form:select name="status2" path="status2">
						<form:option value="PENDING">PENDING</form:option>
						<form:option value="APPROVED">APPROVED</form:option>
						<form:option value="DENIED">DENIED</form:option>
					</form:select></h5>
				<p class="w3-text-grey">${student.petition2}</p>
			</div>
		</div>
	</div>
	<!-- t4 Grid -->
	<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container"
		id="pet3">
		<div class="w3-content">
			<input id="hide3" type="hidden" value="${student.petition3}">


			<div class="w3-twothird">
				<h1>Αιτηση #3</h1>
				<h5 class="w3-padding-15">Προς: ${student.dest3}</h5>
				<h5 class="w3-padding-15">Κατάσταση: ${student.status3}</h5>
				<h5 class="w3-padding-15">Αλλαγή κατάστασης σε : <form:select name="status3" path="status3">
						<form:option value="PENDING">PENDING</form:option>
						<form:option value="APPROVED">APPROVED</form:option>
						<form:option value="DENIED">DENIED</form:option>
					</form:select></h5>

				<p class="w3-text-grey">${student.petition3}</p>
			</div>

			<div class="w3-third w3-center">
				<i class="fas fa-align-left w3-padding-64 w3-text-khaki"></i>
			</div>
		</div>
	</div>
	<div class="w3-container w3-padding-64">
		
			<input type="submit" value="Αποθήκευση Αλλαγών" id="petButton"
				class="w3-button w3-light-grey w3-hover-blue-gray w3-hover-text-light-gray w3-large " />
		
		<!-- 	<button  id="petButton" class="w3-button w3-light-grey w3-hover-blue-gray w3-hover-text-light-gray w3-large ">Αίτηση Πρακτικής </button> -->
	</div>
</form:form>

	<div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
		<h1 class="w3-margin w3-xlarge">
		<script type="text/javascript" src="https://www.brainyquote.com/link/quotebr.js"></script></h1>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-padding-64 w3-center w3-opacity">
		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">w3.css</a>
		</p>
	</footer>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		

		function show1() {
			var x = document.getElementById("pet1");
			var z = document.getElementById("pet1nav");
			var y = document.getElementById("hide1");

			if (!y.value) {
				x.className += " w3-hide";
				z.className += " w3-hide";

			}
		}
		function show2() {
			var x = document.getElementById("pet2");
			var z = document.getElementById("pet2nav");
			var y = document.getElementById("hide2");

			if (!y.value) {
				x.className += " w3-hide";
				z.className += " w3-hide";
			}
		}

		function show3() {
			var x = document.getElementById("pet3");
			var z = document.getElementById("pet3nav");
			var y = document.getElementById("hide3");

			if (!y.value) {
				x.className += " w3-hide";
				z.className += " w3-hide";
			}
		}

		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
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
		        scrollTop: $(hash).offset().top
		      }, 900, function(){
		   
		        // Add hash (#) to URL when done scrolling (default click behavior)
		        window.location.hash = hash;
		      });
		    } // End if
		  });
		
		
	</script>

</body>
</html>
