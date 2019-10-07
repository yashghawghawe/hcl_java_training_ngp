<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	color: blue;
}
</style>
</head>
<body bgcolor="#F3E568">
	<a href="/UserManagement/UserView">View All Records</a>
	<br />
	<center>
	<h1>Add New User</h1>

	<form action="/UserManagement/UserAddAct" method="post">

		<table style="border: 1.5px red solid;">

			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" required="required" placeholder="enter name "/></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"  required="required" placeholder="**********"/></td>
			</tr>

			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" required="required" placeholder="enter email" /></td>
			</tr>

			<tr>
				<td>Sex:</td>
				<td><input type="radio" name="sex" value="male" checked="checked"/>Male <input
					type="radio" name="sex" value="female" />Female</td>
			</tr>

			<tr>
				<td>Country:</td>
				<td><select name="country" style="width: 155px">

						<option>Select Country</option>
						<option>India</option>

						<option>Pakistan</option>

						<option>Afghanistan</option>

						<option>Berma</option>

						<option>Other</option>

				</select></td>
			</tr>

			<tr>
				<td colspan="1"><input type="reset" value="Reset" /></td>
				<td><input type="submit" value="Submit"></td>
			</tr>

		</table>

	</form>
	</center>
</body>
</html>