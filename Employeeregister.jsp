<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Emp Register</title>
<style type="text/css">
body{
	color: blue;
}
.btn{
color: blue; border: 1px red solid ;
}
</style>
</head>
<body bgcolor="#CDFA03" >
<center>
	<!-- form action="employeedetail.jsp"  method="post" -->
	<form action="DetailsEmp" method="get">
	<h1 style="margin-top: 100px;">Employee Register form</h1>
	<table style="width: 21%; height:40%; border: 2px Red solid;margin-top: 35px;">
	<tr>
	<td>First Name</td>
	<td><input type="text" name="firstname" required="required" placeholder="Enter First Name" class="btn"></td>
	</tr>
	
	<tr>
	<td>Last Name</td>
	<td><input type="text" name="lastname" required="required" placeholder="Enter last Name" class="btn"></td>
	</tr>
	
	<tr>
	<td>Username</td>
	<td><input type="text" name="username" required="required" placeholder="Username" class="btn"></td>
	</tr>

	<tr>
	<td>Password</td>
	<td><input type="password" name="password" placeholder="********" class="btn"></td>
	</tr>
	
	<tr>
	<td>Address</td>
	<td><input type="text" name="address" required="required" placeholder="Enter Address" class="btn"></td>
	</tr>
	
	<tr>
	<td>Contact No.</td>
	<td><input type="text" name="contact" required="required" placeholder="Enter Contact no" class="btn"></td>
	</tr>
	
	</table>
	<input type="submit" value="submit">
	</form>
	</center>
</body>
</html>