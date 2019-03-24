<%-- 
    Document   : insert-category
    Created on : Mar 20, 2019, 12:19:42 AM
    Author     : HauTran
--%>

<%@page import="Model.Users"%>
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
            String error = "";
            if(request.getParameter("error")!=null){
                error = request.getParameter("error");
            }
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/admin/login.jsp");
            }
        %>
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Thông tin danh mục</h3>
                    <form action="/ShopOfMe/ManagerServlet" method="POST">
                        <table width="95%">
                            <tr>
                                <td style="float: right"><b>Tên Danh Mục</b></td>
                                <td><input type="text" class="sedang" name="tendanhmuc"><%=error%></td>
                            </tr>
                            <tr><td></td>
                                <td>
                                    <input type="hidden" name="command" value="insert">
                                    <input type="submit" class="button" value="Lưu Dữ Liệu">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="clear"></div>
            <jsp:include page="footeradmin.jsp"></jsp:include>
        </div>
    </body>
</html>
