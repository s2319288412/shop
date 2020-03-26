<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>网站首页</title>
    <script src="${pageContext.request.contextPath}/layui/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >


</head>
<body >

   <div class="layui-row" style="margin-top: 5px;">
       <div class="layui-col-md4">
            <img src="${pageContext.request.contextPath}/layui/img/logo.png" />
        </div>
        <div class="layui-col-md4" style="text-align: center;margin-top: 10px;">
            <img src="${pageContext.request.contextPath}/layui/img/header.png" />
        </div>
        <div class="layui-col-md4" style="padding-top: 17px;margin-top: 10px; text-align:right;">
            <c:if test="${empty loginUser}">
                <a class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" href="${pageContext.request.contextPath}/toLogin">登录</a>
               <a class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" href="${pageContext.request.contextPath}/toRegister">注册</a>
            </c:if>
            <c:if test="${not empty loginUser }">
                <a>欢迎您，${loginUser.username }</a>
                <a class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" href="${pageContext.request.contextPath}/logout">退出</a>
                <a class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" href="${pageContext.request.contextPath}/user/shop_cart">购物车</a>
                <a class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" href="${pageContext.request.contextPath}/user/toOrderList/1/3">我的订单</a>
            </c:if>
        </div>
    </div>

    <%--导航--%>
    <div class="layui-row" style="margin-top: 10px;">

        <ul class="layui-nav" lay-filter="test"  >

            <li class="layui-nav-item layui-this"><a href="/index">首页</a></li>


           <%-- <li class="layui-nav-item" id="nav">
                <a href="javascript:;">最新商品</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="">男装</a></dd>
                    <dd><a href="">女装</a></dd>
                    <dd><a href="">童装</a></dd>
                </dl>
            </li>--%>
            <li class="layui-nav-item" id="nav"><a href="#">商城公告</a></li>


            <li class="layui-nav-item" style="float: right;padding-top: 10px;text-decoration: none; ">
                <div class="layui-inline" style="padding-bottom: 10px" >
                    <input type="text" name="title"  placeholder="请输入商品名称"  class="layui-input" style="width: 200px; float:left;">
                    <a class="layui-btn layui-btn-radius layui-btn-warm layui-btn-sm" style="float: right;margin-left: 10px;">搜索</a>

                </div>

            </li>

        </ul>


    </div>





</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">

    $(function () {
        var url="/Category/findAllCats.do";
        $.post(url,function(data) {
            //重点地方，将Layui在页面加载时渲染出来的span.layui-nav-bar提前删除掉
            $("#nav").find('span.layui-nav-bar').remove();
            //遍历
            $.each(data,function(i,obj){                                                                                    /*/"+obj.cid+"/1/6*/
                var li="<li class='layui-nav-item'><a class='layui-nav-item' href='${pageContext.request.contextPath}/toProduct_list/"+obj.cid+"/1/6'>"+obj.cname+"</a></li>";

                //追加在ui下面
                $("#nav").before(li);
            });
            //列表添加完后再次执行渲染
            layui.element.init();
        },"json");


    });
    //注意：导航
    layui.use('element', function(){
        var element = layui.element;
    });




</script>


</html>
