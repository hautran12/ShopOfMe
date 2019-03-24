<%-- 
    Document   : banner
    Created on : Mar 18, 2019, 12:25:05 AM
    Author     : HauTran
--%>

<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> listProduct = productDAO.getAllListProduct();
        %>
        <div class="banner-mat">
            <div class="container">
                <div class="banner">
                    <!-- Slideshow 4 -->
                    <div class="slider">
                        <ul class="rslides" id="slider1">
                            <li><img src="images/banner-web.jpg" alt="">
                            </li>  
                            <li><img src="images/banner-web3.jpg" alt="">
                            </li>
                            <li><img src="images/banner-web4.jpg" alt="">
                            </li>
                            <li><img src="images/banner-web5.jpg" alt="">
                            </li>
                        </ul>
                    </div>
                    <div class="banner-bottom">     
                            <div class="banner-matter">
                                <p>Childish Gambino - Camp Now Available for just $9.99</p> 
                                <a href="single.jsp" class="hvr-shutter-in-vertical ">Purchase</a>
                            </div>
                        <div class="clearfix"></div>
                    </div>
                </div>				
                <!-- //slider-->
            </div>
        </div>
    </body>
</html>
