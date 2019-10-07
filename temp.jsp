-- index.jsp =============

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>JSP CRUD Example</title>

</head>

<body>

	<h1>JSP CRUD Example</h1>

	<a href="/UserManagement/UserAdd">Add User</a>

	<a href="/UserManagement/UserView">View Users</a>



</body>

</html>



-------------------------------- adduserform.jsp

-----------------------------

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Add User Form</title>

</head>

<body>



	<jsp:include page="/WEB-INF/userform.html"></jsp:include>



</body>

</html>





--------------------------- userform.html --------------------------

<a href="/UserManagement/UserView">View All Records</a>
<br />



<h1>Add New User</h1>

<form action="/UserManagement/UserAddAct" method="post">

	<table>

		<tr>
			<td>Name:</td>
			<td><input type="text" name="name" /></td>
		</tr>

		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" /></td>
		</tr>

		<tr>
			<td>Email:</td>
			<td><input type="email" name="email" /></td>
		</tr>

		<tr>
			<td>Sex:</td>
			<td><input type="radio" name="sex" value="male" />Male <input
				type="radio" name="sex" value="female" />Female</td>
		</tr>

		<tr>
			<td>Country:</td>
			<td><select name="country" style="width: 155px">

					<option>India</option>

					<option>Pakistan</option>

					<option>Afghanistan</option>

					<option>Berma</option>

					<option>Other</option>

			</select></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="Add User" /></td>
		</tr>

	</table>

</form>





----------------------------------- adduser.jsp

----------------------------------

<%@page import="com.dragon.dao.*"%>

<jsp:useBean id="u" class="com.dragon.bean.User"></jsp:useBean>

<jsp:setProperty property="*" name="u" />



<%
	int i = UserDao.save(u);

	if (i > 0) {

		response.sendRedirect("/UserManagement/UserAddSuccess");

	} else {

		response.sendRedirect("/UserManagement/UserAddError");

	}
%>







------------------------------------ adduser_success.jsp

-----------------------------------

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Add User Success</title>

</head>

<body>



	<p style="background-color: #008f88; color: white; align: center;">

		Record successfully saved!</p>

	<jsp:include page="/WEB-INF/userform.html"></jsp:include>



</body>

</html>





-------------------------- adduser_error.jsp --------------------------

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Add User Error</title>

</head>



<p>
	Sorry, a

	<body>n error occurred!
</p>

<jsp:include page="userform.html"></jsp:include>





</body>

</html>





------------------------------ viewusers.jps ---------------------------

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html <%@ pad>
<metage language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> <!DOCTYP


<body>



	<%@page import="com.dragon.dao.UserDao,com.dragon.bean.*,java.util.*"%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



	<h1>Users List</h1>



	<%
		List<User> list = UserDao.getAllRecords();

		request.setAttribute("list", list);
	%>



	<table border="1" style="width: 90%; align: center;">

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Password</th>
			<th>Email</th>

			<th>Sex</th>
			<th>Country</th>
			<th>Edit</th>
			<th>Delete</th>

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







--------------------------------- editform.jsp

-------------------------------

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Edit Form</title>

</head>

<body>

	<%@page import="com.dragon.dao.UserDao,com.dragon.bean.User"%>



	<%
		String id = request.getParameter("id");

		User u = UserDao.getRecordById(Integer.parseInt(id));
	%>



	<h1>Edit Form</h1>

	<form action="/UserManagement/EditUserAct" method="post">

		<input type="hidden" name="id" value="<%=u.getId()%>" />

		<table>

			<tr>
				<td>Name:</td>

				<td><input type="text" name="name" value="<%=u.getName()%>" />

				</td>

			</tr>

			<tr>
				<td>Password:</td>

				<td><input type="password" name="password"
					value="<%=u.getPassword()%>" /></td>

			</tr>

			<tr>
				<td>Email:</td>

				<td><input type="email" name="email" value="<%=u.getEmail()%>" />

				</td>

			</tr>

			<tr>
				<td>Sex:</td>

				<td><input type="radio" name="sex" value="male" />Male <input
					type="radio" name="sex" value="female" />Female</td>

			</tr>

			<tr>
				<td>Country:</td>

				<td><select name="country">

						<option>India</option>

						<option>Pakistan</option>

						<option>Afghanistan</option>

						<option>Berma</option>

						<option>Other</option>

				</select></td>

			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Edit User" /></td>
			</tr>

		</table>

	</form>



