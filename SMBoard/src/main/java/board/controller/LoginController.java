package board.controller;

import controller.Controller;
import model.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

public class LoginController implements Controller {
    MemberDAO memberDAO;
    HttpSession session;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            memberDAO = new MemberDAO();
            String id = request.getParameter("id");
            String pw = request.getParameter("password");
            boolean result=memberDAO.login(id, pw);
            if (result) {
                session = request.getSession();
                session.setAttribute("id", id);
                String nick = memberDAO.getNick(id);
                session.setAttribute("nick",nick);
            }else{
                PrintWriter writer = null;
                writer = new PrintWriter(new OutputStreamWriter(response.getOutputStream()));
                writer.println("<alert>아이디 패스워드를 확인하세요</alert>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResultView() {
        return "/board.do";
    }

    public boolean isFoward() {
        return true;
    }
}
