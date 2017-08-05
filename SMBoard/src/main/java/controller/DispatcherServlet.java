package controller;

import board.controller.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DispatcherServlet  extends HttpServlet{

    Controller obj;
    String viewPage;
    Boolean isFoward;
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doRequest(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doRequest(req, resp);
    }

    protected void doRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String uri = req.getRequestURI();

        System.out.println("request uri : " + uri);

        if (uri.equals("/board.do")) {
            obj = new BoardController();
        } else if (uri.equals("/write.do")) {
            obj = new WriteController();
        }else if (uri.equals("/delete.do")) {
            obj = new DeleteController();
        }else if (uri.equals("/detail.do")) {
            obj = new DetailController();
        }else if (uri.equals("/login.do")) {
            obj = new LoginController();
        }else if (uri.equals("/join.do")) {
            obj = new JoinController();
        }else if (uri.equals("/reply.do")) {
            obj = new ReplyController();
        } else if (uri.equals("/search.do")) {
            obj = new SearchController();
        } else if (uri.equals("/boardAdd.do")) {
            obj =new BoardAddController();
        }

        viewPage = obj.getResultView();
        isFoward = obj.isFoward();
        RequestDispatcher dispatcher =null;
        obj.execute(req, resp);
        if(isFoward){
            dispatcher = req.getRequestDispatcher(viewPage);
            dispatcher.forward(req,resp);
        }else{
            resp.sendRedirect(viewPage);
        }

    }

}
