<%@page import="com.yash.database.*"%>

<jsp:useBean id="u" class="com.yash.bean.User"></jsp:useBean>

<jsp:setProperty property="*" name="u"/>

<%

int i=UserDao.save(u);

if(i>0){
 response.sendRedirect("/UserManagement/UserAddSuccess");
}else{
 response.sendRedirect("/UserManagement/UserAddError");
}
%>  

