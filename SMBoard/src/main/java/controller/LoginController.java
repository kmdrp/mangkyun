package controller;

import model.dao.MemberDAO;
import model.dto.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

public class LoginController extends HttpServlet {
    HttpSession session=null;
    MemberDAO dao = new MemberDAO();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req, resp);
    }

    protected void doServ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        MemberDAO dao = new MemberDAO();
        String id = req.getParameter("id");
        String pw = req.getParameter("password");
        String nick = dao.getNick(id);
        boolean result = dao.login(id, pw);
        session = req.getSession();

        System.out.println(session);
        if(result){
            System.out.println("로그인 성공");
            session.setAttribute("id", id);
            session.setAttribute("nick", nick);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/board");
            session.setAttribute("id",id);
            dispatcher.forward(req,resp);
        }else{
            System.out.println("로그인 실패");
            resp.sendRedirect("/board/index.jsp");
        }
    }
}
