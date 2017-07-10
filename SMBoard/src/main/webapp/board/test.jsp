<%@ page import="model.dto.Member" %>
<%@ page import="model.dao.MemberDAO" %>
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
    //로그인 체크
    //session 으로 바꾸자
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowDate = format.format(new Date());

    String id =(String) request.getParameter("id");
    String pw = (String) request.getAttribute("pw");
    if (id != null) {
        System.out.println("메인 페이지 아이디 / 패스워드 : " + id+" / "+pw);
    }else{
        System.out.println("로그인 정보 없음");
        response.sendRedirect("/board/index.jsp");
    }
    ArrayList<Board> list = (ArrayList<Board>)boardDAO.selectAll();
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
            background-color: white;
            width: 100%;
            height: 50px;
            text-align: center;
            margin-top: 5px;
            border:0.5px solid #dadada;
        }
        .search_item{
            width: 480px;
            height: 40px;
            display: inline-block;
            float: left;
            margin:5px;
            font-size:15pt;
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
    </style>
    <script>
        window.onload=function(){
            var form1=document.getElementById("form1");
            //var finder = document.getElementById("finder");
            function doWrite(){
                form1.method = "post";
                form1.action = "/board/write.jsp";
                form1.submit();
            }
        }


    </script>
</head>
<body>
    <nav>
        <jsp:include page="/board/inc/navbar.jsp"/>
    </nav>
    <article>
        <div id="cen">
            <div id="search">
                <form id="form1">
                    <input type="text" class="noSize" value="<%=id%>" name="id" readonly hidden/>
                    <button  class="search_item" name="search" id="finder" onclick="doWrite()" >글을 작성하려면 클릭해주세요</button>
                    <input type="button" value="검색" class="search_item" id="btn_find" style="width:15%; margin-left:10px;background-color: white"/>
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
