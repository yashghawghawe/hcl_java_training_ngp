<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Emp Register</title>
</head>
<body>
	<h1>Employee Register form</h1>
	<!-- form action="employeedetail.jsp"  method="post" -->
	<form action="detailsEmp" method="post">
	<table style="width: 50%">
	<tr>
	<td>First Name</td>
	<td><input type="text" name="Firstname"></td>
	</tr>
	
	<tr>
	<td>Last Name</td>
	<td><input type="text" name="Lastname"></td>
	</tr>
	
	<tr>
	<td>Username</td>
	<td><input type="text" name="username"></td>
	</tr>

	<tr>
	<td>First Name</td>
	<td><input type="password" name="Password"></td>
	</tr>
	
	<tr>
	<td>Address</td>
	<td><input type="text" name="Firstname"></td>
	</tr>
	
	<tr>
	<td>Contact No.</td>
	<td><input type="text" name="contact"></td>
	</tr>
	
	</table>
	<input type="submit" value="submit">
	</form>
</body>
</html>