<%-- 
    Document   : manager-product
    Created on : Mar 20, 2019, 12:09:47 AM
    Author     : HauTran
--%>

<%@page import="Model.Users"%>
<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page import="Dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Sản Phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> listProduct = productDAO.getAllListProduct();
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/admin/login.jsp");
            }
        %>
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Quản Lý Sản Phẩm</h3>
                    <a href="${root}/admin/insert-product.jsp">Thêm Sản Phẩm</a>
                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">Mã Sản Phẩm</th>
                        <th class="data">Tên Sản Phẩm</th> 
                        <th class="data">Giá sản phẩm</th>
                        <th class="data" width="75px">Tùy Chọn</th>
                    </tr>
                    <%
                        for (Product c : listProduct) {
                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=c.getProductID()%></td>
                        <td class="data"><%=c.getProductName()%></td>`
                        <td class="data"><%=c.getProductPrice()%></td>
                        <td class="data" width="75px">
                    <center>
                        <a href="${root}/admin/update-product.jsp?command=update&product_id=<%=c.getProductID()%>">Sữa</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="/ShopOfMe/ProductServlet?command=delete&product_id=<%=c.getProductID()%>">Xóa</a>
                    </center>
                    </td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footeradmin.jsp"></jsp:include>
        </div>
    </body>
</html>
