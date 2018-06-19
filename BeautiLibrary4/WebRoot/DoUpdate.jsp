<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <meta http-equiv="content-type" content = "text/html" charset=UTF-8">
    <title>Do Update</title>
   

  </head>
  
  <body>
    <%   
     	request.setCharacterEncoding("UTF-8");//传值编码
  		response.setContentType("text/html;charset=UTF-8");//设置传输编码
   		int isq =  Integer.parseInt(application.getAttribute("isQ")+"");
   		BookDao bookdao = new BookDaoImpl();
   		
   		
   		String EditId [] = request.getParameterValues("Bid");
   		
   			Book book = new Book();
   			for(int i = 0; i<EditId.length;i++)
	   		{
	   			//String Id = new String(EditId[i].getBytes("ISO-8859-1"),"UTF-8");
	   			if(!EditId[i].equals("a"))
	   			{
	   				System.out.println(EditId[i]);
		   			book.setId(EditId[i]);
		   			book.setBname(request.getParameter(EditId[i]+"Bname").trim());
					book.setBtype(request.getParameter(EditId[i]+"Btype").trim());
					book.setBprice(request.getParameter(EditId[i]+"Bprice").trim());
					book.setBauthor(request.getParameter(EditId[i]+"Bauthor").trim());
					book.setPress(request.getParameter(EditId[i]+"Bpress").trim());
					bookdao.UpdateBook(book); 
				}   		
	   		} 
	   		List<Book> BookList = bookdao.QueryAll(); 
	   		application.setAttribute("BookList", BookList);
	   		application.setAttribute("isQ", 1);
	   		request.getRequestDispatcher("BookInfo").forward(request, response);
   		
   		
   		
    %>
  </body>
</html>
