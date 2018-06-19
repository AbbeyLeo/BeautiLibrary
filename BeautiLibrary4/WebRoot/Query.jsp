<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.BookDao" %>
<%@ page import="com.dao.BookDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.Book" %>
<%@ page import = "com.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="content-type" content = "text/html" charset=UTF-8">
    <title>Query</title>

  </head>
  
  <body>
  <%
    String Query=new String(request.getParameter("QueryInfo").trim().getBytes("ISO-8859-1"),"utf-8");
    
    if(Query.equals("") ||Query.equals(null))
   		{
   				 
				  BookDao bookdao = new BookDaoImpl();
				  List<Book> BookList =new ArrayList<Book>();
				  BookList = bookdao.QueryAll();
				  application.setAttribute("BookList", BookList);
				  application.setAttribute("isQ", 1);
				  request.getRequestDispatcher("BookInfo").forward(request, response);
   		}
   		else
   		{
	   		try {
				  int Qid = Integer.parseInt(Query);
				  BookDao bookdao = new BookDaoImpl();
				  List<Book> BookList =new ArrayList<Book>();
				  BookList = bookdao.QueryById(Qid);
				  application.setAttribute("BookList", BookList);
				  application.setAttribute("isQ", 2);
				  request.getRequestDispatcher("BookInfo").forward(request, response);
				  //response.sendRedirect("/BeautiLibrary/Logined/BookInfo");
				} catch (Exception e){
				  
				  BookDao bookdao = new BookDaoImpl();
				  List<Book> BookList =new ArrayList<Book>();
				  BookList = bookdao.QueryByBname(Query);
				  application.setAttribute("BookList", BookList);
				  application.setAttribute("isQ", 2);
				  request.getRequestDispatcher("BookInfo").forward(request, response);
				  //response.sendRedirect("/BeautiLibrary/Logined/BookInfo");
				}
				
   		}
  %>
  </body>
</html>
