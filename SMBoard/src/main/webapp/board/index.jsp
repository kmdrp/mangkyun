<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = (String) session.getAttribute("id");
    if (id != null) {
        // session에 로그인 기록이 남아있으면 게시판페이지로 간다
        response.sendRedirect("/board.do");
    }
%>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{
            margin: 0px;
            padding:0px;
            background-color: rgba(248, 248, 248, 0.75);
        }
        #login_body{
            padding-top: 30px;
            margin: auto;
            width:300px;
            height: 500px;
            text-align: center;
            border: 0.5px solid #d1cfcb;
        }
        #login_form{
            width: 250px;
            height: 80%;
            background-color: white;
            display: inline-block;
            margin: 30px;
        }
        button{
            width: 100%;
            background-color: dodgerblue;
        }
        .button_example{
            border:1px solid #0074e5; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:'Nanum Gothic', sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
            background-color: #1E90FF; background-image: -webkit-gradient(linear, left top, left bottom, from(#1E90FF), to(#1E90FF));
            background-image: -webkit-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: -moz-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: -ms-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: -o-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: linear-gradient(to bottom, #1E90FF, #1E90FF);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#1E90FF, endColorstr=#1E90FF);
        }

        .button_example:hover{
            border:1px solid #005db7;
            background-color: #0077ea; background-image: -webkit-gradient(linear, left top, left bottom, from(#0077ea), to(#0077ea));
            background-image: -webkit-linear-gradient(top, #0077ea, #0077ea);
            background-image: -moz-linear-gradient(top, #0077ea, #0077ea);
            background-image: -ms-linear-gradient(top, #0077ea, #0077ea);
            background-image: -o-linear-gradient(top, #0077ea, #0077ea);
            background-image: linear-gradient(to bottom, #0077ea, #0077ea);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#0077ea, endColorstr=#0077ea);
        }
    </style>
</head>
<body>
<%@include file="inc/navbar.jsp"%>
<div id="login_body">
    <div id="login_form">
        <form action="/login.do" method="post">
            <br><br><br><br>
            <input type="text" class="form-control" name="id" placeholder="Enter ID"><br>
            <input type="password" class="form-control" name="password" placeholder="Enter Password"><br>
            <button type="submit" class="btn btn-default button_example">로 그 인</button>
        </form>
        <a href="/board/join.jsp" style="color:#1E90FF;text-align: center;">가입</a>
    </div>
</div>
</body>
</html>
