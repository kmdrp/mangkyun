package board.controller;

import controller.Controller;
import model.dao.BoardDAO;
import model.dao.ReplyDAO;
import model.dto.Board;
import model.dto.Reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class DetailController implements Controller {
    BoardDAO boardDAO;
    ReplyDAO replyDAO;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        boardDAO = new BoardDAO();
        replyDAO= new ReplyDAO();
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        Board board = boardDAO.detailBoard(board_num);
        request.setAttribute("board", board);
        ArrayList<Reply> list = replyDAO.selectAll(board_num);
        request.setAttribute("replyList", list);
    }

    public String getResultView() {
        return "/board/detail.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
