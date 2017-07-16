package board.controller;

import controller.Controller;
import model.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;


public class JoinController implements Controller {
    MemberDAO memberDAO;
    boolean joinReulst=false;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            memberDAO = new MemberDAO();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(response.getOutputStream()));
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String nickname = request.getParameter("nickname");
            int result = memberDAO.join(id, name, password, nickname);
            if(result==1){
                joinReulst=true;
                writer.print("<alert>회원가입성공</alert> \n");
            }else{
                joinReulst=false;
                System.out.println("회원 가입 실패");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public String getResultView() {
        String viewPage=null;
        if (joinReulst) {
            viewPage = "/board/index.jsp";
        }else{
            viewPage="/board/join.jsp";
        }
        return viewPage;
    }

    public boolean isFoward() {
        return false;
    }
}
