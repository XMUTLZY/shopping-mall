<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>"野兽派"服饰购物平台</title>
    <link href="../CSS/bootstrap1.css" rel='stylesheet' type='text/css'/>
    <script src="../js/jquery.min.js"></script>
    <link href="../CSS/style2.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
</head>
<!-- 飞进购物车js -->
<script type="text/javascript">
    var i = 0;
    $(function() {
        var inum = 0;
        if (localStorage.getItem("inum") !== null) {
            inum = localStorage.getItem("inum");
        }
        $(".dnum").text(inum);
        $(".godadd").click(function () {
            //添加进购物车
            var data = {
                tt:$('#tt').val(),
                setID:$('#assist').val()
            };
            $.ajax({
                url:"addToCar",
                type:"post",
                data:data ,
                datatype:'json',
                success:function (result) {
                }
            });
            if (!$(this).find("a").hasClass("bg")) {
                i++;
                $(this).find("a").addClass("bg");
                var img = $(this).parent().find(".godpic").find("img");
                var cimg = img.clone();
                var imgtop = img.offset().top;
                var imgleft = img.offset().left;
                var cartop = $("#godcar").offset().top;
                var carleft = $("#godcar").offset().left;
                cimg.appendTo($("body")).css({
                    "position": "absolute",
                    "opacity": "0.7",
                    "top": imgtop,
                    "left": imgleft
                }).animate({
                    "top": cartop,
                    "left": carleft,
                    "width": "40px",
                    "height": "40px",
                    "opacity": "0.3"
                }, 1000, function () {
                    cimg.remove();
                    $(".dnum").text(i);
                    localStorage.setItem("inum", i);
                });
            }
        });
    });
    function set(id) {
        document.getElementById("assist").value=id;
    }
    // //查询购物车
    // function showcar(phone) {
    //     var data = {
    //         phone:phone,
    //     };
    //     $.ajax({
    //         url:"showCar",
    //         type:"post",
    //         data:data,
    //         datatype:'json',
    //         success:function (result) {
    //             window.location.href="showCar.jsp";
    //         }
    //     });
    // }
</script>
<!-- 中部购物页面css -->
<style>
    * {
        padding: 0px;
        margin: 0px;
        font-family: "微软雅黑";
    }

    .goodsItem {
        width: 280px;
        height: 400px;
        border: 1px solid #ccc;
        margin: 5px;
        float: left;
    }

    #goods {
        padding-left: 15px;
        width: 100%;
        float:left;
    }

    .goditem {
        list-style: none;
    }

    .godpic img {
        display: block;
        width: 250px;
        height: 250px;
        margin: 0px auto;
    }

    .godprice, .godinfo, .godadd {
        display: block;
        width: 220px;
        margin: 0px auto;
        text-align: center;
    }

    .godprice {
        font-size: 20px;
        color: #f00;
    }

    .godinfo {
        text-align: center;
        font-size: 14px;
        margin: 10px 0px;
    }

    .godadd button {
        display: block;
        width: 150px;
        height: 36px;
        background-color: #fd6a01;
        border-radius: 10px;
        margin: 0px auto;
        text-decoration: none;
        color: #fff;
        line-height: 36px;
    }

    #godcar {
        position: fixed;
        right: 0px;
        top: 40%;
        width: 72px;
        height: 64px;
    }

    #godcar .dnum {
        width: 24px;
        height: 24px;
        border-radius: 12px;
        background-color: #f00;
        text-align: center;
        line-height: 24px;
        position: absolute;
        font-size: 12px;
        top: 0px;
    }

    .godadd .bg {
        background-color: #808080;
    }
