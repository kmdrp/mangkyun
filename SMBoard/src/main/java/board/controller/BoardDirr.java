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
import java.text.SimpleDateFormat;
import java.util.List;

public class BoardDirr extends HttpServlet {
    BoardDAO dao;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doSend(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doSend(request,response);
    }
    protected void doSend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html");
            String nowDate = request.getParameter("nowdate");

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

            for (int i = 0; i < list.size(); i++) {
                Board board = (Board) list.get(i);
                //out.write 써서 html 로 보내줌

                String str="";
                str+="<div id=\"main\" onclick=\"showView("+board.getBoard_num()+")\">";
                str+="<jsp:include page=\"/board/inc/unit.jsp\">\n";
                str+="<jsp:param name=\"board_num\" value=\""+board.getBoard_num()+"\"></jsp:param>";
                str+="<jsp:param name=\"writer_nick\" value=\""+board.getWriter_nick()+"\"></jsp:param>";
                str+="<jsp:param name=\"content\" value=\""+board.getContent()+"\"></jsp:param>";
                str+="<jsp:param name=\"anony\" value=\""+board.getAnony()+"\"></jsp:param>";
                str+="<jsp:param name=\"regdate\" value=\""+board.getRegdate()+"\"></jsp:param>" ;
                str+="<jsp:param name=\"nowDate\" value=\""+nowDate+"\"></jsp:param>";
                str+="</jsp:include></div>";








                out.print(str);
                out.println();
            }

        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
