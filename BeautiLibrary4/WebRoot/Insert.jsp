<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="user" class="com.bean.User" scope="session"/>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>添加我的书本</title>
<link rel="stylesheet" type="text/css" href="../css/InsStyle.css" />
<link rel="stylesheet" type="text/css" href="../css/demo.css"/>
<link rel="stylesheet" type="text/css" href="../css/InsertTitle.css"/>
<script src="../js/AddFunction.js"></script>
</head>

<body >
			<header>
				<h1>图书信息管理系统</h1>	
				<nav class="codrops-demos">
					<a href="/BeautiLibrary/Logined/BookInfo" title="Books infomations">书本信息</a>
					<a href="/BeautiLibrary/Logined/Insert" title="AddBooks">添加书本</a>
					<a href="#" title="zhuxiao">注销登录</a>
				</nav>
			</header>
<div id = "content" class = "content">
	<div class="insert_form_d">
		<form id="insert_form" class="insert_form" name="insert_form" method="post" action="/BeautiLibrary/Logined/DoInsert">
        	<div id="head">
            <div id="topN"></div>
            <h3><div>添&nbsp;&nbsp;&nbsp;加</div></h3>
            
            </div>
            <div>
            	<label>书&nbsp;&nbsp;名：</label>
                <input type="text" name="Bname" onblur="InputBnameCheck()" onfocus="OnBnameFocus()">
                <span class="error" id="nameError">&nbsp;</span>
            </div>
            <div>
            	<label>类&nbsp;&nbsp;型：</label>
                <input type="text" name="Btype" onblur="InputBtypeCheck()" onfocus="OnBtypeFocus()">
                <span class="error" id="typeError">&nbsp;</span>
            </div>
            <div>
            	<label>价&nbsp;&nbsp;格：</label>
                <input type="text" name="Bprice" onblur="InputBpriceCheck()" onfocus="OnBpriceFocus()">
                <span class="error" id="priceError">&nbsp;</span>
            </div>
            <div id="1">
            	<label>作&nbsp;&nbsp;者：</label>
                <input type="text" name="Bauthor" onblur="InputBauthorCheck()" onfocus="OnBauthorFocus()">
                <span class="error" id="authorError">&nbsp;</span>
            </div>
            <div id = "1">
            	<label>出版社：</label>
                <input type="text" name="Bpress" onblur="InputBpressCheck()" onfocus="OnBpressFocus()">
                <span class="error" id="PressError">&nbsp;</span>
            </div>
            <div id = "1">
            	<input type="submit" name="insert" value="添加">
            </div>
        </form>
    </div>
</div>
</body>
</html>

