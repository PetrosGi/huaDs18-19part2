<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>
</head>
<body>

	<h1>Provide user Information</h1>

	<form:form action="addUser" modelAttribute="user" items="${user}" var="user">
		<table border="1">
			<tr>
				<td>Username :</td>
				<td><form:input type="text" name="username" path="username"
						value="${user.username}" /></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><form:input type="text" name="password" value="changeit"
						path="password" /></td>
			</tr>
			<tr>
				<td>Enabled :</td>
				<td><input type="checkbox" name="enabled" value="1"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit" name="submit" value="Αποθήκευση Χρήστη"></td>
			</tr>
		</table>
	</form:form>
	<a href="listUsers">Go to list</a>	<br>
	<a href="<c:url value="/logout" />">log out</a>
</body>
</html>