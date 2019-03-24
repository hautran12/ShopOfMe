<%-- 
    Document   : menu
    Created on : Mar 19, 2019, 11:46:08 PM
    Author     : HauTran
--%>

<%@page import="Model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <% 
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/admin/login.jsp");
            }
        %>
        <div id="leftBar">
            <ul>
                <li><a href="${root}/ShopOfMe/admin/index.jsp">Trang Chủ</a></li>
                <li><a href="${root}/ShopOfMe/admin/manager-category.jsp">Danh mục</a></li>
                <li><a href="${root}/ShopOfMe/admin/manager-product.jsp">Sản phẩm</a></li>
                <li><a href="${root}/ShopOfMe/admin/manager-bill.jsp">Hóa đơn</a></li>
                <li><a href="${root}/ShopOfMe/ChartServlet">Thống kê</a></li>
            </ul>
        </div>
    </body>
</html>