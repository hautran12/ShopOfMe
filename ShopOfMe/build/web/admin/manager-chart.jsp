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
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
         <script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});
            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);
            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {
                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
                    <c:forEach var="item" items="${listitem}">['${item.name}',${item.value}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống Kê Danh Mục Sản Phẩm',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart'));
                chart.draw(data, options);
            }
        </script>
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
                    <h3>Biểu Đồ,Thống Kê</h3>
                    <table class="data">
                        <div id="Chart"></div>
                    </table>
                </div>
                <div class="clear"></div>
            <jsp:include page="footeradmin.jsp"></jsp:include>
        </div>
    </body>
</html>
