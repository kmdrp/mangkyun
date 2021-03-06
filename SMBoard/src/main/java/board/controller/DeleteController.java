package board.controller;

import controller.Controller;
import model.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteController implements Controller {
    BoardDAO boardDAO;
    int board_num;
    public DeleteController(int board_num){
        this.board_num = board_num;
    }
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        boardDAO = new BoardDAO();
        System.out.println(" del cntrl board_num :L "  +board_num);
        boardDAO.delete(board_num);
    }

    public String getResultView() {
        return "/board.do";
    }

    public boolean isFoward() {
        return false;
    }
}
