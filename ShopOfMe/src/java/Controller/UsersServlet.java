/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UsersDao;
import Model.MD5;
import Model.Users;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HauTran
 */
@WebServlet(name="/user.html")
public class UsersServlet extends HttpServlet {

    UsersDao usersDao = new UsersDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                users.setUserEmail(request.getParameter("email"));
                users.setUserPassword(MD5.encryption(request.getParameter("pass")));
                users.setUserRole(false);
                usersDao.insertUser(users);
                session.setAttribute("user", users);
                url = "/index.jsp";
                break;
            case "login":
                users = usersDao.login(request.getParameter("email"),
                        MD5.encryption(request.getParameter("pass")));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/index.jsp";
                } else {
                    request.setAttribute("error", "Error email or password");
                    url = "/login.jsp";
                }
                break;
            case "loginadmin":
                users = usersDao.login(request.getParameter("email"),
                        MD5.encryption(request.getParameter("pass")));
                if(users!=null && users.isUserRole()){
                    session.setAttribute("user", users);
                    url = "/admin/index.jsp";
                }else {
                    url = "/admin/login.jsp";
                }
        }
        RequestDispatcher rs = getServletContext().getRequestDispatcher(url);
        rs.forward(request, response);
    }

}
