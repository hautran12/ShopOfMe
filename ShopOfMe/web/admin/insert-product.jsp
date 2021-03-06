<%-- 
    Document   : insert-category
    Created on : Mar 20, 2019, 12:19:42 AM
    Author     : HauTran
--%>

<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.CategoryDAO"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Users"%>
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
            CategoryDAO categoryDAO = new CategoryDAO();
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/admin/login.jsp");
            }
            ArrayList<Category> listcate = categoryDAO.getlistCategory();
        %>
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Thông Tin Sản Phẩm</h3>
                    <form action="/ShopOfMe/ProductServlet" method="POST">
                        <table width="95%">
                            <tr><td><b>Tên Sản Phẩm</b></td><td><input type="text" name="tensanpham" class="sedang"></td></tr>
                            <tr><td><b>Gía Bán</b></td><td><input type="text" name="giasanpham" class="panjang"></td></tr>
                            <tr><td><b>Loại Sản Phẩm</b></td><td>
                                    <select name="loaisanpham">
                                        <option selected>-- Chọn Loại Sản phẩm --</option>
                                    <% for(Category c: listcate) { %>
                                    <option><%=c.getCategoryID()%></option>
                                    <% } %>
                                    </select>
                                </td></tr>
                            <tr><td><b>Mô tả sản phẩm</b></td><td><textarea name="motasanpham"></textarea></td></tr>
                            <tr><td><b>Hình ảnh</b></td><td><input type="text" name="hinhanh" class="panjang"></td></tr>
                            <tr><td></td><td>
                                    <input type="hidden" name="command" value="insert">
                                    <input type="submit" class="button" value="Thêm Sản Phẩm">
                                </td></tr>
                        </table>
                    </form>
                </div>
                <div class="clear"></div>
            <jsp:include page="footeradmin.jsp"></jsp:include>
        </div>
    </body>
</html>
