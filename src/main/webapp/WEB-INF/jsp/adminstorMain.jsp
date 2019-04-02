<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String clickwhat = request.getSession().getAttribute("clickwhat").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>"野兽派"服饰商城平台后台管理</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/adminstor.css">
	<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
	<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css"
		  rel="stylesheet">
	<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>

</head>

<body>
<a id='ClickWhat' style='display:none'><%=clickwhat %></a>

<div class="title">
	<div class="title-up">
		<b>"野兽派"服饰商城平台后台管理</b>
		<div class="input-group">
			<input type="text" class="form-control" placeholder="搜索...">
			<span class="input-group-btn">
					<button class="btn btn-default" type="button">搜索</button> </span>
		</div>
	</div>
	<div class="title-under" id="set1">
		<div class="under-left">
			<a href="welcome.jsp">首页</a>
		</div>
		<div class="under-right">
			<a id="loginShowName" href="#">姓名</a> <a id="personal">个人中心</a>
			<div class="btn-group" style="margin-top:-2.5px;">
				<a id="set2"
				   style="text-decoration: none;background-color:#4e5e6f;"
				   class="dropdown-toggle" href="#nowhere " data-toggle="dropdown">
					设置 <span class="caret"></span> </a>
				<ul class="dropdown-menu moreMenu"
					style="background-color: #4e5e6f;border-color: #245580;"
					role="menu" id="set3">
					<li></li>
					<li><a id="settitle">主题设置</a></li>
					<li><a id="modifypassword">修改密码</a>
					</li>
					<li><a href="adminstorLogin.html">退出登录</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="center">
	<!-- 左侧菜单栏 -->
	<div class="center-left">
		<div class="center-left-up"></div>
		<div class="center-left-under">
			<div class="menu-item" id="reader-inform" style="background:gray">客户管理</div>
			<div class="menu-item" id="book-inform">商品管理</div>
			<div class="menu-item" id="book-borrow">订单管理</div>
			<div class="menu-item" id="base-inform">公告/反馈管理</div>
			<div class="menu-item" id="pay-inform">支付管理</div>
			<div class="menu-item" id="admin-inform">管理员管理</div>
		</div>
	</div>
	<!-- 右侧主界面 -->
	<div class="center-right">

		<!--弹出删除客户警告窗口-->
		<div class="modal fade" id="deleteUser">
			<div class="modal-dialog">
				<form class="modal-content" action="DelUser" method="post">
					<input type="hidden" id="bb" name="bb" value="">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">确定要删除该用户？删除后不可恢复！</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" class="btn-default btn-xs" type="submit">取消</button>
						<button class="btn-primary btn-xs" type="submit">确定</button>
					</div>
				</form>
			</div>
		</div>
		<!--弹出修改客户信息窗口-->
		<div class="modal fade" id="modifyUser">
			<div class="modal-dialog">
				<form class="modal-content" action="ModUser" method="post">
					<input type="hidden" id="cc" name="cc" value="">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">修改信息</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-horizontal">
								<div class="form-group">
									<label for="sName" class="col-xs-3 control-label">真实姓名：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											   name="sName" placeholder="请输入真实姓名">
									</div>
								</div>
								<div class="form-group ">
									<label for="sPassword" class="col-xs-3 control-label">密码：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											   name="sPassword" placeholder="请输入新密码">
									</div>
								</div>
								<div class="form-group">
									<label for="sEmail" class="col-xs-3 control-label">电子邮箱：</label>
									<div class="col-xs-8">
										<input type="email" class="form-control input-sm duiqi" name="sEmail"
											   placeholder="请输入邮箱账号">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" class="btn-default btn-xs" type="submit">关闭</button>
						<button class="btn-primary btn-xs" type="submit">提交</button>
					</div>
				</form>
			</div>
		</div>
		<!--弹出查询客户信息窗口-->
		<div class="modal fade" id="searchUser">
			<div class="modal-dialog">
				<form class="modal-content" action="SeaUser" method="post">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">用户检索</h4>
					</div>
					<div class="modal-body">
						<button type="button" class="btn-primary" id="addCondi" style="margin-left:30px;float:left;">增加条件</button>
						<button type="button" class="btn-danger" id="deleteCondi" style="margin-left:60px;float:left;">删除条件</button>
						<div class="container-fluid" id="container-fluid">
							<div></div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" class="btn-default btn-xs" type="submit">取消</button>
						<button class="btn-primary btn-xs" type="submit" id="search">查询</button>
						<input type="hidden" name="hide" id="hide" value="">
					</div>
				</form>
			</div>
		</div>
		<!--弹出加入黑名单信息窗口-->
		<div class="modal fade" id="addToBlack">
			<div class="modal-dialog">
				<form class="modal-content" action="AddToBlack" method="post">
					<input type="hidden" id="xx" name="xx" value="">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">原因</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-xs-3 control-label">原因：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											   name="sBecause" placeholder="请输入原因">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" class="btn-default btn-xs" type="submit">关闭</button>
						<button class="btn-primary btn-xs" type="submit">提交</button>
					</div>
				</form>
			</div>
		</div>

		<!--弹出添加商品信息窗口-->
		<div class="modal fade" id="addBook">
			<div class="modal-dialog">
				<form class="modal-content" action="AddGoods" method="post">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">添加商品</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-horizontal">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">商品类型：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											   name="sType" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">商品名称：</label>
									<div class="col-xs-8 ">
										<input type="" class="form-control input-sm duiqi" name="sNames"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">数量：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi" name="sNum"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sprice" class="col-xs-3 control-label">商品价格：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi" name="sPrice"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="simage" class="col-xs-3 control-label">图片上传：</label>
									<div class="col-xs-8">
										<input type="file" class="form-control input-sm duiqi" name="sImage"
											   placeholder="">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn-default" type="submit">关闭</button>
						<button class="btn-primary" type="submit">提交</button>
					</div>
				</form>
			</div>
		</div>
		<!--弹出删除商品警告窗口-->
		<div class="modal fade" id="deleteBook">
			<div class="modal-dialog">
				<form class="modal-content" action="DelGoods" method="post">
					<input type="hidden" id="dd" name="dd" value="">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">确定要删除该商品？删除后不可恢复！</div>
					</div>
					<div class="modal-footer">
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn-default btn-xs" type="submit">取消</button>
							<button class="btn-primary btn-xs" type="submit">确定</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--弹出修改商品信息窗口-->
		<div class="modal fade" id="modifyBook">
			<div class="modal-dialog">
				<form class="modal-content" action="ModGoods" method="post">
					<input type="hidden" id="aa" name="aa" value="">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">修改商品信息</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-horizontal">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">商品类型：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											   name="sType" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">商品名称：</label>
									<div class="col-xs-8 ">
										<input type="" class="form-control input-sm duiqi" name="sNames"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">数量：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi" name="sNum"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sprice" class="col-xs-3 control-label">商品价格：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi" name="sPrice"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="simage" class="col-xs-3 control-label">图片上传：</label>
									<div class="col-xs-8">
										<input type="file" class="form-control input-sm duiqi" name="sImage"
											   placeholder="">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" type="btn btn-default">关闭</button>
						<button class="btn-primary" type="submit">提交</button>
					</div>
				</form>
			</div>
		</div>
		<!--弹出查询商品信息窗口-->
		<div class="modal fade" id="searchGoods">
			<div class="modal-dialog">
				<form class="modal-content" action="SeaGoods" method="post">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">查询商品信息</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-horizontal">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">商品类型：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi"
											   name="sType" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">商品名称：</label>
									<div class="col-xs-8 ">
										<input type="" class="form-control input-sm duiqi" name="sNames"
											   placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="sprice" class="col-xs-3 control-label">商品价格(区间)/必填：</label>
									<div class="col-xs-8">
										<input type="" class="form-control input-sm duiqi" name="sPrice1"
											   placeholder=""> | <input type="" class="form-control input-sm duiqi" name="sPrice2"
																		placeholder="">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" type="btn btn-default">关闭</button>
						<button class="btn-primary" type="submit">查询</button>
					</div>
				</form>
			</div>
		</div>

		<!--弹出删除订单信息警告窗口-->
		<div class="modal fade" id="deleteOrder">
			<div class="modal-dialog">
				<form class="modal-content" action="delOrder" method="post">
					<input type="hidden" id="order_id2" name="order_id2" value="">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">确定要删除该订单信息？删除后不可恢复！</div>
					</div>
					<div class="modal-footer">
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn-default btn-xs" type="submit">取消</button>
							<button class="btn-primary btn-xs" type="submit">确定</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--弹出修改订单信息窗口-->
		<div class="modal fade" id="modifyOrder">
			<div class="modal-dialog">
				<form class="modal-content" action="ModOrder" method="post">
					<input type="hidden" id="order_id" name="order_id" value="">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">修改地址信息</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-horizontal">
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">地址信息：</label>
									<div class="col-xs-8 ">
										<input type="" class="form-control input-sm duiqi" name="sAddress"
											   placeholder="输入地址">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" type="btn btn-default">关闭</button>
						<button class="btn-primary" type="submit">提交</button>
					</div>
				</form>
			</div>
		</div>

		<!-- 客户管理模块 -->
		<div role="tabpane1" class="tab-pane" id="reader-inform1">
			<!--搜索添加栏-->
			<div class="check-div form-inline" style="padding-top: 30px;">
				<div class="col-md-3">
					<button class="btn-info btn-xs" type="button"
							data-toggle="modal" data-target="#searchUser">客户检索器</button>
				</div>
			</div>
			<!--信息栏 -->
			<div class="data-div">
				<div class="tableHeader">
					<div class="col-xs-2">序号</div>
					<div class="col-xs-2">手机</div>
					<div class="col-xs-2">真实姓名</div>
					<div class="col-xs-2">密码</div>
					<div class="col-xs-2">邮箱</div>
					<div class="col-xs-2">操作</div>
				</div>
				<div class="tablebody" style="max-height: 450px;overflow-x: hidden;">
					<c:forEach items="${list}" var="user">
						<div class="row">
							<div class="col-xs-2"><c:out value="${user.id}"/></div>
							<div class="col-xs-2"><c:out value="${user.phone}"/></div>
							<div class="col-xs-2"><c:out value="${user.name}"/></div>
							<div class="col-xs-2"><c:out value="${user.password}"/></div>
							<div class="col-xs-2"><c:out value="${user.email}"/></div>
							<div class="col-xs-2">
								<button class="btn-warning btn-xs" id="modifyInform" type="button"
										data-toggle="modal" data-target="#modifyUser" onclick="Values1(${user.id})">修改</button>
								<button class="btn-danger btn-xs" type="button"
										data-toggle="modal" data-target="#deleteUser" onclick="Values2(${user.id})">删除</button>
								<button class="btn-info btn-xs" type="button"
										data-toggle="modal" data-target="#addToBlack" onclick="Values0(${user.id})">黑名单</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<!--页码块-->
				<div class="footer">
					<ul class="pagination">
						<li><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 商品管理模块 -->
		<div role="tabpane1" class="tab-pane" id="book-inform1">
			<!--搜索添加栏-->
			<div class="check-div form-inline" style="padding-top:30px;">
				<div class="col-md-4">
					<button class="btn-yellow btn-xs" type="button"
							data-toggle="modal" data-target="#addBook">添加商品</button>
				</div>
				<div class="col-md-3">
					<button class="btn-info btn-xs" type="button"
							data-toggle="modal" data-target="#searchGoods">商品检索器</button>
				</div>
			</div>
			<!--信息栏 -->
			<div class="data-div">
				<div class="tableHeader">
					<div class="col-xs-2">序号</div>
					<div class="col-xs-2">商品类型</div>
					<div class="col-xs-2">数量</div>
					<div class="col-xs-2">名称</div>
					<div class="col-xs-2">价格</div>
					<div class="col-xs-2">操作</div>
				</div>
				<div class="tablebody" style="max-height: 450px;overflow-x: hidden;">
					<c:forEach items="${list1}" var="goods">
						<div class="row">
							<div class="col-xs-2"><c:out value="${goods.id}"/></div>
							<div class="col-xs-2"><c:out value="${goods.type}"/></div>
							<div class="col-xs-2"><c:out value="${goods.number}"/></div>
							<div class="col-xs-2"><c:out value="${goods.name}"/></div>
							<div class="col-xs-2"><c:out value="${goods.price}"/></div>
							<div class="col-xs-2">
								<button class="btn-warning btn-xs" id="modify" type="button"
										data-toggle="modal" data-target="#modifyBook" onclick="Values3(${goods.id})">修改</button>
								<button class="btn-danger btn-xs" type="button"
										data-toggle="modal" data-target="#deleteBook" onclick="Values4(${goods.id})">删除</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<!--页码块-->
				<div class="footer">
					<ul class="pagination">
						<li><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 订单管理模块 -->
		<div role="tabpane1" class="tab-pane" id="book-borrow1">
			<!--搜索添加栏-->
			<form class="check-div form-inline" action="SeaOrder" method="post">
				<div class="col-xs-4">
					<input type="text" class="form-control input-sm"
						   name="order_search" placeholder="输入信息搜索">
					<button class="btn-white btn-xs" type="submit">查 询</button>
				</div>
			</form>
			<!--信息栏 -->
			<div class="data-div">
				<div class="tableHeader">
					<div class="col-xs-2">订单号</div>
					<div class="col-xs-2">手机</div>
					<div class="col-xs-2">姓名</div>
					<div class="col-xs-2">订单金额</div>
					<div class="col-xs-2">地址</div>
					<div class="col-xs-2">操作</div>
				</div>
				<div class="tablebody" style="max-height: 450px;overflow-x: hidden;">
					<c:forEach items="${list2}" var="order">
						<div class="row">
							<div class="col-xs-2"><c:out value="${order.id}"/></div>
							<div class="col-xs-2"><c:out value="${order.phone}"/></div>
							<div class="col-xs-2"><c:out value="${order.name}"/></div>
							<div class="col-xs-2">￥<c:out value="${order.total}"/></div>
							<div class="col-xs-2"><c:out value="${order.address}"/></div>
							<div class="col-xs-2">
								<button class="btn-warning btn-xs" type="button"
										data-toggle="modal" data-target="#modifyOrder" onclick="Values5(${order.id})">修改</button>
								<button class="btn-danger btn-xs" type="button"
										data-toggle="modal" data-target="#deleteOrder" onclick="Values6(${order.id})">删除</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<!--页码块-->
				<div class="footer">
					<ul class="pagination">
						<li><select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 公告反馈管理模块 -->
		<div role="tabpane1" class="tab-pane" id="base-inform1">
			<!-- 导航栏 -->
			<div class="nav nav-tabs">
				<div class="choose" id="rule">用户反馈</div>
				<div class="choose" id="blackperson">用户黑名单</div>
				<div class="choose" id="publish">后台管理员名单</div>
			</div>
			<!-- 任务窗口 -->
			<div class="pane">
				<!-- 用户反馈窗口 -->
				<div class="basepane" id="rule1">
					<form class="form-horizontal">
						测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试
					</form>
					<div class="modal-footer">
						<button class="btn btn-primary" type="button">提交</button>
					</div>
				</div>
				<!-- 黑名单设置窗口 -->
				<div class="basepane" id="blackperson1">
					<table class="table table-striped">
						<thead>
						<th>真实姓名</th>
						<th>手机号</th>
						<th>邮箱</th>
						<th>原因</th>
						</thead>
						<tbody>
						<tr>
							<td>黑名单1</td>
							<td>33333333333</td>
							<td>badTest1@qq.com</td>
							<td>非法操作</td>
						</tr>
						<tr>
							<td>黑名单2</td>
							<td>44444444444</td>
							<td>badTest2@qq.com</td>
							<td>使用外挂</td>
						</tr>
						<tr>
							<td>黑名单3</td>
							<td>55555555555</td>
							<td>badTest2@qq.com</td>
							<td>言语辱骂</td>
						</tr>
						</tbody>
					</table>
				</div>
				<!-- 管理员名单窗口 -->
				<div class="basepane" id="publish1">
					<table class="table table-striped">
						<thead>
						<th>管理员姓名</th>
						<th>手机号</th>
						<th>密码</th>
						<th>职责</th>
						</thead>
						<tbody>
						<tr>
						<tr>
							<td>管理员1</td>
							<td>9999999999</td>
							<td>admin</td>
							<td>订单管理</td>
						</tr>
						<tr>
							<td>管理员2</td>
							<td>0000000000</td>
							<td>admin</td>
							<td>售后服务</td>
						</tr>
						<tr>
							<td>管理员3</td>
							<td>44444444444</td>
							<td>admin</td>
							<td>商品更新管理</td>
						</tr>
						<tr>
							<td>管理员4</td>
							<td>22222222222</td>
							<td>admin</td>
							<td>平台老大</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 支付管理模块 -->
		<div role="tabpane1" class="tab-pane" id="modifypassword1">
			<div class="check-div">管理员修改密码面板</div>
			<div class="modify">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">原密码：</label>
						<div class="col-xs-5">
							<input type="" class="form-control input-sm duiqi" id="sKnot"
								   placeholder="" style="margin-top: 7px;">
						</div>
					</div>
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">新密码：</label>
						<div class="col-xs-5">
							<input type="" class="form-control input-sm duiqi" id="sKnot"
								   placeholder="" style="margin-top: 7px;">
						</div>
					</div>
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
						<div class="col-xs-5">
							<input type="" class="form-control input-sm duiqi" id="sKnot"
								   placeholder="" style="margin-top: 7px;">
						</div>
					</div>
					<div class="form-group text-right">
						<div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
							<button type="reset" class="btn btn-xs btn-white">取 消</button>
							<button type="submit" class="btn btn-xs btn-green">保存</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 管理员管理模块 -->
		<div role="tabpane1" class="tab-pane" id="personal1">
			<div class="check-div">个人中心</div>
			<div class="modify">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">真实姓名：</label>
						<div class="col-xs-7">
							林
						</div>
					</div>
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">用户名：</label>
						<div class="col-xs-7">
							admin
						</div>
					</div>
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">密码：</label>
						<div class="col-xs-7">
							admin
						</div>
					</div>
					<div class="form-group">
						<label for="sKnot" class="col-xs-4 control-label">身份：</label>
						<div class="col-xs-7">
							管理员
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript" language="javascript" src="js/judge.js"
		charset="utf-8"></script>
</body>

</html>
