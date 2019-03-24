<%-- 
    Document   : manager-bill
    Created on : Mar 20, 2019, 12:14:19 AM
    Author     : HauTran
--%>

<%@page import="Model.Users"%>
<%@page import="Dao.UsersDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.billDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Hóa Đơn</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <% 
            billDAO dao = new billDAO();
            ArrayList<Bill> listBill = dao.getListBill();
            UsersDao usersDao = new UsersDao();
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/admin/login.jsp");
            }
        %>
         <jsp:include page="headeradmin.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Quản Lý Hóa Đơn</h3>
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="65px">Mã Hóa Đơn</th>
                            <th class="data">Khách Hàng</th>
                            <th class="data">Tổng Hóa Đơn</th>
                            <th class="data">Hình Thức</th>
                            <th class="data">Địa Chỉ Giao Hàng</th>
                            <th class="data">Ngày Mua</th>
                            <th class="data" width="100px">Tùy Chọn</th>
                        </tr>
                    <% 
                        for(Bill bill: listBill) { 
                    %>
                        <tr class="data">
                            <td class="data" width="65px"><%=bill.getBillID()%></td>
                            <td class="data"><%=usersDao.getUser(bill.getUsersID()).getUserEmail()%></td>
                            <td class="data"><%=bill.getTotal()%></td>
                            <td class="data"><%=bill.getPayment()%></td>
                            <td class="data"><%=bill.getAddress()%></td>
                            <td class="data"><%=bill.getDate()%></td>
                            <td class="data" width="100px">
                                <a href="#">Hoàn Thành</a> |
                                <a href="/ShopOfMe/CheckoutServlet?command=delete&bill_id=<%=bill.getBillID()%>">Hủy</a>
                            </td>
                        </tr>
                      <% } %>
                    </table>
                </div>
                <div class="clear"></div>
            <jsp:include page="footeradmin.jsp"></jsp:include>
        </div>
    </body>
</html>
