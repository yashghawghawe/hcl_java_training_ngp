<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>
<br/>
<!-- getValues.jsp?name=Yash -->
<p><% out.println("some text to Display.."); %></p>
<p>In param you passed name:
	<%= request.getParameter("name") %>
	</p>
	
	<p>
	storing a string to the session...</br>
	<% session.setAttribute("myName","Yash"); %>
	Retrieving the string from session..</br>
	<b>Name:</b> <%= session.getAttribute("myName") %>
	</p>
	
	<p>
	storing a string to the application..<br/>
	<%application.setAttribute("myName","Yash"); %>
	Retrieving the string from application..<br/>
	<b>Name:</b>
	<%=application.getAttribute("myName") %> 
	</p>
	<p>
	storing a string to the Page context..<br/>
	<% pageContext.setAttribute("myName", "Yash"); %>
	Retrieving the string from the page Context<br/>
	<b>Name:</b>
	<%=pageContext.getAttribute("myName") %>
</p>
</body>
</html>