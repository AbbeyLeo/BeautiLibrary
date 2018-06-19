<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "com.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AdminLogin.jsp' starting page</title>
    
	 <link rel="stylesheet" type="text/css" href="css/style.css" />
 

		<script type="text/javascript">
			Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
		</script>
		<script src="js/InputFunction.js"></script>

  </head>
  
  <body onunload="<%session.invalidate();%>">
    
    	<header>
    	<h1><center>图书信息管理系统</center></h1>
    	</header>
		<div class="wrapper">
			
			
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">
					
					<form class="login active" name="loginForm" action="CheckAdmin.jsp" Method="post">
						<h3>超级管理员登录</h3>
						<div>
							<label>用户名:</label>
							<input name="username" type="text" onblur="InputNameOnBlurCheck()" onfocus="OnNameFocus()"/>
							<span class="error" id = "nameError">&nbsp;</span>
						</div>
						<div>
							<label>密码: </label>
							<input name="password" type="password" onblur="InputPwdOnBlurCheck()" onfocus="OnPwdFocus()"/>
							<span class="error" id = "PwdError">&nbsp;</span>
						</div>
						<div class="bottom">
							<div class="remember" name="remember"><input type="checkbox" /><span>记住密码？</span></div>
							<input type="submit" name="loginBt" value="登录"></input>
							<a href="/BeautiLibrary/Login" rel="Adimin" class="linkform">点击进入管理员登录！</a>
							<div class="clear"></div>
						</div>
					</form>
				</div>
			</div>
<h1>              </h1>
		</div>

    </body>
</html>