</body>

</html>







---------------------------- edituser.jsp ---------------------------

<%@page import="com.dragon.dao.UserDao"%>

<jsp:useBean id="u" class="com.dragon.bean.User"></jsp:useBean>

<jsp:setProperty property="*" name="u" />

<%
	int i = UserDao.update(u);

	response.sendRedirect("/UserManagement/UserView");
%>







---------------------------------- deleteuser.jsp

---------------------------------

<%@page import="com.dragon.dao.UserDao"%>

<jsp:useBean id="u" class="com.dragon.bean.User"></jsp:useBean>

<jsp:setProperty property="*" name="u" />

<%
	UserDao.delete(u);

	response.sendRedirect("/UserManagement/UserView");
%>





================ User.java ================ package com.dragon.bean;



public class User { private int id; private String
name,password,email,sex,country; //generate getters and setters public
int getId() { return id; } public void setId(int id) { this.id = id; }

public String getName() { return name; } public void setName(String
name) { this.name = name; } public String getPassword() { return
password; } public void setPassword(String password) { this.password =
password; } public String getEmail() { return email; } public void
setEmail(String email) { this.email = email; } public String getSex() {

return sex; } public void setSex(String sex) { this.sex = sex; } public
String getCountry() { return country; } public void setCountry(String
country) { this.country = country; } } =========================

UserDao.java ========================= package com.dragon.dao; import
java.sql.*; import java.util.ArrayList; import java.util.List; import
com.dragon.bean.User; public class UserDao { public static Connection
getConnection(){ Connection con=null; try{

Class.forName("com.mysql.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_ajax","root","");

}catch(Exception e){System.out.println(e);} return con; } public static
int save(User u){ int status=0; try{ Connection con=getConnection();

String Q2 = "insert into register " + "
(name,password,email,sex,country) " + " values(?,?,?,?,?) ";

PreparedStatement ps=con.prepareStatement(Q2);

ps.setString(1,u.getName()); ps.setString(2,u.getPassword());

ps.setString(3,u.getEmail()); ps.setString(4,u.getSex());

ps.setString(5,u.getCountry()); status=ps.executeUpdate();

}catch(Exception e){System.out.println(e);} return status; } public
static int update(User u){ int status=0; try{ Connection
con=getConnection(); String strQ = " update register " + " set
name=?,password=?, " + " email=?,sex=?,country=? where id=?";

PreparedStatement ps=con.prepareStatement(strQ);

ps.setString(1,u.getName()); ps.setString(2,u.getPassword());

ps.setString(3,u.getEmail()); ps.setString(4,u.getSex());

ps.setString(5,u.getCountry()); ps.setInt(6,u.getId());

status=ps.executeUpdate(); }catch(Exception e){System.out.println(e);}

return status; } public static int delete(User u){ int status=0; try{

Connection con=getConnection(); String strQuery1 = "delete from register
where id=?"; PreparedStatement ps=con.prepareStatement(strQuery1);

ps.setInt(1,u.getId()); status=ps.executeUpdate(); }catch(Exception
e){System.out.println(e);} return status; } public static List
<User> getAllRecords(){ List<User> list=new ArrayList<User>();



try{ Connection con=getConnection(); String strQuery1 = "select * from
register"; PreparedStatement ps=con.prepareStatement(strQuery1);

ResultSet rs=ps.executeQuery(); while(rs.next()){ User u=new User();

u.setId(rs.getInt("id")); u.setName(rs.getString("name"));

u.setPassword(rs.getString("password"));

u.setEmail(rs.getString("email")); u.setSex(rs.getString("sex"));

u.setCountry(rs.getString("country")); list.add(u); } }catch(Exception
e){System.out.println(e);} return list; } public static User
getRecordById(int id){ User u=null; try{ Connection con=getConnection();

String strQuery1 = "select * from register where id=?";

PreparedStatement ps=con.prepareStatement(strQuery1); ps.setInt(1,id);

ResultSet rs=ps.executeQuery(); while(rs.next()){ u=new User();

u.setId(rs.getInt("id")); u.setName(rs.getString("name"));

u.setPassword(rs.getString("password"));

u.setEmail(rs.getString("email")); u.setSex(rs.getString("sex"));

u.setCountry(rs.getString("country")); } }catch(Exception
e){System.out.println(e);} return u; } } ==================== web.xml

