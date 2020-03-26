<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <script src="${pageContext.request.contextPath}/layui/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/layui/css/style2.css" rel='stylesheet' type='text/css' />

</head>
<body>
<div class="layui-container">
    <jsp:include page="header.jsp"></jsp:include>
    <div style="height: 70%">
        <div class="layui-row" id="bg" >
            <div class="row" style="padding-top: 20px;" >

                <div class="col-md-2"></div>
                <div class="col-md-8" style="background:whitesmoke;border:3px solid #ccc; text-align: center;width: 750px;height: 600px; margin: 50px 200px;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>会员注册</legend>
                    </fieldset>
                    <form class="layui-form" action="${pageContext.request.contextPath}/register" method="post" >
                        <div style="padding-left: 170px;" >
                            <div class="layui-form-item" >
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="username" id="username" onblur="checkUserName()" lay-verify="required|username" lay-reqtext="用户名是必填项，岂能为空？"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" lay-verify="required|password" lay-reqtext="密码是必填项，岂能为空？" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">验证密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="confirmPass" lay-verify="required|confirmPass" lay-reqtext="验证密码是必填项，岂能为空？" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="email" name="email" lay-verify="required|email" lay-reqtext="邮箱是必填项，岂能为空？" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">手机</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="telephone" lay-verify="required|phone" lay-reqtext="手机是必填项，岂能为空？" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="name"  lay-verify="required|name" lay-reqtext="姓名是必填项，岂能为空？" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline">
                                    <input type="radio" name="sex" value="男" title="男" checked>
                                    <input type="radio" name="sex" value="女" title="女">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">生日日期</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="birthday" id="date" lay-verify="date" placeholder="请输入生日" autocomplete="off" class="layui-input" lay-key="1">
                                </div>
                            </div>

                        </div>




                        <div class="layui-form-item" >
                            <div class="layui-input-block" style="padding-right: 70px;">
                                <button type="submit" class="layui-btn layui-btn-primary" lay-submit="" lay-filter="demo1">提交</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-md-2"></div>

            </div>
        </div>

    <jsp:include page="bottom.jsp"></jsp:include>
</div>




</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>

    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        form.verify({
            username : function(value, item) {
                var checkValue = value.trim();
                var checkResult='';
                $.ajax({
                    url : '${pageContext.request.contextPath}/checkUserName.do',
                    type : 'POST',
                    data : {
                        "username" : checkValue
                    },
                    datatype : 'json',
                    async : false,
                    success : function(result) {
                        if (!result) {
                            checkResult='用户名已存在，请重新输入'
                        }
                    }
                });
                return checkResult
            }
        })
        //自定义验证规则
        form.verify({
            password: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,confirmPass:function(value){
                if($('input[name=password]').val() !== value)
                    return '两次密码输入不一致！';
            }
            ,phone:[/(^$)|^1\d{10}$/,'请输入正确的手机号']
            ,email:[/(^$)|^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,'邮箱格式不正确']
            ,
        });
        //日期

        laydate.render({
            elem: '#date'
            ,trigger: 'click'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');


       //监听提交
        /*form.on('submit(demo1)', function(data){
            /!*layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })*!/

            return false;
        });*/



        //表单取值
       /* layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });*/

    });
</script>
</html>
