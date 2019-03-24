<%-- 
    Document   : manager-category
    Created on : Mar 20, 2019, 12:00:14 AM
    Author     : HauTran
--%>

<%@page import="Model.Users"%>
<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Danh Mục</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getlistCategory();
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/admin/login.jsp");
            }
        %>
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Quản Lý Danh Mục</h3>
                    <a href="${root}/admin/insert-category.jsp">Thêm Danh Mục</a>
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">Mã Danh Mục</th>
                            <th class="data">Tên Danh Mục</th>
                            <th class="data" width="90px">Tùy Chọn</th>
                        </tr>
                    <%
                        int count = 0;
                        for (Category c: listCategory) {
                            count++;
                    %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=c.getCategoryID()%></td>
                            <td class="data"><%=c.getCategoryName()%></td>
                            <td class="data" width="90px">
                         
                        <center>
                            <a href="${root}/admin/update-category.jsp?command=update&categoryID=<%=c.getCategoryID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="/ShopOfMe/ManagerServlet?command=delete&categoryID=<%=c.getCategoryID()%>">Xóa</a>
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
