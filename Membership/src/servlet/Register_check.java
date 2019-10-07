package servlet;

import model.MemberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Check")
public class Register_check extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phone_addr = request.getParameter("phone_addr");
        String addr = request.getParameter("addr");
        String auth = request.getParameter("auth");
        String password = request.getParameter("password");

        MemberBean memberBean = new MemberBean(Integer.parseInt(id), name, phone_addr, addr, auth, password);

        HttpSession session = request.getSession();

        session.setAttribute("memberBean", memberBean);

        request.getRequestDispatcher("WEB-INF/jsp/memberRegisterCheck.jsp").forward(request, response);
    }
}
