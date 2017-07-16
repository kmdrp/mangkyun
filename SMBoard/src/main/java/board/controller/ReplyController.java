package board.controller;

import controller.Controller;
import model.dao.ReplyDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class ReplyController implements Controller {
    HttpSession session;
    ReplyDAO replyDAO;
    int board_num;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            session = request.getSession();
            replyDAO = new ReplyDAO();
            String id = (String) session.getAttribute("id");
            String nick = (String) session.getAttribute("nick");
            String content = request.getParameter("content");
            String an[]=request.getParameterValues("anony");
            board_num = Integer.parseInt(request.getParameter("board_num"));
            int anon=0;
            if(an.length==2){
                anon=1;
            }else{
                anon=0;
            }
            if(id==null){
                response.sendRedirect("/board/index.jsp");
            }
            replyDAO.write(id,nick,content,anon, board_num);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getResultView() {
        String board_id=Integer.toString(board_num);
        return "/detail?board_num="+board_id;
    }

    public boolean isFoward() {
        return false;
    }
}
