<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import = "com.bean.User"%>
<%@ page import = "com.dao.UserDao"%>
<%@ page import = "com.dao.UserDaoImpl" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CheckAdmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
        String username=request.getParameter("username").trim();
      	String password=request.getParameter("password").trim();
      	HttpSession Session = request.getSession(true);
      	User user = new User();
		UserDao userdao = new UserDaoImpl();
		user = userdao.Query(username);
		if(user.getUsername().equals("admin") && user.getPassword().equals("admin"))
		{
			Session.setAttribute("user", "admin");
			application.setAttribute("isQ", 0);
			request.getRequestDispatcher("/Logined/ManagerUser").forward(request, response);
		}
		else
		{
		
			response.sendRedirect("/BeautiLibrary/AdminLogin");
		}
    %>
  </body>
</html>
