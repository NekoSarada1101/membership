
package servlet;

import dao.MemberDAO;
import model.MemberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Register")
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("WEB-INF/jsp/memberRegisterForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phone_addr = request.getParameter("phone_addr");
        String addr = request.getParameter("addr");
        String auth = request.getParameter("auth");
        String password = request.getParameter("password");

        MemberBean memberBean = new MemberBean(Integer.parseInt(id), name, phone_addr, addr, auth, password);

        MemberDAO memberDAO = new MemberDAO();

        boolean successMember = memberDAO.insertMember(memberBean);

        HttpSession session = request.getSession();
        if (successMember) {
            session.setAttribute("memberBean", memberBean);
            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
        } else {
            session.setAttribute("error","既に存在しているIDです。");
            request.getRequestDispatcher("WEB-INF/jsp/memberRegisterForm.jsp").forward(request, response);
        }
    }
}
