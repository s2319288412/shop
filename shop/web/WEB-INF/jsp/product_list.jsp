<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link href="${pageContext.request.contextPath}/layui/css/style2.css" rel='stylesheet' type='text/css' />
</head>
<body>
<div class="layui-container">
    <jsp:include page="header.jsp"></jsp:include>
    <%--//内容页--%>
    <div class="layui-row" style="padding-top: 20px;background: #f8f8f8">
        <div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
            <a lay-href="">主页</a><span lay-separator="">/</span>
            <a><cite>页面</cite></a><span lay-separator="">/</span>
            <a><cite>商品列表</cite></a>
        </div>
    </div>
        <div class="content content-nav-base commodity-content">
            <div class="commod-cont-wrap">
                <div class="commod-cont w1140 layui-clear">
                    <div class="left-nav">
                        <div class="title">所有分类</div>
                        <div class="list-box">
                            <dl>
                                <dt>精品男装</dt>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/1.3/1/6">T恤/卫衣</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/1.1/1/6">衬衫</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/1.2/1/6">毛衣/针织衫</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/1.4/1/6">长裤</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/1.5/1/6">短裤</a></dd>
                            </dl>
                            <dl>
                                <dt>时尚女装</dt>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/2.2/1/6">长袖T恤/卫衣</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/2.3/1/6">衬衫</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/2.1/1/6">毛衣/针织衫</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/2.4/1/6">长裤</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/2.5/1/6">短裤</a></dd>
                            </dl>
                            <dl>
                                <dt>都市运动----男士</dt>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/3.1/1/6">外套/夹克</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/3.2/1/6">短袖T恤</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/3.3/1/6">卫衣</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/3.4/1/6">裤装</a></dd>
                            </dl>
                            <dl>
                                <dt>都市运动----女士</dt>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/4.1/1/6">外套/夹克</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/4.2/1/6">短袖T恤</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/4.3/1/6">卫衣</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/toProduct_list/4.4/1/6">裙装</a></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="right-cont-wrap">
                        <div class="right-cont">
                            <div class="cont-list layui-clear" id="list-cont">
                                <c:forEach items="${pageInfo.list}" var="p">
                                <div class="item">
                                    <div class="img">
                                        <a href="${pageContext.request.contextPath}/toProduct_info/${p.pid}"><img src="${pageContext.request.contextPath}/${p.pimage}"></a>
                                    </div>
                                    <div class="text">
                                        <p class="title">${p.pname}</p>
                                        <p class="price">
                                            <span class="pri">￥${p.shop_price}</span>
                                        </p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row" style="text-align: center">
                    <div  id="page"></div>
                </div>

            </div>
    <jsp:include page="bottom.jsp"></jsp:include>
</div>

</body>
<%--<script src="${pageContext.request.contextPath}/layui/layui.js"></script>--%>
<script type="text/javascript">
            layui.use('laypage', function(){
                var laypage = layui.laypage;
                var url = "/toProduct_list/${cid}/";
                //执行一个laypage实例
                laypage.render({
                    elem: 'page' //注意，这里的 page 是 ID，不用加 # 号
                    ,count: ${infoCount} //数据总数，从服务端得到
                    ,curr:${pageNum}
                    ,limit:${pageSize}
                    ,jump: function(obj, first) {
                        //obj包含了当前分页的所有参数，比如：
                       // console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                        //console.log(obj.limit); //得到每页显示的条数
                        //首次不执行
                        if (!first) {
                            var page = obj.curr;
                            var eveyLimit = obj.limit;
                            //alert(url);
                            url=url+page+"/"+eveyLimit;
                            console.log(url); //得到每页显示的条数
                            window.location.href=url;
                        }
                    }
                });
                //分类动态
                $('.list-box dt').on('click',function(){
                    if($(this).attr('off')){
                        $(this).removeClass('active').siblings('dd').show()
                        $(this).attr('off','')
                    }else{
                        $(this).addClass('active').siblings('dd').hide()
                        $(this).attr('off',true)
                    }
                });
            });
        </script>
</html>