</style>
<body>
<!-- 弹出修改密码窗口 -->
<div class="modal fade" id="modifyPassword">
    <div class="modal-dialog">
        <form class="modal-content" action="ModPassword" method="post">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">
                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改个人密码</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="form-horizontal">
                        <div class="form-group ">
                            <input type="hidden" id="hide" name="hide">
                            <label class="col-xs-3 control-label">原始密码：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi"
                                       name="password1" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">新密码：</label>
                            <div class="col-xs-8 ">
                                <input type="" class="form-control input-sm duiqi" name="password2"
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
<!-- 弹出个人信息窗口 -->
<div class="modal fade" id="showPersonalInform">
    <div class="modal-dialog">
        <form class="modal-content" action="showPersonalInfrom" method="post">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">
                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="personalInform">个人资料</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="form-horizontal">
                        <%--<c:forEach items="${PersonalInform}" var="inform">--%>
                            <%--<div class="form-group ">--%>
                                <%--<label class="col-xs-3 control-label">真实姓名</label>--%>
                                <%--<div class="col-xs-8 ">--%>
                                    <%--<c:out value="${inform.name}"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="col-xs-3 control-label">手机号：</label>--%>
                                <%--<div class="col-xs-8 ">--%>
                                    <%--<c:out value="${inform.phone}"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="col-xs-3 control-label">邮箱：</label>--%>
                                <%--<div class="col-xs-8">--%>
                                    <%--<c:out value="${inform.email}"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:forEach>--%>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="btn btn-default">关闭</button>
            </div>
        </form>
    </div>
</div>

<!-- 横条 -->
<div class="header">
    <div class="header-top-strip">
        <div class="container">
            <div class="header-right">
                <div class="cart box_1">
                    <a href="#">
                        <h3><span class="simpleCart_total"></span> <span id="simpleCart_quantity"
                                                                         class="simpleCart_quantity">  </span><img
                                src="../images/bag.png" alt=""></h3>
                    </a>
                    <p><a href="login" class="simpleCart_empty">登录/注册</a>
                        &nbsp;&nbsp;&nbsp;
                       <a href="" class="simpleCart_empty" hidden="hidden">退出</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 导航栏 -->
<div class="banner-top">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">主页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">男士 <b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-3">
                            <div class="row">
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>NEW IN</h6>
                                        <li><a href="#">衣服</a></li>
                                        <li><a href="#">背包</a></li>
                                        <li><a href="#">鞋子</a></li>
                                        <li><a href="#">手表</a></li>
                                        <li><a href="#">护肤</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>衣服</h6>
                                        <li><a href="#">T恤</a></li>
                                        <li><a href="#">衬衫</a></li>
                                        <li><a href="#">休闲裤</a></li>
                                        <li><a href="#">牛仔裤</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>手表</h6>
                                        <li><a href="#">卡西欧</a></li>
                                        <li><a href="#">电子表</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">女士<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-3">
                            <div class="row">
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>最新</h6>
                                        <li><a href="#">衣服</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>衣服</h6>
                                        <li><a href="#">T恤</a></li>
                                        <li><a href="#">衬衫</a></li>
                                        <li><a href="#">休闲裤</a></li>
                                        <li><a href="#">牛仔裤</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>手表</h6>
                                        <li><a href="#">卡西欧</a></li>
                                        <li><a href="#">电子表</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">童装<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-2">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="multi-column-dropdown">
                                        <h6>最新</h6>
                                        <li><a href="#">男装</a></li>
                                        <li><a href="#">女装</a></li>
                                        <li><a href="#">男鞋</a></li>
                                        <li><a href="#">女鞋</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="multi-column-dropdown">
                                        <h6>配饰</h6>
                                        <li><a href="#">书包</a></li>
                                        <li><a href="#">手表</a></li>
                                        <li><a href="#">眼镜</a></li>
                                        <li><a href="#">首饰</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </ul>
                    </li>
                    <li><a href="#">这一栏都是装饰</a></li>
                    <li><a href="#">装饰用的</a></li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- 轮播页面 -->
