package controller;

import model.dao.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

public class Join extends javax.servlet.http.HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req,resp);
    }
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDAO dao = new MemberDAO();
        PrintWriter writer = new PrintWriter(new OutputStreamWriter(resp.getOutputStream()));
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String nickname = req.getParameter("nickname");
        int result = dao.join(id, name, password, nickname);
        if(result==1){
            resp.sendRedirect("/board/index.jsp");
            System.out.println("회원 가입 성공");
            writer.print("<alert>회원가입성공</alert> \n");
        }else{
            System.out.println("회원 가입 실패");
        }

    }
}
