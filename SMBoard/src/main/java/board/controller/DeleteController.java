package board.controller;

import controller.Controller;
import model.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteController implements Controller {
    BoardDAO boardDAO;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        boardDAO = new BoardDAO();
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        boardDAO.delete(board_num);
    }

    public String getResultView() {
        return "/board.do";
    }

    public boolean isFoward() {
        return false;
    }
}
