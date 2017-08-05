<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowDate = format.format(new Date());
    String id = (String)session.getAttribute("id");
    if (id == null) {
        System.out.println("로그인 정보 없음");
        //response.sendRedirect("/board/index.jsp");
    }else{
        System.out.println("접속자 id : " +id);
        System.out.println();
    }
    String jsonString = (String) request.getAttribute("jsonStr");
    JSONParser parser = new JSONParser();
    JSONObject jsonObject = (JSONObject) parser.parse(jsonString);
    JSONArray jsonArray = (JSONArray) jsonObject.get("board");
%>
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>test</title>
    <style>
        body{
            background-color: rgba(239, 239, 239, 0.75);
            height: 1000px;
        }
        #cen{
            height: 1000px;
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
            width: 520px;
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
            width:50px;
            margin-left:10px;
            background-color: white;
            float:right;
            text-align: center;
        }
        #findTxt {
            float:left;
            height: 44px;
            width: 470px;
            font-size:12pt;
            border:none;
        }
        #findBtn {
            float: left;
            height: 44px;
            width: 50px;
            background-image: url("/setting/images/search.png");
            opacity: 0.5;
        }
        #btn_find {
            font-size: 12pt;
        }
        #findDiv{
            float: left;
            width: 520px;
            height: 44px;
            border: 1px solid #1E90FF;
            background-color: white;
        }
        .board_Test{
            width:100%;
            height: 110px;
            background-color: red;
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
                    var findDiv = document.createElement("div");
                    findDiv.id = "findDiv";
                    var findTxt = document.createElement("input");
                    var findBtn = document.createElement("button");
                    findTxt.name = "findTxt";
                    findTxt.type = "text";
                    findTxt.id = "findTxt";
                    findTxt.placeholder = "  글 검색,해쉬태그 검색";
                    form2.action = "/search.do";
                    findBtn.id = "findBtn";
                    findBtn.action = "submit";

                    findDiv.appendChild(findTxt);
                    findDiv.appendChild(findBtn);
                    form2.appendChild(findDiv);
                    document.getElementById("btn_find").value = "취소";

                }else{
                    flag=!flag;
                    var findDiv=document.getElementById("findDiv");
                    findDiv.removeChild(document.getElementById("findTxt"));
                    findDiv.removeChild(document.getElementById("findBtn"));
                    form2.removeChild(findDiv);

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
            location.href = "/detail.do?board_num="+board_num;
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
                </form>
            </div>
            <div id="board">
                <%for(int i=0;i<jsonArray.size();i++){
                    JSONObject board = (JSONObject) jsonArray.get(i);
                    int board_num = Integer.parseInt((String)board.get("board_num"));
                    String writer_nick = (String) board.get("writer_nick");
                    String content = (String) board.get("content");
                    int anony = Integer.parseInt((String) board.get("anony"));
                    String regdate = (String) board.get("regdate");
                %>
                <div id="main" name="main" onclick="showView(<%=board.get("board_num")%>)" style="height: 110px;">
                <jsp:include page="/board/inc/unit.jsp">
                    <jsp:param name="board_num" value="<%=board_num%>"></jsp:param>
                    <jsp:param name="writer_nick" value="<%=writer_nick%>"></jsp:param>
                    <jsp:param name="content" value="<%=content%>"></jsp:param>
                    <jsp:param name="anony" value="<%=anony%>"></jsp:param>
                    <jsp:param name="regdate" value="<%=regdate%>"></jsp:param>
                    <jsp:param name="nowDate" value="<%=nowDate%>"></jsp:param>
                </jsp:include>
                </div>

                <%}%>
                <div id="board2"></div>
            </div>
        </div>
    </article>
</body>
<script>
    <%
        int last_num=(int)request.getAttribute("last_num");
    %>
    var last_num=<%=last_num%>;
    // 검색 onkeydown 이벤트
    //무한 스크롤
    var sw=false;
    var post;
    var temp;

    $(window).ready(function(){
        post = document.getElementsByClassName("post")[0];
//      var inn=post.innerHTML;
        //var inf=$(post).find($("input#writer_nick")).prop("value","acccc");

        // 바꾸는 거 가능 --> 이제 html 복사해서 값만 변경해서 사용
        var inner=post.innerHTML;
        //console.log("inner " + inner);

        temp=inner;
        console.log("$(window).scrollTop() : "+$(window).scrollTop());
        console.log(" $(document).height() : " + $(document).height() +"  $(window).height() :  "+  $(window).height());
        console.log(" 차이 : " + ($(document).height() -$(window).height()));
        sw=true;
        console.log(" switch : " + sw);
    });
    function lastPostFunc() {
        console.log(" last_num : "+last_num+" !!! ");

        setTimeout(1000);
        var url = "/boardDir";
        var now ="<%=nowDate%>";
        $.ajax({
            type:"post",
            url:url,
            data:{
                last_num:last_num,
                nowdate:now
            },
            dataType:"json",
            success:[function (data,status) {
                var boardArr=data.board;
                last_num=data.last_num;
                for(var i=0;i<boardArr.length;i++) {
                    var regdate=boardArr[i].regdate;
                    var tmp=$.parseHTML(temp,false);

                    if (regdate != now) {
                        if(regdate.substring(0,10)==(now.substring(0,10))){
                            var regValue = parseInt(regdate.substring(11, 13)) * 3600 + parseInt(regdate.substring(14, 16)) * 60 + parseInt(regdate.substring(17, 19));
                            var nowValue = parseInt(now.substring(11, 13)) * 3600 + parseInt(now.substring(14, 16)) * 60 +parseInt(now.substring(17, 19));
                            var timeDiff = nowValue - regValue;
                            if (timeDiff < 60) {
                                regdate = "방금";
                            } else if (timeDiff > 60 && timeDiff < 3600) {
                                regdate =(timeDiff / 60).toString()+"분 전";
                            } else if (timeDiff > 3600) {
                                regdate = regdate.substring(5, 7) + "/" + regdate.substring(8, 10) + " " + regdate.substring(11, 16);
                            }
                        }else{
                            regdate = regdate.substring(5, 7) + "/" + regdate.substring(8, 10) + " " + regdate.substring(11, 16);
                        }
                    }else{
                        regdate="방금";
                    }
                    $(tmp).find("input#writer_nick").attr("value",boardArr[i].writer_nick);
                    $(tmp).find("input#board_num").attr("value", boardArr[i].board_num);
                    $(tmp).find("div#time").text(regdate);
                    $(tmp).find("div#content1").text(boardArr[i].content);
                    $(tmp).appendTo($("#board"));
                    sw=true;
                }

            }],
            error:{
            }
        });
    }
    $(window).scroll( function() {
        //이제 다운스크롤일때만 로드하도록 수 (일단 지금은 에러없지만 추후 적용)
        if ($(window).scrollTop() >= $(document).height() - $("article").height()) {
            console.log("$(window).scrollTop() : "+$(window).scrollTop());
            console.log(" $(document).height() : " + $(document).height() +"  $(window).height() :  "+  $(window).height());
            console.log(" 차이 : " + ($(document).height() -$(window).height()));
            if(sw) {
                sw=false;
                lastPostFunc();
            }else{
                console.log(" switch : " + sw);
            }
        }
    });


</script>
</html>