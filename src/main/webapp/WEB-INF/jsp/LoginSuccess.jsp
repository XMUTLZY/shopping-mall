<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /* String path=request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
    + path + "/"; */
    response.setHeader("refresh", "5;url=login");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        #d1{
             height:40px;
             weight:800px;
             magin:auto;
             top:300px;
             background-color:green;
        }
        #tip,#s2{
             color:red;
             font-size:30px;
        }
        a{
            margin:auto;
        }
    </style>
    <script type="text/javascript">
        var i = 4 ;
        var Interval = setInterval(function() {
            document.getElementById("s2").innerHTML = i +"";
            i--;
            if (i==0) {
                clearInterval(Interval);
//window.location="http://localhost:8080/ssm/main.jsp"; 
                //window.location="${url}"; 
            }
        },1000);

    </script>
</head>
<body>
<h1>注册成功！！</h1>
<div id="d1">
    <a href="login">立即跳转</a><br/> 
    <span id="s1">${tip }</span>
    <span id="s2">5</span>秒后自动跳转到登录页面
</div>


</body>
</html>