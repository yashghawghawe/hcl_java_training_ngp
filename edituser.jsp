<%@page import="com.yash.database.UserDao"%>

<jsp:useBean id="u" class="com.yash.bean.User"></jsp:useBean>

<jsp:setProperty property="*" name="u" />

<%
	int i = UserDao.update(u);

	response.sendRedirect("/UserManagement/UserView");
%>

