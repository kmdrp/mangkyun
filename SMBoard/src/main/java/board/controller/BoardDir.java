package board.controller;

import model.dao.BoardDAO;
import model.dto.Board;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class BoardDir extends HttpServlet {
    BoardDAO dao;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        execute(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        execute(req,resp);
    }

    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            int last_num = 0;
            dao = new BoardDAO();
            if (request.getParameter("last_num") == null || Integer.parseInt(request.getParameter("last_num")) == 0) {
                System.out.println("lastNum = null or 0");
                try {
                    request.getRequestDispatcher("/board/main.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
            } else {
                last_num = Integer.parseInt(request.getParameter("last_num"));
                System.out.println("#board Dir receive lastNum : " + last_num);
            }
            List list = dao.selectB(last_num);
            String jsonStr = "{\"board\":[";

            for (int i = 0; i < list.size(); i++) {
                Board board = (Board) list.get(i);
                jsonStr += "{\"board_num\":\"" + board.getBoard_num() + "\",";
                jsonStr += "\"writer_id\":\"" + board.getWriter_id() + "\",";
                jsonStr += "\"writer_nick\":\"" + board.getWriter_nick() + "\",";
                jsonStr += "\"content\":\"" + board.getContent() + "\",";
                jsonStr += "\"regdate\":\"" + board.getRegdate() + "\",";
                jsonStr += "\"anony\":\"" + board.getAnony() + "\",";
                jsonStr += "\"reply\":\"" + board.getReply() + "\",";
                jsonStr += "\"like\":\"" + board.getLike() + "\"}";
                if (i != list.size() - 1) {
                    jsonStr += ",";
                } else {
                    last_num = board.getBoard_num();
                    jsonStr += "],\"last_num\":\"" + last_num + "\"}";
                }
            }
            System.out.println("#board Dir send msg ");
            PrintWriter out = response.getWriter();
            out.print(jsonStr);
            out.println();

        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
