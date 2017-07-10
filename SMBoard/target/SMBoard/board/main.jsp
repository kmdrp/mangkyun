<%@ page import="model.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.Board" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!

    BoardDAO boardDAO=new BoardDAO();
%>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    //로그인 체크
    //session 으로 바꾸자
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowDate = format.format(new Date());

    String id = (String)session.getAttribute("id");
    if (id == null) {
        System.out.println("로그인 정보 없음");
        response.sendRedirect("/board/index.jsp");
    }else{
        System.out.println(id+" 가 board 이용중");
    }
    ArrayList<Board> list = (ArrayList)request.getAttribute("list");
    System.out.println("게시물 수 : " + list.size());
    System.out.println();
%>
<html>
<head>
    <title>test</title>
    <style>
        body{
            background-color: rgba(239, 239, 239, 0.75);
        }
        #cen{
            height:100%;
            width:600px;
            margin: auto;
            background-color: rgba(239, 239, 239, 0.75);
        }
        #search{
            background-color: rgba(239, 239, 239, 0.75);
            width: 100%;
            height: 45px;
            text-align: center;
            margin-top: 0px;
        }
        #finder{
            border:1px solid #dadada;
        }
        .search_item{
            border:1px solid #dadada;
            width: 480px;
            height: 45px;
            display: inline-block;
            float: left;
            margin:0px;
            font-size:12pt;
            background-color: #FFFFFF;
            text-align: left;
            color:darkgrey;
        }
        .noSize {
            width: 0px;
            height: 0px;
            padding: 0px;
            margin: 0px;
        }
        /*#post {
            margin-top: 10px;
            width: 100%;
            height: 100px;
            background-color: #e3e3e3;
        }*/
        .search_btn{
            width:13%;margin-left:10px;background-color: white;
            float:right;
            text-align: center;
        }
    </style>

    <script>

    </script>
</head>
<body>
    <nav>
        <jsp:include page="/board/inc/navbar.jsp"/>
    </nav>
    <article>
        <div id="cen">
            <div id="search">
                <form id="form2" action="/board/write.jsp" method="post">
                    <input type="text" class="noSize" value="<%=id%>" name="id" readonly hidden/>
                    <button type="submit" class="search_item"  id="finder" >&nbsp; 여기를 눌러 글을 작성해 주세요</button>
                    <input type="button" value="검색" class="search_item search_btn" id="btn_find" style=""/>
                </form>
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
                    <jsp:param name="nowDate" value="<%=nowDate%>"></jsp:param>
                </jsp:include>
                <%}%>
            </div>
        </div>
    </article>
</body>
</html>
