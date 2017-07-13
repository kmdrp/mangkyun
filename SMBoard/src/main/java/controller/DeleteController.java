package controller;

import model.dao.BoardDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DeleteController extends HttpServlet {
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
        boardDAO = new BoardDAO();
        int board_num = Integer.parseInt(req.getParameter("board_num"));
        boardDAO.delete(board_num);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/board");
        dispatcher.forward(req,resp);
    }
}
