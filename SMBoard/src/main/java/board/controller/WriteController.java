package board.controller;

import controller.Controller;
import model.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class WriteController implements Controller {
    HttpSession session;
    BoardDAO boardDAO ;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            boardDAO= new BoardDAO();
            session = request.getSession();
            String id = (String) session.getAttribute("id");
            String nick = (String) session.getAttribute("nick");
            String content = request.getParameter("content");

            String[] text = content.split("\n");

            for(int i=0;i<text.length;i++) {
                if (i == 0) {
                    content = text[i];
                }else{
                    content += "<br>" + text[i];
                }
            }


            String an[]=request.getParameterValues("anony");
            int anon=0;
            if(an.length==2){
                anon=1;
            }else{
                anon=0;
            }
            if(id==null){
                response.sendRedirect("/board/index.jsp");
            }
            boardDAO.write(id,nick,content,anon);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public String getResultView() {
        return "/board.do";
    }

    public boolean isFoward() {
        return false;
    }
}
