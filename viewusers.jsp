<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
<style type="text/css">
body{
color: blue;
}
td{
border: 0.5px green solid;
}
th{
border: 0.5px green solid;
}
</style>
</head>
<body bgcolor="#B0F1E5">
	<%@page import="com.yash.database.UserDao,com.yash.bean.*,java.util.*"%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<h1>Users List</h1>
	<%
		List<User> list = UserDao.getAllRecords();

		request.setAttribute("list", list);
	%>

	<table border="1" style="width: 90%; align: center;border-color: 1.5px red solid;">

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Password</th>
			<th>Email</th>

			<th>Sex</th>
			<th>Country</th>
			<th>Action</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${list}" var="u">

			<tr>
				<td>${u.getId()}</td>
				<td>${u.getName()}</td>

				<td>${u.getPassword()}</td>
				<td>${u.getEmail()}</td>

				<td>${u.getSex()}</td>
				<td>${u.getCountry()}</td>

				<td><a href="/UserManagement/EditUser?id=${u.getId()}">Edit</a></td>

				<td><a href="/UserManagement/DeleteUser?id=${u.getId()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="/UserManagement/UserAdd">Add New User</a>

</body>

</html>