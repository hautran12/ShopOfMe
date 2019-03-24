<%-- 
    Document   : login
    Created on : Mar 20, 2019, 12:16:40 AM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>

        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form method="POST" action="/ShopOfMe/UsersServlet">
                    <label>Email</label><br>
                    <input type="text" name="email"><br>
                    <label>Password</label><br>
                    <input type="password" name="pass"><br>
                    <input type="hidden" value="loginadmin" name="command">
                    <input type="submit" class="button" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>
