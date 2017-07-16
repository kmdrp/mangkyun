package board.controller;

import controller.Controller;
import model.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class BoardController implements Controller {
    BoardDAO dao;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
            dao=new BoardDAO();
            List list = dao.selectAll();
            request.setAttribute("list",list);
    }

    public String getResultView() {
        return "/board/main.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
