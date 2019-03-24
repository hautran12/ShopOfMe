<%-- 
    Document   : register
    Created on : Mar 18, 2019, 12:34:29 AM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#email").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });
                function check_username_ajax(email) {
                    $("#user-result").html('<img src="img/ajax-spinner.gif" />');
                    $.post('CheckEmailServlet', {'email': email}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="account">
                    <h2 class="account-in">ĐĂNG KÝ</h2>
                    <form action="UsersServlet" method="POST">
                        <div>
                            <span class="word">Tài Khoản*</span>
                            <input type="text" name="email" id="email">
                            <span id="user_result"></span>
                        </div> 
                        <div> 
                            <span class="word">Mật Khẩu*</span>
                            <input type="password" name="pass" >
                        </div>
                        <input type="hidden" name="command" value="insert">
                        <input type="submit" value="Đăng ký">
                    </form>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
