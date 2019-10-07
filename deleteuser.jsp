<%@page import="com.yash.database.UserDao"%>

<jsp:useBean id="u" class="com.yash.bean.User"></jsp:useBean>

<jsp:setProperty property="*" name="u" />

<%
	UserDao.delete(u);

	response.sendRedirect("/UserManagement/UserView");
%>

