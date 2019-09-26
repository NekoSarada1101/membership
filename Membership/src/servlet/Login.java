
package servlet;

import dao.MemberDAO;
import model.LoginBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        MemberDAO memberDAO = new MemberDAO();

        LoginBean loginBean = memberDAO.findMember(name, password);

        String path = "";
        HttpSession session = request.getSession();
        if (loginBean == null) {
            session.setAttribute("loginFailed", "名前またはパスワードが間違っています。");
            path = "WEB-INF/jsp/login.jsp";
        } else {
            session.setAttribute("loginBean", loginBean);
            path = "WEB-INF/index.jsp";
        }
        request.getRequestDispatcher(path).forward(request, response);
    }
}
