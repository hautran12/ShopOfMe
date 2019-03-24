package Controller;

import Dao.UsersDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HauTran
 */
public class CheckEmailServlet extends HttpServlet {

    UsersDao usersDao = new UsersDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (usersDao.checkMail(request.getParameter("email"))) {
            response.getWriter().write("<img src=\"img/not-available.png\" />");
        } else {
            response.getWriter().write("<img src=\"img/check.jpg\" />");
        }
    }
}
