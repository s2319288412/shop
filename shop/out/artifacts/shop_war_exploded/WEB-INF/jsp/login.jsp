<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <script src="${pageContext.request.contextPath}/layui/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link href="${pageContext.request.contextPath}/layui/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<script>
    $(document).ready(function(c) {
        $('.close').on('click', function(c){
            window.location="${pageContext.request.contextPath}/index";
        });
    });
</script>



    <div class="layui-row"  >
            <!--SIGN UP-->
            <h1>会员登录</h1>
            <div class="login-form">
                <div class="close"> </div>
                <div class="head-info">
                    <label class="lbl-1"> </label>
                    <label class="lbl-2"> </label>
                    <label class="lbl-3"> </label>
                </div>
                <div class="clear"> </div>
                <div class="avtar">
                    <img src="${pageContext.request.contextPath}/layui/images/avtar.png" />
                </div>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <input type="text" class="text" name="username" value="username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" >
                    <div class="key">
                        <input type="password" name="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
                    </div>

                <div class="signin">
                    <input type="submit" value="Login" >
                </div>
                </form>
            </div>
    </div>


</body>
</html>