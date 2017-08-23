package board.controller;

import controller.Controller;
import model.dao.BoardDAO;
import model.dto.Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class BoardController implements Controller {
    BoardDAO dao;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        int last_num=0;
        boolean isFirst=false;
        dao=new BoardDAO();
        if(request.getParameter("last_num")==null){
            System.out.println("lastNum = null");
            isFirst=true;
            last_num=dao.getLastId()+1;
        }else{
            last_num =Integer.parseInt(request.getParameter("last_num"));
            System.out.println(" receive lastNum : " + last_num);
            if(last_num==0){
                isFirst=true;
                last_num = dao.getLastId()+1;
            }
        }

        List list = dao.selectB(last_num);
        String jsonStr="{\"board\":[";

        for(int i=0;i<list.size();i++) {
            Board board = (Board) list.get(i);
            jsonStr+="{\"board_num\":\""+board.getBoard_num()+"\",";
            jsonStr+="\"writer_id\":\""+board.getWriter_id()+"\",";
            jsonStr+="\"writer_nick\":\""+board.getWriter_nick()+"\",";
            jsonStr+="\"content\":\""+board.getContent()+"\",";
            jsonStr+="\"regdate\":\""+board.getRegdate()+"\",";
            jsonStr+="\"anony\":\""+board.getAnony()+"\",";
            jsonStr+="\"reply\":\""+board.getReply()+"\",";
            jsonStr+="\"like\":\""+board.getLike()+"\"}";
            if(i!=list.size()-1){
                jsonStr += ",";
            }else{
                last_num = board.getBoard_num();
                jsonStr += "],\"last_num\":\""+last_num+"\"}";
            }
        }
        if(isFirst){
            request.setAttribute("isFirst",0);
            request.setAttribute("jsonStr",jsonStr);
            request.setAttribute("last_num",last_num);
        }
    }

    public String getResultView() {
        return "/board/main.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
