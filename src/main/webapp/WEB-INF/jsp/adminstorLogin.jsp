<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
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
	  <link rel="stylesheet" type="text/css" href="../CSS/styles.css">
	  <script src="../js/jquery.min.js"></script>
      <script src="http://how2j.cn/study/vue.min.js"></script>
  </head>

  <script type="text/javascript">
      window.onload=function () {
          var vm = new Vue({
              el: '#indexform',
              data:{
                  username:'',
                  password:''
              },
              methods:{
                  change:function(){
                      username = this.username,
                          password = this.password,
                          $.ajax({
                              url:"../adminLoginCheck",
                              method:"post",
                              data:{"username":username,
                                  "password":password},
                              dataType:"json",
                              success:function (result) {
                                  if(result){
                                      alert("管理认证成功");
                                  }else{
                                      alert("管理认证失败");
                                  }
                              },
                              error:function () {
                                  alert("ajax发送错误");
                              }
                          });
                  }
              },
          });
      }
      // $("#btn").click(function () {
      //     alert(data.username);
      //
      //     $.ajax({
      //         url:"../adminLoginCheck",
      //         method:"post",
      //         data:{"username":username,
      //             "password":password},
      //         dataType:"json",
      //         success:function (result) {
      //             if(result){
      //                 alert("管理认证成功");
      //             }else{
      //                 alert("管理认证失败");
      //             }
      //         },
      //         error:function () {
      //             alert("ajax发送错误");
      //         }
      //     });
      // });
  </script>
  <body>
    <div class= "login">
    	<div class="login-title">
			<ul>
    			<a href="login"><li><b>用户端</b></li></a>
    			<a href="adminstorLogin"><li><b>管理员</b></li></a>
    		</ul>
    	</div>
    	<div id="indexform" name="indexForm">
    	<!-- 用户名 -->
    	<div class="login-center-input">
    		<div class="login-counter-image"><img src="../images/name.png"></div>
    		<input type="text" v-model="username" placeholder="请输入您的管理员用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的管理员用户名'" value=""/>
    	</div>

    	<!-- 密码 -->
    	<div class="login-center-input">
    		<div class="login-counter-image"><img src="../images/password.png"></div>
    		<input type="password" v-model="password" placeholder="请输入您的管理员密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的管理员密码'" value=""/>
    	</div>

    	<!-- 按钮 -->
    		<button type="button" class="btn" v-on:click="change()" id="btn">登录</button>
    	</div>
    	</div>
    </div>
  </body>
</html>
