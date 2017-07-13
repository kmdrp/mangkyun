package controller;

import model.dao.BoardDAO;
import model.dao.ReplyDAO;
import model.dto.Board;
import model.dto.Reply;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DetailController extends HttpServlet {
    BoardDAO boardDAO;
    HttpSession session;
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServ(req,resp);
    }
    protected void doServ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        session=req.getSession();
        boardDAO = new BoardDAO();
        int board_num = Integer.parseInt(req.getParameter("board_num"));
        Board board = boardDAO.detailBoard(board_num);
        req.setAttribute("board", board);

        ReplyDAO replyDAO = new ReplyDAO();
        ArrayList<Reply> list = new ArrayList<Reply>();
        list = replyDAO.selectAll(board_num);
        req.setAttribute("replyList", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/board/detail.jsp");
        dispatcher.forward(req,resp);
    }
}
