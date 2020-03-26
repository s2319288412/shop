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
                    <a href="javascript:;">购物车</a>
                </div>
                <form id="myCart" action="${pageContext.request.contextPath}/user/saveOrder" method="post" >
                    <c:if test="${empty cart.cartItems}">
                        <span> 购物车为空</span>



                    </c:if>
                    <c:if test="${not empty cart.cartItems}">
                    <div class="cart-table-th">
                        <div class="th th-chk">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                                </div>
                                <label>&nbsp;&nbsp;全选</label>
                            </div>
                        </div>
                        <div class="th th-item">
                            <div class="th-inner">
                                商品
                            </div>
                        </div>
                        <div class="th th-price">
                            <div class="th-inner">
                                单价
                            </div>
                        </div>
                        <div class="th th-amount">
                            <div class="th-inner">
                                数量
                            </div>
                        </div>
                        <div class="th th-sum">
                            <div class="th-inner">
                                小计
                            </div>
                        </div>
                        <div class="th th-op">
                            <div class="th-inner">
                                操作
                            </div>
                        </div>
                    </div>
                    <div class="OrderList">
                        <div class="order-content" id="list-cont">

                            <c:forEach items="${cart.cartItems}" var="item">
                            <ul class="item-content layui-clear">
                                <li class="th th-chk">
                                    <div class="select-all">
                                        <div class="cart-checkbox">
                                            <input class="CheckBoxShop check" id="box" type="checkbox" num="all" name="select-all" value="true">
                                        </div>
                                    </div>
                                </li>
                                <li class="th th-item">
                                    <div class="item-cont" style="margin-left: 80px">
                                        <a href="javascript:;"><img src="${pageContext.request.contextPath}/${item.product.pimage}" alt=""></a>
                                    </div>
                                </li>
                                <li class="th th-price">
                                    <span class="th-su">${item.product.shop_price}</span>
                                </li>
                                <li class="th th-amount">
                                    <div class="box-btn layui-clear">
                                        <div class="less layui-btn"  id="${item.product.pid }">-</div>
                                        <input class="Quantity-input" type="" name="num" value="${item.num}" disabled="disabled">
                                        <div class="add layui-btn"  id="${item.product.pid }">+</div>
                                    </div>
                                </li>
                                <li class="th th-sum">
                                    <span class="sum">${item.subTotal}</span>
                                </li>
                                <li class="th th-op">
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal delete"id="${item.product.pid }" ><i class="layui-icon"></i> 删除</button>
                                    <%--<span class="delete" id="${item.product.pid }">删除</span>--%>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>


                    <div class="FloatBarHolder layui-clear">
                        <div class="th th-chk">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
                                </div>
                                <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                            </div>
                        </div>
                        <div class="th batch-deletion">
                            <span class="batch-dele-btn">批量删除</span>
                        </div>
                        <div class="th Settlement">
                            <button class="layui-btn" id="btn">提交订单</button>
                        </div>
                        <div class="th total">
                            <p>应付：<span class="pieces-total">${cart.total}</span></p>
                        </div>
                    </div>
                    </c:if>
                </form>
            </div>

        </div>

    </div>



    <%--底部--%>
    <jsp:include page="../bottom.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">
    $(function(){
        $("#btn").click(function(){
            var form=document.getElementById("myCart");

            form.submit();
        });


        $(".delete").click(function(){
            if(confirm("确认删除?")){
                //获取到商品的pid
                var pid=this.id;
                window.location.href="${pageContext.request.contextPath}/user/removeCartItem/"+pid;
            }
        });

        $(".add").click(function(){
                //获取到商品的pid
                var pid=this.id;
                window.location.href="${pageContext.request.contextPath}/user/addCartItemNum/"+pid;
        });
        $(".less").click(function(){
            //获取到商品的pid
            var pid=this.id;
            window.location.href="${pageContext.request.contextPath}/user/lessCartItemNum/"+pid;
        });
    });



    layui.config({
        base: '../layui/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','jquery','element','car'],function(){
        var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;


        car.init()


    });
</script>
</html>
