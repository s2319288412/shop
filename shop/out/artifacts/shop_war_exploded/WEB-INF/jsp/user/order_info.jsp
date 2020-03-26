<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <title>Title</title>
</head>
<body>
<div class="layui-container">
    <%--头部--%>
    <jsp:include page="../header.jsp"></jsp:include>

        <%--购物车--%>
        <div class="layui-row" >
            <div class="content content-nav-base shopcart-content">
                <div class="cart w1140">
                    <%--标签--%>
                    <div class="crumb" style="margin: 20px">
                        <a href="javascript:;">首页</a>
                        <span>></span>
                        <a href="javascript:;">所有商品</a>
                        <span>></span>
                        <a href="javascript:;">订单详情</a>
                    </div>
                    <form id="myCart" action="${pageContext.request.contextPath}/user/payOrder" method="post" >
                            <div class="cart-table-th">
                                <div class="th th-item" style="width: 400px;" >
                                    <div class="th-inner">
                                        商品
                                    </div>
                                </div>
                                <div class="th th-price" style="width: 140px;">
                                    <div class="th-inner">
                                        单价
                                    </div>
                                </div>
                                <div class="th th-amount" style="width: 270px;">
                                    <div class="th-inner">
                                        数量
                                    </div>
                                </div>
                                <div class="th th-sum" style="width: 270px;">
                                    <div class="th-inner">
                                        小计
                                    </div>
                                </div>

                            </div>
                            <div class="OrderList">
                                <div class="order-content" id="list-cont">
                                    <c:forEach items="${order.list }" var="item">
                                        <ul class="item-content layui-clear">
                                            <li class="th th-item">
                                                <div class="item-cont" style="margin-left: 80px">
                                                    <a href="javascript:;"><img src="${pageContext.request.contextPath}/${item.product.pimage}" alt=""></a>
                                                </div>
                                            </li>
                                            <li class="th th-price" style="padding-left: 90px">
                                                <span class="th-su">${item.product.shop_price}</span>
                                            </li>
                                            <li class="th th-amount" style="padding-left: 90px">
                                                <div class="box-btn layui-clear" >
                                                    <input class="Quantity-input" type="" name="" value="${item.quantity}" disabled="disabled">
                                                </div>
                                            </li>
                                            <li class="th th-sum" style="padding-left: 50px">
                                                <span class="sum">${item.total}</span>
                                            </li>

                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>


                            <div class="FloatBarHolder layui-clear">
                                <div class="th total">
                                    <p>应付：<span class="pieces-total">${order.total}</span></p>
                                </div>
                            </div>
                        <hr style="width: 1140px"/>
                        <input type="hidden" name="oid" value="${order.oid}">
                        <%----%>
                        <div class="layui-row" >

                            <div class="layui-form-item" style="margin-left: 420px">
                                <label class="layui-form-label">收货人</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="name" required lay-verify="required" placeholder="请输入收货人姓名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-left: 420px;">
                                <label class="layui-form-label">地址</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="address" required lay-verify="required" placeholder="请输入收货人地址" autocomplete="off" class="layui-input">
                                </div>

                            </div>
                            <div class="layui-form-item" style="margin-left: 420px;">
                                <label class="layui-form-label">电话</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="telephone" required lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-left: 420px;" >
                                <div class="layui-input-block" style="padding-right: 70px;">
                                    <button type="submit" class="layui-btn layui-btn-primary" lay-submit="" lay-filter="demo1">付款</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

            </div>

        </div>




    <%--底部--%>
    <jsp:include page="../bottom.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">

</script>
</html>
