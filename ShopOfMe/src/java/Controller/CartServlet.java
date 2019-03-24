/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ProductDAO;
import Model.Cart;
import Model.Item;
import Model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HauTran
 */
public class CartServlet extends HttpServlet {
    
    private ProductDAO productDAO = new ProductDAO();
    

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productID = request.getParameter("productID");
        Cart cart = (Cart) session.getAttribute("cart");
        
        try {
            Long idProduct = Long.parseLong(productID);
            Product product = productDAO.getProduct(Long.parseLong(productID));
            switch(command){
                case "plus":
                    if(cart.getCartItem().containsKey(idProduct)){
                        cart.plusToCart(idProduct,new Item(product, 
                                cart.getCartItem().get(idProduct).getQuantity()));
                    }else{
                        cart.plusToCart(idProduct, new Item(product, 1));
                    }
                    break;
                case "remove":
                    cart.removeToCart(idProduct);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/ShopOfMe/index.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/ShopOfMe/index.jsp");
    }

   

}
