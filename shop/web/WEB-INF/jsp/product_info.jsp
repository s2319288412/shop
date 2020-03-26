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
    <jsp:include page="header.jsp"></jsp:include>
    <div class="layui-row">
        <div class="content content-nav-base datails-content">

            <div class="data-cont-wrap w1200">
                <div class="crumb">
                    <a>首页</a>
                    <span>></span>
                    <a>所有商品</a>
                    <span>></span>
                    <a>产品详情</a>
                </div>
                <div class="product-intro layui-clear">
                    <form id="myForm" action="${pageContext.request.contextPath}/user/addCartItemToCart" method="post">
                    <div class="preview-wrap" style="padding-left: 70px"><%--images/details_img1.jpg--%>
                        <a><img src="${pageContext.request.contextPath}/${product.pimage}"></a>
                        <input type="hidden" name="pid" value="${product.pid}">
                    </div>
                    <div class="itemInfo-wrap">
                        <div class="itemInfo" style="padding-right:40px; ">
                            <div class="title">
                                <h4>${product.pdesc}</h4>
                            </div>
                            <div class="summary">
                                <p class="reference"><span>市场价</span> <del>￥${product.market_price}</del></p>
                                <p class="activity"><span>商城价</span><strong class="price"><i>￥</i>${product.shop_price}</strong></p>
                            </div>
                            <div class="choose-attrs">
                                <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="quantity" value="1"><span class="add btn">+</span></div></div>
                            </div>
                            <div class="choose-btns">
                                <button class="layui-btn layui-btn-primary purchase-btn" id="btn2">立刻购买</button>
                                <button class="layui-btn  layui-btn-danger car-btn" id="btn"><i class="layui-icon layui-icon-cart2-simple"></i>加入购物车</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="width: 1140px">
                    <legend>商品评价</legend>
                </fieldset>
                <%--评价部分--%>
                <div class="layui-row">
                    <div class="layui-col-md11 layadmin-homepage-list-imgtxt message-content" >
                        <c:if test="${empty evaluation}">
                            <div class="media-body" style="text-align: center">
                                <span>评价为空</span>
                            </div>
                        </c:if>


                        <c:if test="${not empty evaluation}">
                            <c:forEach items="${evaluation}" var="e">
                                <div class="media-body" style="margin: 20px">
                                     <p class="message-text" style="padding-left: 30px"> <a href="javascript:;" style="font-size: 20px">${e.user.username}：</a>${e.evaluate}</p>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>

       </div>

    <jsp:include page="bottom.jsp"></jsp:include>
</div>
</div>
</body>

<script type="text/javascript">
    $(function(){
        $("#btn").click(function(){
            var form=document.getElementById("myForm");

            form.submit();
        });
        $("#btn2").click(function(){
            var form=document.getElementById("myForm");

            form.submit();
        });
    });







    layui.config({
        base: '../layui/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','jquery'],function(){
        var mm = layui.mm,$ = layui.$;
        var cur = $('.number-cont input').val();
        $('.number-cont .btn').on('click',function(){
            if($(this).hasClass('add')){
                cur++;

            }else{
                if(cur > 1){
                    cur--;
                }
            }
            $('.number-cont input').val(cur)
        })

    });
</script>
</html>
