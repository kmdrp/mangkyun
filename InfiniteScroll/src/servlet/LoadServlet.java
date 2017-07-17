package servlet;

import com.test.Board;
import com.test.DAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        callBack(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        callBack(req,resp);
    }
    protected void callBack(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int b_id = Integer.parseInt(req.getParameter("b_id"));
        DAO dao = new DAO();
        Board board = dao.selectOne(b_id);
        req.setAttribute("board",board);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
        dispatcher.forward(req,resp);
    }
}
