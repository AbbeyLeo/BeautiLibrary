<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import = "com.bean.User"%>
<%@ page import = "com.dao.UserDao"%>
<%@ page import = "com.dao.UserDaoImpl" %>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="user" class="com.bean.User" scope="session"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CheckLogin</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   		String username=request.getParameter("username").trim();
   		//System.out.println(username);
      	String password=request.getParameter("password").trim();
      	HttpSession Session = request.getSession(true);
      	//System.out.println(((User)Session.getAttribute("user")).getUsername());
      	user = null;
		UserDao userdao = new UserDaoImpl();
		System.out.println(user.getUsername());
		if(user != null && user.getUsername().equals(username) && user.getPassword().equals(password) && user.getUsername() !=null && user.getPassword() != null && !user.getUsername().equals("") && !user.getPassword().equals(""))
		{
		System.out.println("1");
			Session.setAttribute("user", user);
			application.setAttribute("isQ", 1);
			request.getRequestDispatcher("/Logined/BookInfo").forward(request, response);
		}
		else
		{
			System.out.println("2");
			response.sendRedirect("/BeautiLibrary/Login");
		}
    %>
  </body>
</html>
