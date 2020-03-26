<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <title>评价页面</title>
</head>
<body>
<div class="layui-container">
    <jsp:include page="../header.jsp"></jsp:include>

    <%--订单页--%>
    <div class="layui-row">
        <div class="crumb" style="margin: 20px">
            <a >首页</a>
            <span>></span>
            <a >所有商品</a>
            <span>></span>
            <a >订单评价</a>
        </div>
        <div style="text-align: center;">
            <table class="layui-table" style="width: 80%;margin-left: 118px;">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>

                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>${order.oid}</th>
                        <th>总金额</th>
                        <th colspan="2">${order.total}元</th>

                       <%-- <th><a class="layui-btn layui-btn-danger" href="#">评价</a></th>--%>


                    </tr>
                    <tr>
                        <th>图片</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>小计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.list}" var="item" varStatus="status">
                        <tr >
                            <td><img src="${pageContext.request.contextPath}/${item.product.pimage}"></td>
                            <td>${item.product.pname}</td>
                            <td>${item.product.shop_price}</td>
                            <td>${item.quantity}</td>
                            <td>${item.total}元</td>
                        </tr>
                        <tr id="${item.itemID}">
                            <form action="${pageContext.request.contextPath}/user/evaluateDo/${item.itemID}/${item.product.pid}">
                            <td style="text-align: center">评价内容</td>
                            <td colspan="3"><textarea name="evaluate" id="evaluate" placeholder="请输入评价" class="layui-textarea"></textarea></td>
                            <td style="text-align: center"> <input type="submit"  class="sub layui-btn"  value="评价"></td>
                            </form>
                        </tr>
                    </c:forEach>
                    </tbody>





            </table>
        </div>



    </div>


    <jsp:include page="../bottom.jsp"></jsp:include>
</div>
<script type="text/javascript">
/*
    $(function(){

        $(".sub").click(function(){
            //获取到商品的pid
            var pid=this.id;
            var t = $('#$/{}').val();
            var itemID = $(this).parents().parents().attr("id");  //获取tr的data-uid值
            var url = "$/{pageContext.request.contextPath}/user/evaluateDo/"+itemID+"/"+pid+"/"+t;

            window.location.href=url;
        });
    });
*/


</script>
</body>
</html>
