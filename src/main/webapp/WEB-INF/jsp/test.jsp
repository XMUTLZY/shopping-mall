<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>test</title>
</head>
<body>
<c:forEach items="${goods}" var="goods">
    <div class="goodsItem">
        <div class="goditem">
            <li class="goodid" style="display: none"><c:out value="${goods.id}"/></li>
            <li class="goodtype" name="type" style="display: none"><c:out value="${goods.name}"/></li>
            <li class="godtest"><img src="../images/car.jpg"></li>
            <li class="godpic"><img src=<c:out value="${goods.imageAddress}"/>></li>
            <li class="godprice">￥<c:out value="${goods.price}"/></li>
            <li class="godinfo" style="margin-left: 22px;"><c:out value="${goods.detail}"/></li>
            <li class="godadd"><button type="button" onclick="set(${goods.imageAddress})">加入购物车</button></li>
        </div>
    </div>
</c:forEach>
</body>
</html>
