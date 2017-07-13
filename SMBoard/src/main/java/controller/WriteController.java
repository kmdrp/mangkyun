package controller;

import model.dao.BoardDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class WriteController extends HttpServlet {
    HttpSession session;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req,resp);
    }
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        session = req.getSession();
        BoardDAO boardDAO = new BoardDAO();
        String id = (String) session.getAttribute("id");
        String nick = (String) session.getAttribute("nick");
        String content = req.getParameter("content");
        String an[]=req.getParameterValues("anony");
        int anon=0;
        if(an.length==2){
            anon=1;
        }else{
            anon=0;
        }
        if(id==null){
            resp.sendRedirect("/board");
        }
        boardDAO.write(id,nick,content,anon);
        //int first_bno=0;
        //req.setAttribute("first_bno",first_bno);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/board");
        dispatcher.forward(req,resp);
    }

}
