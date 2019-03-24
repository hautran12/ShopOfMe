/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CategoryDAO;
import Dao.ProductDAO;
import Model.Category;
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
public class ManagerServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String categoryID = request.getParameter("categoryID");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    categoryDAO.deleteCategory(Long.parseLong(categoryID));
                    url = "/admin/manager-category.jsp";
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
        String tendanhmuc = request.getParameter("tendanhmuc");
        String url = "", error = "";

        if (tendanhmuc.equals("")) {
            error = "Vui lòng nhập tên danh mục";
            request.setAttribute("error", error);
        }
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        categoryDAO.insertCategory(new Category(0, tendanhmuc));
                        url = "/admin/manager-category.jsp";
                        break;
                    case "update":
                        categoryDAO.updateCategory(new Category(Long.parseLong(request.getParameter("categoryID")),tendanhmuc));
                        url = "/admin/manager-category.jsp";
                        break;
                }
            } else {
                url = "/admin/insert-category.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response); 
    }

}
