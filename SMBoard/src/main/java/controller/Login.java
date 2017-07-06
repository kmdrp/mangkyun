package controller;

import model.dao.MemberDAO;
import model.dto.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class Login extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req, resp);
    }

    protected void doServ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDAO dao = new MemberDAO();
        String id = req.getParameter("id");
        String pw = req.getParameter("password");
        boolean result = dao.login(id, pw);

        if(result){
            System.out.println("로그인 성공");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/board/test.jsp");
            req.setAttribute("id", id);
            req.setAttribute("pw", pw);
            dispatcher.forward(req,resp);
        }else{
            System.out.println("로그인 실패");
            resp.sendRedirect("/board/index.jsp");
        }
    }
}
