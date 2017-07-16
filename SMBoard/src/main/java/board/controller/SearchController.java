package board.controller;

import controller.Controller;
import model.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

public class SearchController implements Controller {
    BoardDAO boardDao;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            boardDao = new BoardDAO();
            String str = request.getParameter("findTxt");
            ArrayList list =(ArrayList) boardDao.search(str);
            request.setAttribute("list", list);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public String getResultView() {
        return "/board/search_result.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
