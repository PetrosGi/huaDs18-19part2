<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body>
<h1>List of users</h1>
<p>
	<button onclick="window.location.href = 'adminUserAdd'"; return=false;>Add User</button>
</p>
<table border="1">
<tr>
<th>Username</th>
<th>enabled</th>
<th>Action</th>
</tr>
<c:forEach items="${user}" var="u">
<c:url var="edit" value="adminUserEdit">
		<c:param name="uId" value="${u.username}"></c:param>
	</c:url>
	<c:url var="delete" value="userDelete">
		<c:param name="uId" value="${u.username}"></c:param>
</c:url>
<c:url var="auth" value="addAuth">
		<c:param name="uId" value="${u.username}"></c:param>
</c:url>
	<tr>
	<td>${u.username}</td>
	<td>${u.enabled}</td>
	<td>
		<a href="${edit}"> Edit</a> | <a href="${delete}"> Delete</a> | <a href="${auth}"> Set Role</a>
	</td>
	</tr>
</c:forEach>

</table>
	
	<a href="<c:url value="/logout" />">log out</a>
</body>
</html>