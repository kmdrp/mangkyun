<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 게시물 요청하고 게시물 받아오기

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

            </div>
        </div>
    </article>
</body>
</html>
