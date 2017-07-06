<%@ page import="model.dto.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int board_num = Integer.parseInt((String)request.getParameter("board_num"));
    String writer_nick = (String) request.getParameter("writer_nick");
    String content = (String) request.getParameter("content");
    String regddate = (String) request.getParameter("regdate");

%>
<html>
<head>
    <title>Title</title>
    <style>
        #post{
            margin-top: 10px;
            width: 100%;
            height: 100px;
            background-color: #d1cfcb;
        }
        #info{
            background-color: aquamarine;
            width: 100%;
            height: 30px;
        }
        #writer{
            height: 100%;
            width: 50%;
            float: left;
            text-align: left;
        }
        #time{
            height: 100%;
            width: 50%;
            float: right;
            text-align: right;
        }
        #content{
            background-color: cadetblue;
            width: 100%;
            height: 40px;
        }
        #social{
            background-color: darkcyan;
            width: 100%;
            height: 30px;
        }

    </style>
</head>
<body>
    <div id="post">
        <div id="info">
            <div id="writer">
                 글쓴이=<%=writer_nick%>
            </div>
            <div id="time">
                <%=regddate%>
            </div>
        </div>
        <div id="content">
            <%=content%>
        </div>
        <div id="social">

        </div>

    </div>
</body>
</html>
