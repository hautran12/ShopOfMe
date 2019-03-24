<%-- 
    Document   : headeradmin
    Created on : Mar 19, 2019, 11:42:45 PM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div id="header">
            <div class="inHeader">
                <div class="mosAdmin">
                    Hallo, My ShoesManager<br>
                    <a href="${root}/ShopOfMe/index.jsp">Trở về</a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>
