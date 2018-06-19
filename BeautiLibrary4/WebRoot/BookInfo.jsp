<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.dao.BookDao" %>
<%@ page import="com.dao.BookDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bean.Book" %>
<%@ page import="com.jdbc.dbtool.ShowTool" %>
<%@ page import="com.bean.User" %>
<!DOCTYPE html>
<jsp:useBean id="user" class="com.bean.User" scope="session"/>

<html lang="en" class="no-js">
	<head>
		
		<title>图书信息管理</title>
		<meta http-equiv="content-type" content = "text/html" charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/demo.css" />
		<link rel="stylesheet" type="text/css" href="../css/component.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		
        <script type="text/javascript">
			Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
		</script>
		<script src="../js/isDel.js"></script>
        <script src="../js/isEdit.js"></script>
		<script src="js/isDel.js"></script>
        <script src="js/isEdit.js"></script>
	</head>
	<body >
	
	 
		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">

				
			</div>
			<header>
				<h1>图书信息管理系统</h1>	
				<nav class="codrops-demos">
					<a href="/BeautiLibrary/Logined/BookInfo" title="Books infomations">书本信息</a>
					<a href="/BeautiLibrary/Logined/Insert" title="AddBooks">添加书本</a>
					<a href="#" title="zhuxiao">注销登录</a>
					<!-- 查询 -->
					<form id="search-form" action="/BeautiLibrary/Logined/Query" method="post" >
					<tr style="width: 649px; "><td>
					</td><td><input type="text" name="QueryInfo" id="QueryInfo"><input type="submit" value="查询" id="QueryInfoBt"></td>
					</tr>
                    </form>
				</nav>
			</header>
			<div class="component">
			
			<form name="hiddenText_Form" method="post" action="/Logined/BookInfo">
				<input type="hidden" name="isDel" id="isDel" value="isDel"/>
			</form>
			
			
			<form name = "DelSub" id = "DelSub" action="" method="post">
			
				<table>
					<thead>
						<tr>
							<th>编号</th>
							<th>书名</th>
							<th>类型</th>
							<th>价格</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th id = "ManageH">
                            			<input id="ManageBt" type="button" name="ManageBt" value = "管理" onclick="isChar()" style="display:inline;"/>
                            			<input id="DelBt" type="button" name="DelBt" value="删除" onclick="isDel()"  style="display:none;"/>
                            			<input id="ChangeBt" type="button" name="ChangeBt" value="修改" onclick="isChange()"  style="display:none;"/>
                            			<input id="SureDel" type="submit" name="SureDel" value="确定" onclick=""  style="display:none;"/>
                            			<input id="QuitBt" type="button" name="QuitBt" value="取消" onclick="isQuit()"  style="display:none;"/>		
                            </th>
                            
						</tr>
					</thead>
					
					<tbody id = "tbody" name = "tbody1" >
					<%
						BookDao bookdao = new BookDaoImpl();
						List<Book> BookList = new ArrayList<Book>();
						int isq = 1;
						try
						{
							isq = Integer.parseInt(application.getAttribute("isQ")+"");
						}catch(Exception e)
						{
							application.setAttribute("isQ", 1);
							request.getRequestDispatcher("/BeautiLibrary/Logined/BookInfo").forward(request, response);
							//response.sendRedirect("/BeautiLibrary/Logined/BookInfo");
						}
						
						
						if(Integer.parseInt(application.getAttribute("isQ")+"") == 1)
						{
							
							BookList = bookdao.QueryAll();	
						}
						else
						{
							BookList = (List<Book>)application.getAttribute("BookList");
						}
						ShowTool st=new ShowTool();
						int pageSize=6;//每页显示的记录
						int totalpages=st.getTotalPage(pageSize);//最大页数
						String  currentPage=request.getParameter("pageIndex");//获取当前的页数
						if(currentPage==null)
						{
						currentPage="1";
						}
						int pageIndex=Integer.parseInt(currentPage);
						//添加逻辑判断，防止页数异常
						if(pageIndex<1)
						{
						pageIndex=1;
						}else if(pageIndex>totalpages)
						{
						pageIndex=totalpages;
						}
						List<Book> list=st.getAllBooksByPage(pageSize, pageIndex, BookList);//返回特定页数的数据
						 %>
						<%				
						 	int len = list.size();
						 	
						 	for(int i = 0; i<len; i++)
						 	{
						  %>
						 	
							<tr>
								<td><%=list.get(i).getId() %>
									<input type="text" id ="<%=list.get(i).getId()+"Bid" %>" name = "Bid" class = "form_input" value="a" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"BnameText" %>" style="display:inline;"><%=list.get(i).getBname() %></span>
									<input onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
									 type="text" id = "<%=list.get(i).getId()+"Bname" %>" name = "<%=list.get(i).getId()+"Bname"%>" class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"BtypeText" %>" style="display:inline;"><%=list.get(i).getBtype() %></span>
									<input onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"
									 type="text" id = "<%=list.get(i).getId()+"Btype" %>"  name = "<%=list.get(i).getId()+"Btype" %>" class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"BpriceText" %>" style="display:inline;"><%=list.get(i).getBprice() %></span>
									<input onkeyup="value=value.replace(/[^\d\.]/g,'')"
									 type="text" id = "<%=list.get(i).getId()+"Bprice" %>"  name = "<%=list.get(i).getId()+"Bprice" %>"  class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"BauthorText" %>" style="display:inline;"><%=list.get(i).getBauthor() %></span>
									<input onkeyup="value=value.replace(/[^\a-\z\A-\Z\u4E00-\u9FA5]/g,'')"
									 type="text" id = "<%=list.get(i).getId()+"Bauthor" %>"  name = "<%=list.get(i).getId()+"Bauthor" %>" class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"BpressText" %>" style="display:inline;"><%=list.get(i).getPress() %></span>
									<input onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
									 type="text" id = "<%=list.get(i).getId()+"Bpress" %>"  name = "<%=list.get(i).getId()+"Bpress" %>" class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><input type="checkbox" id="<%=list.get(i).getId()+"DeleteCB"%>" name = "DeleteCB" value="<%=list.get(i).getId() %>" style="display:none;">
									<input type="button" id = "<%=list.get(i).getId()+"Update" %>"  name = "Update" class="updateC" value = "修改" onclick="isEdit('<%=list.get(i).getId() %>')" style="display:none;">
									<input type="submit" name = "UpdateAct" id="<%=list.get(i).getId()+"UpdateAct" %>" value="提交" class="UpdateCl" style="display:none;"> 
									<input type="button" id = "<%=list.get(i).getId()+"Cancel" %>" name="Cancel" value="取消" onclick="isEdit('<%=list.get(i).getId() %>')" style="display:none;">
									</td>
							</tr>				  
						<%} %>
						
					</tbody>
				
				</table>
				</form>
				
					
				<%
					application.setAttribute("isQ", isq);
					application.setAttribute("BookList", BookList);
				 %>
				<a href="/BeautiLibrary/Logined/BookInfo?pageIndex=1">首页</a>   
                <a href="/BeautiLibrary/Logined/BookInfo?pageIndex=<%=pageIndex-1 %>">上一页</a>
                  <%
                   for(int i=1;i<=totalpages;i++){%>
                   
                  <a href="/BeautiLibrary/Logined/BookInfo?pageIndex=<%=i%>">&nbsp;&nbsp;<%=i%></a>
                   <%} %>
                    
           
                <a href="/BeautiLibrary/Logined/BookInfo?pageIndex=<%=pageIndex+1 %>">下一页</a>  
                <a href="/BeautiLibrary/Logined/BookInfo?pageIndex=<%=totalpages%>">末页</a>  
                <br/>  
                <p style="color:red">当前页数:<%=pageIndex%></p>  
                
		</div><!-- /container -->
</div>


	</body>
</html>