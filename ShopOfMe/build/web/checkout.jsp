<%-- 
    Document   : logout
    Created on : Mar 19, 2019, 3:10:59 PM
    Author     : HauTran
--%>

<%@page import="Model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout Page</title>
    </head>
    <body>   
        <% 
            Users users = (Users) session.getAttribute("user");
            if(users == null){
               response.sendRedirect("/ShopOfMe/login.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        
          <div class="container">
                <div class="account">
                    <h2 class="account-in">CHECKOUT</h2>
                    <form action="CheckoutServlet" method="POST">	
                        <div>
                            <span>Address*</span>
                            <input type="text" name="address">
                        </div>
                         <div>
                            <span>Payment*</span>
                            <select name="payment">
                                <option value="Bank transfer">Bank transfer</option>
                                <option value="Live">live</option>
                            </select>
                        </div>
                        <input type="submit" value="Checkout"> 
                    </form>
                </div>
            </div>
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
