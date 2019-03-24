<%-- 
    Document   : detail
    Created on : Mar 18, 2019, 2:19:20 AM
    Author     : HauTran
--%>

<%@page import="Model.Product"%>
<%@page import="Dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title> <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>

        <%
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String productID = "";
            if (request.getParameter("productID") != null) {
                productID = request.getParameter("productID");
                product = productDAO.getProduct(Long.parseLong(productID));
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="single">
                    <div class="col-md-9 top-in-single">
                        <div class="col-md-5 single-top">	
                            <ul id="etalage">
                                <li>
                                    <a href="optionallink.html">
                                        <img class="etalage_thumb_image img-responsive" src="<%=product.getProductImage()%>" alt="" >
                                </a>
                            </li>
                        </ul>

                    </div>	
                    <div class="col-md-7 single-top-in">
                        <div class="single-para">
                            <h4><%=product.getProductName()%></h4>
                            <div class="para-grid">
                                <span  class="add-to">$<%=product.getProductPrice()%></span>
                                <a href="CartServlet?command=plus&productID=<%=product.getProductID()%>" class="hvr-shutter-in-vertical cart-to">Thêm giỏ hàng</a>					
                                <div class="clearfix"></div>
                            </div>
                            <h5>100 items in stock</h5>
                            <div class="available">
                                <h6>Available Options :</h6>
                                <ul>
                                    <li>Color:
                                        <select>
                                            <option>Silver</option>
                                            <option>Black</option>
                                            <option>Dark Black</option>
                                            <option>Red</option>
                                        </select></li>
                                    <li>Size:<select>
                                            <option>Large</option>
                                            <option>Medium</option>
                                            <option>small</option>
                                            <option>Large</option>
                                            <option>small</option>
                                        </select></li>
                                    <li>Quality:<select>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select></li>
                                </ul>
                            </div>
                            <p><%=product.getProductDescription()%></p>
                            <a href="#" class="hvr-shutter-in-vertical ">More details</a>

                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="content-top-in">
                        <div class="col-md-4 top-single">
                            <div class="col-md">
                                <img  src="images/nike1.jpg" alt"" />	
                                <div class="top-content">
                                    <h5>Nike</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <div class="col-md-4 top-single">
                            <div class="col-md">
                                <img  src="images/vans2.jpg" alt="" />	
                                <div class="top-content">
                                    <h5>Vans</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <div class="col-md-4 top-single-in">
                            <div class="col-md">
                                <img  src="images/giaycon.jpg" alt="" />	
                                <div class="top-content">
                                    <h5>Chuck all star</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="fb-comments" data-href="http://localhost:8080/ShopOfMe/single.jsp?productID=<%=productID%>" data-width="850" data-numposts="10"></div>
                </div>
                <div class="col-md-3">
                    <div class="single-bottom">
                        <h4>Categories</h4>
                        <ul>
                            <li><a href="#"><i> </i>Fusce feugiat</a></li>
                            <li><a href="#"><i> </i>Mascot Kitty</a></li>
                            <li><a href="#"><i> </i>Fusce feugiat</a></li>
                            <li><a href="#"><i> </i>Mascot Kitty</a></li>
                            <li><a href="#"><i> </i>Fusce feugiat</a></li>
                        </ul>
                    </div>
                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <ul>
                            <li><a href="#"><i> </i>feugiat(5)</a></li>
                            <li><a href="#"><i> </i>Fusce (4)</a></li>
                            <li><a href="#"><i> </i> feugiat (4)</a></li>
                            <li><a href="#"><i> </i>Fusce (4)</a></li>
                            <li><a href="#"><i> </i> feugiat(2)</a></li>
                        </ul>
                    </div>
                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/con1.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Chuck talor all star 1970s Vingate</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/con2.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Chuck talor all star high street</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/con3.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Chuck talor all star Madision</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
