<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set Role</title>
</head>
<body>

	<h1>Provide user Information</h1>

	<form:form action="adminSetAuth" modelAttribute="auth" items="${auth}" var="auth">
		<table border="1">
			<tr>
				<td>Username :</td>
				<td><form:input type="text" name="username" path="username"
						value="${auth.username}" /></td>
			</tr>
			<tr>
			<td>
			Role :
			</td>
				<td><form:select name="authority" path="authority">
						<form:option value="ROLE_ADMIN">Admin</form:option>
						<form:option value="ROLE_OFFICE">Office</form:option>
						<form:option value="ROLE_USER">User</form:option>
					</form:select></td>
			<tr>
				<td></td>
				<td><input type="submit" name="submit" value="Αποθήκευση Ρόλου"></td>
			</tr>
		</table>
	</form:form>
	<a href="listUsers">Go to list</a>	<br>
	<a href="<c:url value="/logout" />">log out</a>
</body>
</html>