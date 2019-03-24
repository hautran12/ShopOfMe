/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CategoryDAO;
import Dao.ProductDAO;
import Model.Product;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HauTran
 */
public class ProductServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    productDAO.deleteProduct(Long.parseLong(product_id));
                    url = "/admin/manager-product.jsp";
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
        String command = request.getParameter("command");
        String tensanpham = request.getParameter("tensanpham");
        Double giasanpham = Double.parseDouble(request.getParameter("giasanpham"));
        String loaisanpham = request.getParameter("loaisanpham");
        String motasanpham = request.getParameter("motasanpham");
        String hinhanh = request.getParameter("hinhanh");
        String url = "";
        try {
            switch (command) {
                case "insert":
                    productDAO.insertProduct(new Product(0, tensanpham, hinhanh, giasanpham, motasanpham, Long.parseLong(loaisanpham)));
                    url = "/admin/manager-product.jsp";
                    break;
                case "update":
                    productDAO.updateCategory(new Product(Long.parseLong(request.getParameter("product_id")),
                                tensanpham, hinhanh, giasanpham, motasanpham, Long.parseLong(loaisanpham)));
                    url = "/admin/manager-product.jsp";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
