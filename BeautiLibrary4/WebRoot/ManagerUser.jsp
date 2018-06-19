<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bean.User" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.UserDaoImpl" %>
<%@ page import="com.jdbc.dbtool.ShowUser" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="user" class="com.bean.User" scope="session"/>
<html lang="en" class="no-js">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ManagerUser.jsp' starting page</title>
    <title>管理员信息管理</title>
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
  
  <body onunload="<%session.invalidate();%>">
   
		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">

				
			</div>
			<header>
				<h1>图书信息管理系统</h1>	
				<nav class="codrops-demos">
					<a href="/BeautiLibrary/Logined/ManagerUser" title="Users infomations">管理员信息</a>
					<a href="/BeautiLibrary/Logined/Insert" title="AddUsers">添加管理员</a>
					<a href="/BeautiLibrary/Logined/Cancel" title="zhuxiao">注销登录</a>
					<!-- 查询 -->
					<form id="search-form" action="/BeautiLibrary/Logined/Query" method="post" >
					<tr style="width: 649px; "><td>
					</td><td><input type="text" name="QueryInfo" id="QueryInfo"><input type="submit" value="查询" id="QueryInfoBt"></td>
					</tr>
                    </form>
				</nav>
			</header>
			<div class="component">
			
			<form name="hiddenText_Form" method="post" action="/Logined/ManagerUser">
				<input type="hidden" name="isDel" id="isDel" value="isDel"/>
			</form>
			
			
			<form name = "DelSub" id = "DelSub" action="" method="post">
			
				<table>
					<thead>
						<tr>
							<th>编号</th>
							<th>用户名</th>
							<th>权限</th>
							<th>密码</th>					
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
						UserDao userdao = new UserDaoImpl();
						List<User> UserList = new ArrayList<User>();
						int isq = 1;
						try
						{
							isq = Integer.parseInt(application.getAttribute("isQ")+"");
						}catch(Exception e)
						{
							application.setAttribute("isQ", 1);
							request.getRequestDispatcher("/BeautiLibrary/Logined/ManagerUser").forward(request, response);
							//response.sendRedirect("/BeautiLibrary/Logined/BookInfo");
						}
						
						
						if(Integer.parseInt(application.getAttribute("isQ")+"") == 1)
						{
							
							UserList = userdao.QueryAll();	
						}
						else
						{
							UserList = (List<User>)application.getAttribute("UserList");
						}
						ShowUser st=new ShowUser();
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
						List<User> list=st.getAllUsersByPage(pageSize, pageIndex, UserList);//返回特定页数的数据
						 %>
						<%				
						 	int len = list.size();
						 	
						 	for(int i = 0; i<len; i++)
						 	{
						  %>
						 	
							<tr>
								<td><%=list.get(i).getId() %>
									<input type="text" id ="<%=list.get(i).getId()+"id" %>" name = "Bid" class = "form_input" value="a" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"usernameText" %>" style="display:inline;"><%=list.get(i).getUsername() %></span>
									<input type="text" id = "<%=list.get(i).getId()+"username" %>" name = "<%=list.get(i).getId()+"username"%>" class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"typeText" %>" style="display:inline;"><%=list.get(i).getType() %></span>
									<input type="text" id = "<%=list.get(i).getId()+"type" %>"  name = "<%=list.get(i).getId()+"type" %>" class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>
								<td><span class="TText" id = "<%=list.get(i).getId()+"passwordText" %>" style="display:inline;"><%=list.get(i).getPassword() %></span>
									<input type="text" id = "<%=list.get(i).getId()+"password" %>"  name = "<%=list.get(i).getId()+"password" %>"  class = "form_input" style="display:none;margin:0px 0px 0px 0px;width:100px;height:20px;"></td>								
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
					application.setAttribute("UserList", UserList);
				 %>
				<a href="/BeautiLibrary/Logined/ManagerUser?pageIndex=1">首页</a>   
                <a href="/BeautiLibrary/Logined/ManagerUser?pageIndex=<%=pageIndex-1 %>">上一页</a>
                  <%
                   for(int i=1;i<=totalpages;i++){%>
                   
                  <a href="/BeautiLibrary/Logined/ManagerUser?pageIndex=<%=i%>">&nbsp;&nbsp;<%=i%></a>
                   <%} %>
                    
           
                <a href="/BeautiLibrary/Logined/ManagerUser?pageIndex=<%=pageIndex+1 %>">下一页</a>  
                <a href="/BeautiLibrary/Logined/ManagerUser?pageIndex=<%=totalpages%>">末页</a>  
                <br/>  
                <p style="color:red">当前页数:<%=pageIndex%></p>  
                
		</div><!-- /container -->
</div>


	</body>
</html>
