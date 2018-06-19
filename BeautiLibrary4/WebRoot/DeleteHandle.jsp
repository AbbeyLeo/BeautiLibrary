<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.dao.BookDao" %>
<%@ page import="com.dao.BookDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.Book" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'DeleteHandle.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%   
   		List<Book> BookList = (List<Book>)application.getAttribute("BookList");
   		int isq =  Integer.parseInt(application.getAttribute("isQ")+"");
   		BookDao bookdao = new BookDaoImpl();
   		
   		if(!request.getParameterValues("DeleteCB").equals(null))
   		{
   			String id [] = request.getParameterValues("DeleteCB");
	   		for(int i = 0; i<id.length;i++)
	   		{
				bookdao.DeleteBookById(id[i]);	   		
	   		}
	   		application.setAttribute("BookList", BookList);
	   		application.setAttribute("isQ", isq);
	   		request.getRequestDispatcher("BookInfo").forward(request, response);
   		}
   		else
   		{
   			application.setAttribute("BookList", BookList);
	   		application.setAttribute("isQ", isq);
	   		request.getRequestDispatcher("BookInfo").forward(request, response);
   		}
    %>
  </body>
</html>