<div class="banner">
    <div class="container">
        <div class="banner-bottom">
            <div class="banner-bottom-left">
                <h2>野<br>兽<br>派</h2>
            </div>
            <div class="banner-bottom-right">
                <div class="callbacks_container">
                    <ul class="rslides" id="slider4">
                        <li>
                            <div class="banner-info">
                                <h3>随意</h3>
                                <p>在这里开始购物...</p>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                <h3>网购</h3>
                                <p>在这里开始购物...</p>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                <h3>打包</h3>
                                <p>在这里开始购物......</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <script src="../js/responsiveslides.min.js"></script>
                <script>
                    $(function () {
                        $("#slider4").responsiveSlides({
                            auto: true,
                            pager: true,
                            nav: false,
                            speed: 500,
                            namespace: "callbacks",
                            before: function () {
                                $('.events').append("<li>before event fired.</li>");
                            },
                            after: function () {
                                $('.events').append("<li>after event fired.</li>");
                            }
                        });

                    });
                </script>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shop">
            <a href="#">要买东西到下面去！上面点不了!!</a>
        </div>
    </div>
</div>
<!-- 加入我们的行列(装饰) -->
<div class="news-letter">
    <div class="container">
        <div class="join">
            <h6>加入我们的行列</h6>
            <div class="sub-left-right">
                <form>
                    <input type="text" value="输入您的邮箱地址" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Enter Your Email Here';}"/>
                    <input type="submit" value="发送"/>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 中部购物页面 -->
<div class="middle" style="width:100%;float:left">
    <!-- 商品 -->
    <input type="hidden" id="assist" name="assist">
    <div id="goods">
        <c:forEach items="${goods}" var="goods">
            <div class="goodsItem">
                <div class="goditem">
                    <input type="hidden" id="setID" name="setID" value=<c:out value="${goods.id}"/>>
                    <li class="goodid" style="display: none"><c:out value="${goods.id}"/></li>
                    <li class="goodtype" name="type" style="display: none"><c:out value="${goods.type}"/></li>
                    <li class="godpic"><img src=<c:out value="${goods.imageAddress}"/>></li>
                    <li class="godprice">￥<c:out value="${goods.price}"/></li>
                    <li class="godinfo" style="margin-left: 22px;"><c:out value="${goods.name}"/></li>
                    <li class="godadd"><button type="button" onclick="set(${goods.id})">加入购物车</button></li>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- 购物车 -->
    <div class="clickcar" id="godcar">
        <div class="dnum">0</div>
        <button type="button" onclick="showcar(key)" class="dcar">
            <img src="../images/car.jpg" style="width: 50px;height: 50px;">
        </button>
    </div>
</div>
<!-- 页脚 -->
<div class="footer" style="margin:50px 150px;float:left;">
    <div class="container">
        <div class="footer_top">
            <div class="span_of_4">
                <div class="col-md-3 span1_of_4">
                    <h4>测试</h4>
                    <ul class="f_nav">
                        <li><a href="#">测试1</a></li>
                        <li><a href="#">测试2</a></li>
                        <li><a href="#">测试3</a></li>
                        <li><a href="#">测试4</a></li>
                    </ul>
                </div>
                <div class="col-md-3 span1_of_4">
                    <h4>测试</h4>
                    <ul class="f_nav">
                        <li><a href="#">测试1</a></li>
                        <li><a href="#">测试2</a></li>
                        <li><a href="#">问题反馈</a></li>
                    </ul>
                </div>
                <div class="col-md-3 span1_of_4">
                    <h4>账户</h4>
                    <ul class="f_nav">
                        <li><a href="../login.html">注销</a></li>
                        <li><a href="#"><div id="modify" type="button"
                                             data-toggle="modal" data-target="#modifyPassword" onclick="setKey()">修改密码</div></a></li>
                        <li><a href="#"><div id="Inform" type="button"
                                             data-toggle="modal" data-target="#showPersonalInform">个人资料</div></a></li>
                    </ul>
                </div>
                <div class="col-md-3 span1_of_4">
                    <h4>测试</h4>
                    <ul class="f_nav">
                        <li><a href="#">测试1</a></li>
                        <li><a href="#">测试2</a></li>
                        <li><a href="#">测试3</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>