==================== <?xml version="1.0" encoding="UTF-8"?> <web-app
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
	id="WebApp_ID" version="4.0"> <display-name>UserManagement</display-name>



<servlet> <servlet-name>HomePage</servlet-name> <jsp-file>/WEB-INF/index.jsp</jsp-file>

</servlet> <servlet-mapping> <servlet-name>HomePage</servlet-name>

<url-pattern>/Home</url-pattern> </servlet-mapping> <servlet> <servlet-name>AddUser</servlet-name>

<jsp-file>/WEB-INF/adduserform.jsp</jsp-file> </servlet> <servlet-mapping>

<servlet-name>AddUser</servlet-name> <url-pattern>/UserAdd</url-pattern>

</servlet-mapping> <servlet> <servlet-name>AddUserForm</servlet-name> <jsp-file>/WEB-INF/userform.html</jsp-file>

</servlet> <servlet-mapping> <servlet-name>AddUserForm</servlet-name>

<url-pattern>/UserAddForm</url-pattern> </servlet-mapping> <servlet> <servlet-name>ViewUser</servlet-name>

<jsp-file>/WEB-INF/viewusers.jsp</jsp-file> </servlet> <servlet-mapping>

<servlet-name>ViewUser</servlet-name> <url-pattern>/UserView</url-pattern>servlet>

<servlet-name>EditUserAction</servlet-name> <jsp-file>/WEB-INF/edituser.jsp</jsp-file>

</servlet> <servlet-mapping> <servlet-name>EditUserAction</servlet-name>

<url-pattern>/EditUserAct</url-pattern> </servlet-mapping> <servlet> <servlet-name>DeleteUser</servlet-name>

<jsp-file>/WEB-INF/deleteuser.jsp</jsp-file> </servlet> <servlet-mapping>

<servlet-name>DeleteUser</servlet-name> <url-pattern>/DeleteUser</url-pattern>

</servlet-mapping> </servlet-mapping> <servlet> <servlet-name>AddUserAction</servlet-name> <jsp-file>/WEB-INF/adduser.jsp</jsp-file>

</servlet> <servlet-mapping> <servlet-name>AddUserAction</servlet-name>

<url-pattern>/UserAddAct</url-pattern> </servlet-mapping> <servlet> <servlet-name>AddUserSuccess</servlet-name>

<jsp-file>/WEB-INF/adduser_success.jsp</jsp-file> </servlet> <servlet-mapping>

<servlet-name>AddUserSuccess</servlet-name> <url-pattern>/UserAddSuccess</url-pattern>

</servlet-mapping> <servlet> <servlet-name>AddUserError</servlet-name> <jsp-file>/WEB-INF/adduser_error.jsp</jsp-file>

</servlet> <servlet-mapping> <servlet-name>AddUserError</servlet-name>

<url-pattern>/UserAddError</url-pattern> </servlet-mapping> <servlet> <servlet-name>EditUser</servlet-name>

<jsp-file>/WEB-INF/editform.jsp</jsp-file> </servlet> <servlet-mapping>

<servlet-name>EditUser</servlet-name> <url-pattern>/EditUser</url-pattern>

</servlet-mapping> </web-app> ================================= CREATE TABLE IF NOT EXISTS
`register` ( `id` int(10) NOT NULL AUTO_INCREMENT, `name` varchar(100)
NOT NULL, `password` varchar(100) NOT NULL, `email` varchar(100) NOT
NULL, `sex` varchar(10) NOT NULL, `country` varchar(100) NOT NULL,

PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT
CHARSET=latin1; INSERT INTO `register` (`id`, `name`, `password`,

`email`, `sex`, `country`) VALUES (1, 'Dragon', 'RK', 'rk@gmail.com',
'Male', 'India'), (2, 'Rocket', 'Singh', 'rsingh@aol.com', 'male',
'India'), (3, 'Rani', 'Devi', 'devi@yahoo.com', 'female', 'India'), (4,
'Jay Kishan', 'jk123', 'jk@aol.com', 'male', 'India'); COMMIT; 