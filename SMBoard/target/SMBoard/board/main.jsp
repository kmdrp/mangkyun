<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.Board" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    ArrayList<Board> list = (ArrayList)request.getAttribute("list");
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
        #search{
            background-color: rgba(239, 239, 239, 0.75);
            width: 100%;
            height: 45px;
            text-align: center;
            margin-top: 0px;
        }
        #finder{
            border:1px solid #dadada;
            width: 500px;
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

        .search_btn{
            border:1px solid #dadada;
            height: 100%;
            width:13%;margin-left:10px;background-color: white;
            float:right;
            text-align: center;
        }
        #findTxt {
            float:left;
            height: 100%;
            width: 500px;
            font-size:12pt;
            border:1px solid #dadada;
        }
        #btn_find {
            font-size: 12pt;
        }
    </style>
    <script>
        window.addEventListener("load",function () {
            var btn_find=document.getElementById("btn_find");
            var form2 = document.getElementById("form2");
            var flag=true;
            btn_find.addEventListener("click",function () {
                if(flag) {
                    flag=!flag;
                    form2.removeChild(document.getElementById("finder"));
                    var findTxt = document.createElement("input");
                    findTxt.name = "findTxt";
                    findTxt.type = "text";
                    findTxt.id = "findTxt";
                    findTxt.placeholder = "  글 검색,해쉬태그 검색";
                    form2.action = "/search";

                    form2.appendChild(findTxt);

                    document.getElementById("btn_find").value = "취소";

                }else{
                    flag=!flag;
                    form2.removeChild(document.getElementById("findTxt"));
                    var finder = document.createElement("button");
                    finder.id = "finder";
                    finder.type = "submit";
                    finder.innerText="&nbsp;"
                    finder.innerText ="여기를 눌러 글을 작성해 주세요";
                    document.getElementById("btn_find").value = "검색";
                    form2.action="/board/write.jsp";
                    form2.appendChild(finder);

                }
            });
        });

        function showView(board_num){
            location.href = "/detail?board_num="+board_num;
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
                <form id="form2" action="/board/write.jsp" method="post">
                    <input type="text" class="noSize" value="<%=id%>" name="id" readonly hidden/>
                    <button type="submit" class="search_item"  id="finder" >여기를 눌러 글을 작성해 주세요</button>
                    <input type="button" value="검색" class="search_item search_btn" id="btn_find"/>
                    <form class="search" style="display: none">
                        <input type="search" id="search2" name="keyword" placeholder="글 내용,해시태그 검색" style="display: none"/>
                    </form>
                </form>
            </div>
            <div id="board">
                <%for(int i=0;i<list.size();i++){
                    Board board = list.get(i);
                %>
                <div onclick="showView(<%=board.getBoard_num()%>)">
                <jsp:include page="inc/unit.jsp">
                    <jsp:param name="board_num" value="<%=board.getBoard_num()%>"></jsp:param>
                    <jsp:param name="writer_nick" value="<%=board.getWriter_nick()%>"></jsp:param>
                    <jsp:param name="content" value="<%=board.getContent()%>"></jsp:param>
                    <jsp:param name="anony" value="<%=board.getAnony()%>"></jsp:param>
                    <jsp:param name="regdate" value="<%=board.getRegdate()%>"></jsp:param>
                    <jsp:param name="nowDate" value="<%=nowDate%>"></jsp:param>
                </jsp:include>
                </div>
                <%}%>
            </div>
        </div>
    </article>
</body>
</html>
