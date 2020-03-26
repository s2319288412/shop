<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <title>Title</title>

</head>
<style>
    td{
        text-align: center;
    }
</style>
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
            <a >订单列表</a>
        </div>
        <div style="text-align: center;">
            <table class="layui-table" style="width: 80%;margin-left: 118px;">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>

                <c:forEach items="${pageInfo.list}" var="o">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>${o.oid}</th>
                    <th>总金额</th>
                    <th>${o.total}元</th>
                    <c:if test="${o.state==1}">
                    <th><a  class="layui-btn layui-btn-danger" href="${pageContext.request.contextPath}/user/findOrderByOid/${o.oid}">付款</a></th>
                    </c:if>
                    <c:if test="${o.state==2}">
                        <th><a class="layui-btn layui-btn-danger" href="${pageContext.request.contextPath}/user/evaluate/${o.oid}">评价</a></th>
                    </c:if>
                    <c:if test="${o.state==3}">
                        <th><a class="layui-btn layui-btn-disabled" href="#">完成</a></th>
                    </c:if>
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
                    <c:forEach items="${o.list}" var="item">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/${item.product.pimage}"></td>
                        <td>${item.product.pname}</td>
                        <td>${item.product.shop_price}</td>
                        <td>${item.quantity}</td>
                        <td>${item.total}元</td>
                    </tr>
                    </c:forEach>
                </tbody>
                </c:forEach>




            </table>
        </div>



    </div>


    <%--分页--%>
    <div class="layui-row" style="text-align: center">
        <div  id="page"></div>
    </div>

    <jsp:include page="../bottom.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        var url = "/user/toOrderList/";
        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 page 是 ID，不用加 # 号
            ,count:${infoCount}//数据总数，从服务端得到
            ,curr:${pageNum}
            ,limit:${pageSize}
            ,jump: function(obj, first) {

                //首次不执行
                if (!first) {
                    var page = obj.curr;
                    var eveyLimit = obj.limit;
                    url=url+page+"/"+eveyLimit;
                    window.location.href=url;
                }
            }
        });
    })

</script>
</html>
