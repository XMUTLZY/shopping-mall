var boolean_name = false;
var boolean_phone = false;
var boolean_password1 = false;
var boolean_password2 = false;
var boolean_email = false;
var a = 100;
var b = 100;
var count = 1;
var setname = 50;
var setname1 = 50;
//姓名
$('.name').blur(function() {
    $('.judge_name').html("√").css("color", "green");
    boolean_name = true;
});
//手机
$('.phone').blur(function() {
    if ((/^[0-9_-]{11,11}$/).test($(".phone").val())) {
        $('.judge_phone').html("√").css("color", "green");
        boolean_phone = true;
    } else {
        $('.judge_phone').html("×").css("color", "red");
        boolean_phone = false;
    }
});
//密码
$('.password').blur(function() {
    if ((/^[a-z0-9_-]{6,18}$/).test($(".password").val())) {
        $('.judge_password').html("√").css("color", "green");
        boolean_password1 = true;
    } else {
        $('.judge_password').html("×").css("color", "red");
        boolean_password1 = false;
    }
});

//确认密码
$('.password2').blur(function() {
    if (($(".password").val()) == ($(".password2").val())) {
        $('.judge_password2').html("√").css("color", "green");
        boolean_password2 = true;
    } else {
        $('.judge_password2').html("×").css("color", "red");
        boolean_password2 = false;
    }
});
//Email
$('.email').blur(function(){
    if ((/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/).test($(".email").val())){
        $('.judge_email').html("√").css("color","green");
        boolean_email = true;
    }else {
        $('.judge_email').html("×").css("color","red");
        boolean_email = false;
    }
});
//判断信息是否满足注册条件
$('.btn').click(function(){
    if(boolean_name&&boolean_phone&&boolean_password1&&boolean_password2&&boolean_email){
        var e = document.forms[0];
        e.submit();
    }
    else {
        alert("信息有误");
    }
});
$(function() {
    var clickwhat = parseInt($('#ClickWhat').text());
    $('.center-left-under div').eq(clickwhat).click();
});
//不同的请求显示出不同的处理页面及菜单选项加灰处理
$('#book-inform').click(function() {
    document.getElementById('book-inform').style.backgroundColor='gray';
    document.getElementById('reader-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-borrow').style.backgroundColor='#4e5e6f';
    document.getElementById('base-inform').style.backgroundColor='#4e5e6f';
    $('#book-inform1').css({'z-index':a++});
});
$('#book-borrow').click(function() {
    document.getElementById('book-borrow').style.backgroundColor='gray';
    document.getElementById('book-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('reader-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('base-inform').style.backgroundColor='#4e5e6f';
    $('#book-borrow1').css({'z-index':a++});
});
$('#base-inform').click(function() {
    document.getElementById('base-inform').style.backgroundColor='gray';
    document.getElementById('book-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-borrow').style.backgroundColor='#4e5e6f';
    document.getElementById('reader-inform').style.backgroundColor='#4e5e6f';
    $('#base-inform1').css({'z-index':a++});
});
$('#reader-inform').click(function() {
    document.getElementById('reader-inform').style.backgroundColor='gray';
    document.getElementById('book-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-borrow').style.backgroundColor='#4e5e6f';
    document.getElementById('base-inform').style.backgroundColor='#4e5e6f';
    $('#reader-inform1').css({'z-index':a++});
});
//导航栏选项
$('#rule').click(function() {
    document.getElementById('rule').style.backgroundColor='white';
    document.getElementById('blackperson').style.backgroundColor='#eff3f6';
    document.getElementById('publish').style.backgroundColor='#eff3f6';
    $('#rule1').css({'z-index':b++});
});
$('#blackperson').click(function() {
    document.getElementById('blackperson').style.backgroundColor='white';
    document.getElementById('rule').style.backgroundColor='#eff3f6';
    document.getElementById('publish').style.backgroundColor='#eff3f6';
    $('#blackperson1').css({'z-index':b++});
});
$('#publish').click(function() {
    document.getElementById('publish').style.backgroundColor='white';
    document.getElementById('rule').style.backgroundColor='#eff3f6';
    document.getElementById('blackperson').style.backgroundColor='#eff3f6';
    $('#publish1').css({'z-index':b++});
});
//修改密码
$('#modifypassword').click(function() {
    document.getElementById('reader-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-borrow').style.backgroundColor='#4e5e6f';
    document.getElementById('base-inform').style.backgroundColor='#4e5e6f';
    $('#modifypassword1').css({'z-index':a++});
});
//主题设置
$('#settitle').click(function() {
    document.getElementById('reader-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-borrow').style.backgroundColor='#4e5e6f';
    document.getElementById('base-inform').style.backgroundColor='#4e5e6f';
    if(count%2==0){
        document.getElementById('set1').style.backgroundColor='#4e5e6f';
        document.getElementById('set2').style.backgroundColor='#4e5e6f';
        document.getElementById('set3').style.backgroundColor='#4e5e6f';
    }
    else{
        document.getElementById('set1').style.backgroundColor='#337AB7';
        document.getElementById('set2').style.backgroundColor='#337AB7';
        document.getElementById('set3').style.backgroundColor='#337AB7';
    }
    count++;
});
//个人中心
$('#personal').click(function() {
    document.getElementById('reader-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-inform').style.backgroundColor='#4e5e6f';
    document.getElementById('book-borrow').style.backgroundColor='#4e5e6f';
    document.getElementById('base-inform').style.backgroundColor='#4e5e6f';
    $('#personal1').css({'z-index':a++});
});
//传id值到加入用户到黑名单
function Values0(ID) {
    document.getElementById('xx').value=ID;
}
//传id值到修改客户模态框
function Values1(ID) {
    document.getElementById('cc').value=ID;
};
//传id值到删除客户提示模态框
function Values2(ID) {
    document.getElementById('bb').value=ID;
};
//传id值到商品模态框
function Values3(ID) {
    document.getElementById('aa').value=ID;
};
//传id值到删除商品提示模态框
function Values4(ID) {
    document.getElementById('dd').value=ID;
};
//传id值到修改订单模态框
function Values5(ID) {
    document.getElementById('order_id').value=ID;
};
//传id值到删除订单提示模态框
function Values6(ID) {
    document.getElementById('order_id2').value=ID;
};
//用户查询
//动态添加上拉菜单和文本框
$('#addCondi').click(function () {
    input = document.createElement('input');
    input.setAttribute("name","input"+setname);
    select1 = document.createElement('select');
    select1.setAttribute("name","select1"+setname);
    select1.setAttribute("id","select1"+setname);
    select2 = document.createElement('select');
    select2.setAttribute("name","select2"+setname);
    select2.setAttribute("id","select2"+setname);
    ul = document.createElement('container-fluid');
    li = document.createElement('search-group');
    li.appendChild(select1);
    li.appendChild(input);
    li.appendChild(select2);
    ul.appendChild(li);
    document.getElementById('container-fluid').appendChild(ul);
    id1 = document.getElementById("select1"+setname);
    $(id1).append("<option value='phone'>用户名</option>");
    $(id1).append("<option value='name'>姓名</option>");
    $(id1).append("<option value='email'>邮箱</option>");
    id2 = document.getElementById("select2"+setname);
    $(id2).append("<option value='and'>AND</option>");
    $(id2).append("<option value='or'>OR</option>");
    $(id2).append("<option value='null'>NULL</option>");
    setname++;
});
//动态删除查询条件
$('#deleteCondi').click(function () {
    $('search-group:last').remove();
    setname--;
});
//传文本框的数量到servlet中
$('#search').click(function () {
    document.getElementById('hide').value = setname;
});

