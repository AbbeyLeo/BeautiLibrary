<%@ page language="java" import="java.util.*" pageEncoding="uTF-8"%>
<%@ page import="com.bean.Book" %>
<%@ page import="com.dao.BookDao" %>
<%@ page import="com.dao.BookDaoImpl" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Do Insert</title>
    
  </head>
  
  <body>
    <%
    	String BName = new String(request.getParameter("Bname").trim().getBytes("ISO-8859-1"),"utf-8");
    	String BType=new String(request.getParameter("Btype").trim().getBytes("ISO-8859-1"),"utf-8");
    	String BPrice=new String(request.getParameter("Bprice").trim().getBytes("ISO-8859-1"),"utf-8");
    	String BAuthor=new String(request.getParameter("Bauthor").trim().getBytes("ISO-8859-1"),"utf-8");
    	String BPress=new String(request.getParameter("Bpress").trim().getBytes("ISO-8859-1"),"utf-8");
    	Book book = new Book();
    	book.setBname(BName);
    	book.setBtype(BType);
    	book.setBprice(BPrice);
    	book.setBauthor(BAuthor);
    	book.setPress(BPress);
    	BookDao bookdao = new BookDaoImpl();
    	bookdao.InsertBooks(book);
		application.setAttribute("isQ", 1);
		request.getRequestDispatcher("BookInfo").forward(request, response);
     %>
  </body>
</html>
