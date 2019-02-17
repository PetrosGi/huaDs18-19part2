<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>
<title>Corporation List</title>
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
<body >



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
	</header>

	<!-- First Grid -->
	<div id="" class="w3-row-padding w3-padding-64 w3-container" style="overflow-x: auto;">
	<div></div>
	<table class="w3-table w3-striped w3-border ">
    <tr>
      <th>Όνομα</th>
      <th>Email</th>
      <th>Action</th>
    </tr>
    <c:forEach items="${corp}" var="corp">
	<c:url var="check" value="checkC">
		<c:param name="id" value="${corp.id}"></c:param>
</c:url>
	<tr>
	<td>${corp.name}</td>
	<td>${corp.email}</td>
	<td>
		<a href="${check}" class="w3-button w3-black">Check Corporation</a>
	</td>
	</tr>
</c:forEach>
  </table>
  </div>
	</div>


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
		function show() {
			var a = document.getElementById("petButton");

			var c = document.getElementById("hide1");
			var d = document.getElementById("hide2");
			var e = document.getElementById("hide3");
			var f = document.getElementById("remclasses");
			var g = document.getElementById("regyear");
			var b = 0;
			g = (new Date()).getFullYear() - g.value;

			if (d.value) {
				b += 1;
			}
			if (e.value) {
				b += 1;
			}
			if (c.value) {
				b += 1;
			}

			if ((g < 3) || (f.value > 3) || (b > 2)) {
				a.className += " w3-disabled";
				a.disabled = true;
			}
		}

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
