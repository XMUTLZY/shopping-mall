<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <title>login</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	  <script type="text/javascript" src="../js/jquery.min.js"></script>
  </head>

  <style>
	  a {
		  text-decoration: none;
		  color: black;
	  }

	  body {
		  background-image: url("../images/background1.jpg");
		  background-size: cover;
	  }

	  .login {
		  height: 500px;
		  width: 353px;
		  margin: 80px auto;
		  background: white;
		  border-radius: 10px;
		  opacity: 0.8;
	  }

	  .login-title {
		  font-size: 25px;
		  font-family: "楷体";
		  width: 400px;
		  height: 230px;
	  }

	  .login-title ul li:nth-child(1) {
		  cursor: pointer;
		  width: 80px;
		  height: 30px;
		  float: left;
		  padding-right: 30px;
		  margin-left: 27px;
		  margin-top: 100px;
		  list-style: none;
	  }

	  .login-title ul li:nth-child(2) {
		  width: 80px;
		  height: 30px;
		  cursor: pointer;
		  margin-top: 100px;
		  padding-left: 30px;
		  border-left-style: solid;
		  border-color: black;
		  float: left;
		  list-style: none;
	  }

	  .login-counter-image img {
		  width: 30px;
		  height: 30px;
		  float: left;
		  padding-left: 30px;
	  }

	  .login-center-input input {
		  margin-left: 20px;
		  width: 230px;
		  height: 30px;
		  padding-left: 10px;
		  margin-bottom: 30px;
		  border-bottom: 1px solid #cccccc;
		  border-top: 1px solid #ffffff;
		  border-left: 1px solid #ffffff;
		  border-right: 1px solid #ffffff;
		  float: left;
	  }

	  button.btn {
		  width: 250px;
		  height: 40px;
		  background: #1e90ff;
		  margin-left: 50px;
		  margin-top: 30px;
		  color: white;
		  border-radius: 5px;
		  cursor: pointer;
		  border: 0;
		  float: left;
	  }

	  .login-register {
		  float: left;
		  font-family: 楷体;
		  padding-left: 10px;
		  padding-top: 50px;
	  }

	  .login-forget {
		  float: left;
		  font-family: 楷体;
		  padding-left: 200px;
		  padding-top: 50px;
	  }
  </style>
  <body>
    <div class= "login">
    	<div class="login-title">
			<ul>
				<a href="login"><li><b>用户端</b></li></a>
				<a href="adminstorLogin"><li><b>管理员</b></li></a>
    		</ul>
    	</div>
    	<form id="indexform" name="indexForm" action="../User/logincheck" method="post">
    		<!-- 用户 -->
    		<div class="login-center-input">
    			<div class="login-counter-image"><img src="../images/name.png"></div>
    			<input type="text" name="phone" placeholder="请输入您的账号" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'" value=""/>
    		</div>
    	
    		<!-- 密码 -->
    		<div class="login-center-input">
    			<div class="login-counter-image"><img src="../images/password.png"></div>
    			<input type="password" name="password" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'" value=""/>
    		</div>
    		<!-- 按钮 -->
    		<button type="submit" class="btn" id="btn">登录</button>
    	</form>
    	<!-- 注册账号 -->
    	<div class="login-register">
    		<a href="../jsp/register.html">注册账号</a>
    	</div>
    	<!-- 忘记密码 -->
    	<div class="login-forget">
    		<a href="#">忘记密码</a>
    	</div>
    </div>
  </body>
</html>
