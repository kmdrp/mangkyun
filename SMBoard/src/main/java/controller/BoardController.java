package controller;

import model.dao.BoardDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BoardController extends HttpServlet {
    BoardDAO boardDAO;
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req,resp);
    }
    protected void doServ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
       // int bno =(int) req.getAttribute("first_bno");
       // int call_num=Integer.parseInt(req.getParameter("call_num"));
        boardDAO = new BoardDAO();
        List list = boardDAO.selectAll();
        req.setAttribute("list", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/board/main.jsp");
        dispatcher.forward(req,resp);
    }
}
