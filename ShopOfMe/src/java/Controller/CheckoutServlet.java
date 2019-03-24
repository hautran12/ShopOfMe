/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.billDAO;
import Dao.billDetailDAO;
import Model.Bill;
import Model.Billdetail;
import Model.Cart;
import Model.Item;
import Model.SendMail;
import Model.Users;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HauTran
 */
public class CheckoutServlet extends HttpServlet {

    private final billDAO billDAO = new billDAO();
    private final billDetailDAO bddao = new billDetailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String bill_id = request.getParameter("bill_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    billDAO.deleteBill(Long.parseLong(bill_id));
                    url = "/admin/manager-bill.jsp";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Users users = (Users) session.getAttribute("user");
        try {
            Bill bill = new Bill();
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUsersID(users.getUserID());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal(cart.totalToCart());
            billDAO.insertBill(bill);
            for (Map.Entry<Long, Item> list : cart.getCartItem().entrySet()) {
                bddao.insertBillDetail(new Billdetail(0, bill.getBillID(),
                        list.getValue().getProduct().getProductID(),
                        list.getValue().getProduct().getProductPrice(),
                        list.getValue().getQuantity()));
            }
            SendMail sm = new SendMail();
            sm.sendMail(users.getUserEmail(), "TaoNe", "Hello," + users.getUserEmail() + "\nTotal:" + cart.totalToCart());
            cart = new Cart();
            session.setAttribute("cart", cart);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("/ShopOfMe/index.jsp");
    }
}
