package servlet;

import dao.MemberDAO;
import model.LoginBean;
import model.MemberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Comp")
public class Register_comp extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        MemberBean memberBean = new MemberBean();
        memberBean = (MemberBean)session.getAttribute("memberBean");

        MemberDAO memberDAO = new MemberDAO();
        boolean successMember = memberDAO.insertMember(memberBean);

        LoginBean loginBean = new LoginBean(memberBean.getName(), memberBean.getPassword());

        if (successMember) {
            session.setAttribute("loginBean", loginBean);
            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
        } else {
            session.setAttribute("error","既に存在しているIDです。");
            request.getRequestDispatcher("WEB-INF/jsp/memberRegisterForm.jsp").forward(request, response);
        }
    }
}
