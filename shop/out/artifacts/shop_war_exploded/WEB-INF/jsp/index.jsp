<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>服装商城</title>
    <%--<script src="${pageContext.request.contextPath}/layui/jquery-1.11.3.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
</head>
<body>
<div class="layui-container" >
    <%--头部--%>
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 轮播图 -->
    <div class="layui-row" style="margin-top: 10px;">
        <div class="layui-carousel" id="test1">
            <div carousel-item  >
                <div><img src="${pageContext.request.contextPath}/layui/img/ad/1.jpg" style="width: 100%; height: 100%;"></div>
                <div><img src="${pageContext.request.contextPath}/layui/img/ad/2.jpg" style="width: 100%; height: 100%;"></div>
                <div><img src="${pageContext.request.contextPath}/layui/img/ad/3.jpg" style="width: 100%; height: 100%;"></div>
            </div>
        </div>
    </div>
    <!-- 最新商品 -->
    <div class="layui-row" style="margin-top: 5px;">
        <h2>最新商品<img src="${pageContext.request.contextPath}/layui/img/title.jpg"></h2>
    </div>
    <div class="layui-row" style="margin-top: 5px;background: #f8f8f8"><%--border:1px solid red;--%>

                <c:forEach items="${News}" var="p">
                    <div class="layui-col-md3 layui-anim layui-anim-upbit" style="padding: 10px 0px 10px 0px; text-align: center;">
                        <a href="${pageContext.request.contextPath}/toProduct_info/${p.pid}"><img src="${pageContext.request.contextPath}/${p.pimage}" />￥${p.shop_price}</a>

                    </div>
                </c:forEach>





    </div>

    <!-- 最热商品 -->
    <div class="layui-row" style="margin-top: 5px;">
        <h2>最热商品<img src="${pageContext.request.contextPath}/layui/img/title.jpg"></h2>
    </div>
    <div class="layui-row" style="margin-top: 5px;background: #f8f8f8">
        <c:forEach items="${Hots}" var="p">
            <div class="layui-col-md3 layui-anim layui-anim-upbit" style="padding: 10px 0px 10px 0px; text-align: center;">
                <a href="${pageContext.request.contextPath}/toProduct_info/${p.pid}"><img src="${pageContext.request.contextPath}/${p.pimage}" />￥${p.shop_price}</a>

            </div>
        </c:forEach>

    </div>
    <%--导入底部--%>
    <jsp:include page="bottom.jsp"></jsp:include>
</div>






</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    //轮播图
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%'//设置容器宽度
            ,height: "420px"
            ,arrow: 'always'//始终显示箭头

            //,anim: 'updown' //切换动画方式
        });
    });
</script>
</html>
