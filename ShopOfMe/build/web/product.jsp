<%-- 
    Document   : product
    Created on : Mar 18, 2019, 12:37:41 AM
    Author     : HauTran
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Product"%>
<%@page import="Dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
    <body>
        <% ProductDAO productDAO = new ProductDAO();
            long categoryID = 0;
                if(request.getParameter("categoryID")!=null){
                categoryID = (long) Long.parseLong(request.getParameter("categoryID"));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null){
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            int pages = 0,firstResult=0,maxResult=0,total=0;
            if(request.getParameter("pages")!=null){
                pages = Integer.parseInt(request.getParameter("pages"));
            }
            total = productDAO.countProductByCategory(categoryID);
            if(total<=8){
                firstResult=1;
                maxResult=total;
            }else{
                firstResult = (pages-1) * 8;
                maxResult=8;
            }
            ArrayList<Product> listProduct = productDAO.getListProductByNav(categoryID, firstResult, maxResult);
        %>
         <jsp:include page="header.jsp"></jsp:include>
        <!---->
        <br /><br />
        <div class="container">
            <div class="content">
                <div class="content-top">
                    <h3 class="future">Danh Sách Sản Phẩm</h3>
                    <div class="content-top-in">
                    <% for(Product p : listProduct){ %> 
                        <div class="col-md-3 md-col">
                            <div class="col-md">
                                <a href="single.jsp?productID=<%=p.getProductID()%>"><img  src="<%=p.getProductImage()%>" alt="" /></a>	
                                <div class="top-content">
                                    <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                    <div class="white">
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">Thêm Vào Giỏ Hàng</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span><%=p.getProductPrice()%></span></p>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>							
                            </div>
                        </div>
                        <% } %>
           
                        <div class="clearfix"></div>
                    </div>
                </div>
                <ul class="start">
                    <li ><a href="#"><i></i></a></li>
                    <% for (int i = 1;i<=(total/8)+1;i++){ %> 
                    <li class="arrow"><a href="product.jsp?categoryID=<%=categoryID%>&pages=<%=i%>"><%=i%></a></li>
                    <%}%>
                    <li ><a href="#"><i class="next"> </i></a></li>
                </ul>
            </div>
        </div>
         <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
