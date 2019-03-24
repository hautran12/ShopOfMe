<%-- 
    Document   : login
    Created on : Mar 18, 2019, 12:29:59 AM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <% %>

            <div class="container">
                <div class="account">
                    <h2 class="account-in">ĐĂNG NHẬP</h2>
                    <form action="UsersServlet" method="POST">
                        <% if(request.getParameter("error")!=null) {%>
                        <div>
                            <p style="color:red"><%=request.getParameter("error")%></p>
                        </div> 	
                        <%}%>
                        <div>
                            <span>Tài khoản*</span>
                            <input type="text" name="email">
                        </div> 	
                        <div> 
                            <span class="word">Mật khẩu*</span>
                            <input type="password" name="pass">
                        </div>	
                        <input type="hidden" value="login" name="command">
                        <input type="submit" value="Đăng nhập"> 
                    </form>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
