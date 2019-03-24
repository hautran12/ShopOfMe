<%-- 
    Document   : content
    Created on : Mar 18, 2019, 12:27:28 AM
    Author     : HauTran
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="Dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content Page</title>
    </head>
    <body>
        <% ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> listProduct = productDAO.getAllListProduct();
        %>
        <!---->
        <div class="container">
            <div class="content">
                <div class="content-top">
                    <h3 class="future">Sản Phẩm</h3>
                    <div class="content-top-in">
                        <% for (Product p : listProduct) {%> 
                        <div class="col-md-3 md-col">
                            <div class="col-md">
                                <a href="single.jsp?productID=<%=p.getProductID()%>"><img  src="<%=p.getProductImage()%>" alt="" /></a>	
                                <div class="top-content">
                                    <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                    <div class="white">
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">Thêm vào giỏ hàng</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span><%=p.getProductPrice()%></span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <% }%>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!---->
                <div class="content-middle">
                    <h3 class="future">Nhãn hiệu</h3>
                    <div class="content-middle-in">
                        <ul id="flexiselDemo1">			
                            <li><img src="images/ap2.png"/></li>
                            <li><img src="images/converse.png"/></li>
                            <li><img src="images/ap.png"/></li>
                            <li><img src="images/ap1.png"/></li>
                            <li><img src="images/ap3.png"/></li>
                            <li><img src="images/nike.png"/></li>
                            <li><img src="images/vans.png"/></li>
                            <li><img src="images/puma.png"/></li>
                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo1").flexisel({
                                    visibleItems: 4,
                                    animationSpeed: 1000,
                                    autoPlay: true,
                                    autoPlaySpeed: 3000,
                                    pauseOnHover: true,
                                    enableResponsiveBreakpoints: true,
                                    responsiveBreakpoints: {
                                        portrait: {
                                            changePoint: 480,
                                            visibleItems: 1
                                        },
                                        landscape: {
                                            changePoint: 640,
                                            visibleItems: 2
                                        },
                                        tablet: {
                                            changePoint: 768,
                                            visibleItems: 3
                                        }
                                    }
                                });

                            });
                        </script>
                        <script type="text/javascript" src="js/jquery.flexisel.js"></script>

                    </div>
                </div>
                <!---->
                <div class="content-bottom">
                    <h3 class="future">Khuyến mãi</h3>
                    <div class="content-bottom-in">
                        <ul id="flexiselDemo2">	
                            <% for (Product p : listProduct) {%> 
                            <li> 
                                <div class="col-md men">
                                    <a href="single.jsp?productID=<%=p.getProductID()%>" class="compare-in "><img  src="<%=p.getProductImage()%>" alt="" />
                                        <div class="compare in-compare">  
                                        </div></a>
                                    <div class="top-content bag">
                                        <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                        <div class="white">
                                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">Thêm giỏ hàng</a>
                                            <p class="dollar"><span class="in-dollar">$</span><span><%=p.getProductPrice()%></span></p>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>							
                                </div>  
                            </li>
                             <% }%>
                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo2").flexisel({
                                    visibleItems: 4,
                                    animationSpeed: 1000,
                                    autoPlay: true,
                                    autoPlaySpeed: 3000,
                                    pauseOnHover: true,
                                    enableResponsiveBreakpoints: true,
                                    responsiveBreakpoints: {
                                        portrait: {
                                            changePoint: 480,
                                            visibleItems: 1
                                        },
                                        landscape: {
                                            changePoint: 640,
                                            visibleItems: 2
                                        },
                                        tablet: {
                                            changePoint: 768,
                                            visibleItems: 3
                                        }
                                    }
                                });

                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
