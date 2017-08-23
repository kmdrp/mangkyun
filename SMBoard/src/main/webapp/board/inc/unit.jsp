<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int board_num = Integer.parseInt(request.getParameter("board_num"));
    String writer_nick = request.getParameter("writer_nick");
    String content = request.getParameter("content");
    String regdate = request.getParameter("regdate").substring(0, 19);
    String nowDate = request.getParameter("nowDate");
    int anony = Integer.parseInt(request.getParameter("anony"));
    if (anony == 1) {
        writer_nick = "익명";
    }

      //  전에 처리 안된 개행처리 받으면서 해보려했으나 실패.... 왜안되지
    int line =Integer.parseInt(request.getParameter("line"));
    System.out.println("board num : " + board_num + " line : " + line);
     /*icontent.replaceAll("\n", "<br>");

    content.replace("\\r\\n", "<br>");
    content.replaceAll("\\r", "<br>");
    content.replaceAll("\\n\\r", "<br>");
    System.out.println("board_num : " + board_num + "  LINE COUNT : " + line + "  content: " + content);*/

    if (regdate != nowDate) {
        if (regdate.substring(0, 10).equals(nowDate.substring(0, 10))) {
            int regValue = Integer.parseInt(regdate.substring(11, 13)) * 3600 + Integer.parseInt(regdate.substring(14, 16)) * 60 + Integer.parseInt(regdate.substring(17, 19));
            int nowValue = Integer.parseInt(nowDate.substring(11, 13)) * 3600 + Integer.parseInt(nowDate.substring(14, 16)) * 60 + Integer.parseInt(nowDate.substring(17, 19));
            int timeDiff = nowValue - regValue;
            if (timeDiff < 60) {
                regdate = "방금";
            } else if (timeDiff > 60 && timeDiff < 3600) {
                regdate = Integer.toString(timeDiff / 60) + "분 전";
            } else if (timeDiff > 3600) {
                regdate = regdate.substring(5, 7) + "/" + regdate.substring(8, 10) + " " + regdate.substring(11, 16);
            }
        } else {
            regdate = regdate.substring(5, 7) + "/" + regdate.substring(8, 10) + " " + regdate.substring(11, 16);
        }
    } else {
        regdate = "방금";
    }
%>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            width:100%;
        }
        #post {
            padding:10px 0px 5px;
            width: 100%;
            background-color: white;
        }
        #info {
            background-color: white;
            width: 100%;
            height: 30px;
        }
        #writer {
            padding-left: 15px;
            height: 100%;
            width: 50%;
            float: left;
            text-align: left;
            display: inline-block;
            font-size: 15pt;
        }
        #time {
            color: darkgrey;
            padding-right: 15px;
            height: 100%;
            width: 40%;
            float: right;
            text-align: right;
        }
        #content {
            margin: auto;
            background-color: white;
            width: 100%;
        }
        #social {
            margin-top:5px;
            background-color: white;
            width: 100%;
            height: 25px;
        }
        input {
            border: none;
        }
        #writer_img {
            float: left;
            height: 25px;
            width: 25px;
        }
        #writer_value {
            margin-left: 4px;
            float: left;
            height: 100%;
        }
        #content1 {
            width: 95%;
            height: 95%;
            margin-left: 15px;
        }
        #social1 {
            width: 95%;
            height: 100%;
            margin-top:3px;
            margin-left:15px;
        }

        .social_img {
            display: inline-block;
            width: 15px;
            height: 15px;
        }

        .social_item {
            float: left;
            margin-top: 5px;
        }
        .social_value {
            width: 15px;
            font-size: 12pt;
            text-align: left;
        }
    </style>
</head>
<body style="<%if(line==1){%>height: 100px;<%}else if(line==2){%>height: 115px;<%}else if(line==3){%>height: 125px;<%}%>">
<div id="post" >
    <div id="info">
        <div id="writer">
            <div id="writer_img"><img src="/setting/images/usericon.png"></div>
            <div id="writer_value"><input type="text" value="<%=writer_nick%>" name="writer_nick" readonly
                                          style="margin-top:3px;font-size:12pt;font-weight: bold"/>
                <input type="text" value="<%=board_num%>" hidden readonly/></div>
        </div>
        <div id="time">
            <%=regdate%>
        </div>
    </div>
    <div id="content" style="<%if(line==1){%>height: 20px;<%}else if(line==2){%>height: 40px;<%}else if(line==3){%>height: 50px;<%}%>">

        <div id="content1" style="<%if(line==1){%>margin-top:10px;<%}else if(line==2){%>margin-top: 7px;<%}else if(line>=3){%>margin-top:4px;<%}%>">

            <%=content%>
        </div>
    </div>
    <div id="social">
        <div id="social1">
            <img src="/setting/images/heart.png" class="social_img social_item "/>
            <div class="jump social_item"><input type="text" value="1 " class="social_value" readonly></div>
            <img src="/setting/images/chat.png" class="social_img social_item jump"/>
            <div class="jump social_item"><input type="text" value=" 1" class="social_value" readonly></div>
        </div>
    </div>

</div>
</body>
<script>

</script>
</html>
