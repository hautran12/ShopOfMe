<%-- 
    Document   : index
    Created on : Mar 19, 2019, 11:42:02 PM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <jsp:include page="contentadmin.jsp"></jsp:include>
            <jsp:include page="footeradmin.jsp"></jsp:include>
        </div>

    </body>
</html>
