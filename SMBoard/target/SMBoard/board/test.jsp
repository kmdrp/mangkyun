<%@ page import="model.dto.Member" %>
<%@ page import="model.dao.MemberDAO" %>
<%@ page import="model.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    BoardDAO boardDAO=new BoardDAO();
%>
<%
    //로그인 체크
    String id =(String) request.getAttribute("id");
    String pw = (String) request.getAttribute("pw");
    if (id != null) {
        System.out.println("메인 페이지 아이디 / 패스워드 : " + id+" / "+pw);
    }else{
        System.out.println("로그인 정보 없음");
        response.sendRedirect("/board/index.jsp");
    }
    ArrayList<Board> list = (ArrayList<Board>)boardDAO.selectAll();
    System.out.println("게시물 수 : " + list.size());
%>
<html>
<head>
    <title>test</title>
    <style>
        body{
            background-color: rgba(248, 248, 248, 0.75);
        }
        #cen{
            height:100%;
            width:600px;
            margin: auto;
            background-color: aqua;
        }
        #search{
            background-color: #1E90FF;
            width: 100%;
            height: 50px;
            text-align: center;
            margin: 0px;
        }
        .search_item{
            height: 80%;
            display: inline-block;
            float: left;
            margin:5px;
        }
        /*#post {
            margin-top: 10px;
            width: 100%;
            height: 100px;
            background-color: #e3e3e3;
        }*/
    </style>
</head>
<body>
    <nav>
        <jsp:include page="/board/inc/navbar.jsp"/>
    </nav>
    <article>
        <div id="cen">
            <div id="search">
                <input type="text"  class="search_item" name="search" id="finder" style="font-size:15pt;width: 80%"/>
                <input type="button" value="검색" class="search_item" id="btn_find" style="width:15%; margin-left:10px;background-color: white"/>
            </div>
            <div id="board">
                <%for(int i=0;i<list.size();i++){
                    Board board = list.get(i);
                %>
                <jsp:include page="inc/unit.jsp">
                    <jsp:param name="board_num" value="<%=board.getBoard_num()%>"></jsp:param>
                    <jsp:param name="writer_nick" value="<%=board.getWriter_nick()%>"></jsp:param>
                    <jsp:param name="content" value="<%=board.getContent()%>"></jsp:param>
                    <jsp:param name="regdate" value="<%=board.getRegdate()%>"></jsp:param>
                </jsp:include>
                <%}%>
            </div>
        </div>
    </article>
</body>
</html>
