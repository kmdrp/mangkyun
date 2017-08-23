<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PrintWriter out1=response.getWriter();
    int board_num = Integer.parseInt(request.getParameter("board_num"));
    String writer_nick = request.getParameter("writer_nick");
    String content = request.getParameter("content");
    String regdate = request.getParameter("regdate").substring(0,19);
    String nowDate = request.getParameter("nowDate");
    String writer_id = request.getParameter("writer_id");
    String user_id = (String)session.getAttribute("id");
    int anony = Integer.parseInt(request.getParameter("anony"));
    if(anony==1){
        writer_nick="익명";
    }

    if (regdate != nowDate) {
        if(regdate.substring(0,10).equals(nowDate.substring(0,10))){
            int regValue = Integer.parseInt(regdate.substring(11, 13)) * 3600 + Integer.parseInt(regdate.substring(14, 16)) * 60 + Integer.parseInt(regdate.substring(17, 19));
            int nowValue = Integer.parseInt(nowDate.substring(11, 13)) * 3600 + Integer.parseInt(nowDate.substring(14, 16)) * 60 + Integer.parseInt(nowDate.substring(17, 19));
            int timeDiff = nowValue - regValue;
            if (timeDiff < 60) {
                regdate = "방금";
            } else if (timeDiff > 60 && timeDiff < 3600) {
                regdate =Integer.toString(timeDiff / 60)+"분 전";
            } else if (timeDiff > 3600) {
                regdate = regdate.substring(5, 7) + "/" + regdate.substring(8, 10) + " " + regdate.substring(11, 16);
            }
        }else{
            regdate = regdate.substring(5, 7) + "/" + regdate.substring(8, 10) + " " + regdate.substring(11, 16);
        }
    }else{
        regdate="방금";
    }
%>
<html>
<head>
    <title>Title</title>
    <style>
        #post{
            margin-top: 10px;
            width: 100%;
            height: 130px;
            background-color: white;
            padding:10px 0px;
        }
        #info{
            background-color: white;
            width: 100%;
            height: 30px;
        }
        #writer{
            padding-left:15px;
            height: 100%;
            width: 50%;
            float: left;
            text-align: left;
            display: inline-block;
            font-size: 15pt;
        }
        #time{
            color: darkgrey;
            padding-right:15px;
            height: 100%;
            width: 40%;
            float: right;
            text-align: right;
        }
        #content{
            margin: auto;
            background-color: white;
            width:100%;
            height: 70px;
        }
        #social{
            background-color: white;
            width: 100%;
            height: 30px;
        }
        input{
            border:none;
        }
        #writer_img{
            float:left;
            height: 28px;
            width: 28px;
        }
        #writer_value{
            margin-left:4px;
            float:left;
            height: 100%;
        }
        #content1{
            padding-top:10px;
            width:95%;
            height:95%;
            margin:auto;
        }
        #social1{
            float:left;
            width:40%;
            height:100%;
            margin-left:15px;
            margin-top: 7px;
        }
        .social_img{
            display: inline-block;
            width:20px;
            height:20px;
        }
        .social_item{
            float:left;
            margin-top:5px;
        }
        .jump{
        }
        .social_value{
            width:15px;
            font-size:12pt;
            text-align: left;
        }
        #control1{
            float:right;
            width:50%;
            height:100%;
        }
        .btn1{
            margin-right:10px;
            float:right;
            width: 40px;
            height:30px;
        }
    </style>
</head>
<body>
<div id="post">
    <div id="info">
        <form>
        <div id="writer">
            <div id="writer_img"><img src="/setting/images/usericon.png"></div>
            <div id="writer_value"><input type="text" value="<%=writer_nick%>" name="writer_nick" readonly style="margin-top:3px;font-size:12pt;font-weight: bold"/>
                <input type="text" value="<%=board_num%>" hidden readonly/></div>
        </div>
        <div id="time">
            <%=regdate%>
        </div>
        </form>
    </div>
    <div id="content">

        <div id="content1" >

            <%=content%>
        </div>
    </div>
    <div id="social">
        <div id="social1">
            <img src="/setting/images/heart.png" class="social_img social_item "/>
            <div class="jump social_item"><input type="text" value="1 " class="social_value" readonly></div>
            <img src="/setting/images/chat.png" class="social_img social_item jump"/>
            <div class="jump social_item"><input type="text" value=" 1"  class="social_value"readonly></div>
        </div>
        <div id="control1">
            <%if(user_id.equals(writer_id)){%>
            <div id="btn_line">
                <a href="/update.do?board_num=<%=board_num%>"><input id="upd_btn " class="btn1" type="button" value="수정"/></a>
                <a href="/delete.do?board_num=<%=board_num%>"><input id="del_btn " class="btn1" type="button" value="삭제"/></a>
            </div>
            <%}%>
        </div>
    </div>

</div>
<script>

</script>
</body>
</html>
