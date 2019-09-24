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
import java.util.List;

@WebServlet("/Selector")
public class Selector extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        MemberDAO memberDAO = new MemberDAO();
        List<MemberBean> memberlist = memberDAO.MemberInfo();

        if (memberlist == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("memberlist", memberlist);
            request.getRequestDispatcher("/WEB-INF/jsp/memberList.jsp").forward(request, response);
        }
    }
}
