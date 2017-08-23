<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.Board" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.dto.Reply" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowDate = format.format(new Date());

    String id = (String)session.getAttribute("id");
    if (id == null) {
        System.out.println("로그인 정보 없음");
        response.sendRedirect("/board/index.jsp");
    }else{
        System.out.println("접속자 id : " +id);
        System.out.println();
    }
    Board board = (Board) request.getAttribute("board");
    ArrayList<Reply> list = (ArrayList) request.getAttribute("replyList");
%>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
        #write_rep{
            background-color: white;
            width: 100%;
            height: 45px;
            text-align: center;
            margin-top: 0px;
        }
        #finder{
            border:1px solid #dadada;
        }
        #btn_sbm{
            background-color: #ff5853;
            margin-top:7px;
            width:40px;
            height:30px;
            display:inline-block;
            color:black;
            font-size: 12pt;
            text-align: center;
        }
        .search_item{
            margin-top:7px;
            background-color: rgba(197, 197, 197, 0.38);
            width: 480px;
            height: 30px;
            display: inline-block;
            float: left;
            font-size:12pt;
            text-align: left;
            color: black;
        }
        .noSize {
            width: 0px;
            height: 0px;
            padding: 0px;
            margin: 0px;
        }
        .search_btn{
            width:10%;
            margin-left:10px;
            margin-right:15px;
            background-color: white;
            float:right;
            text-align: center;
        }
        .search{
            display: none;
            padding: 10px;
        }
        #form2{
            margin-left:15px;
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

        <div id="board">
            <jsp:include page="inc/detail_unit.jsp">
                <jsp:param name="board_num" value="<%=board.getBoard_num()%>"></jsp:param>
                <jsp:param name="writer_id" value="<%=board.getWriter_id()%>"></jsp:param>
                <jsp:param name="writer_nick" value="<%=board.getWriter_nick()%>"></jsp:param>
                <jsp:param name="content" value="<%=board.getContent()%>"></jsp:param>
                <jsp:param name="anony" value="<%=board.getAnony()%>"></jsp:param>
                <jsp:param name="regdate" value="<%=board.getRegdate()%>"></jsp:param>
                <jsp:param name="nowDate" value="<%=nowDate%>"></jsp:param>
            </jsp:include>
        </div>

        <div id="write_rep">
            <form id="form2" action="/board/reply.jsp" method="post">
                <input type="text" class="noSize" value="<%=id%>" name="id" readonly hidden/>
                <input type="text" class="search_item" placeholder="여기에 댓글을 입력하세요"/>
                <input type="submit" value="등록" class="search_btn" id="btn_sbm" />
                <form class="search" style="display: none">
                    <input type="search" id="search2" name="keyword" placeholder="글 내용,해시태그 검색" style="display: none"/>
                </form>
            </form>
        </div>

        <div id="replys">
            <%for(int i=0;i<list.size();i++){
                Reply reply = list.get(i);
            %>
                <jsp:include page="inc/unitReply.jsp">
                    <jsp:param name="reply_num" value="<%=reply.getReply_num()%>"></jsp:param>
                    <jsp:param name="writer_nick" value="<%=reply.getWriter_nick()%>"></jsp:param>
                    <jsp:param name="content" value="<%=reply.getContent()%>"></jsp:param>
                    <jsp:param name="regdate" value="<%=reply.getRegdate()%>"></jsp:param>
                    <jsp:param name="nowDate" value="<%=nowDate%>"></jsp:param>
                </jsp:include>
            <%}%>
        </div>
    </div>

</article>
</body>
</html>
