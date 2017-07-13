
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id =(String) session.getAttribute("id");
    if (id == null) {
        System.out.println("로그인 정보 없음");
        response.sendRedirect("/board/index.jsp");
    }
%>
<html>
<head>
    <title>test</title>
    <style>
        body{
            background-color: rgba(239, 239, 239, 0.75);
        }
        #cen{
            height:210px;
            width:600px;
            margin: auto;
            background-color: rgba(239, 239, 239, 0.75);
        }
        #content{
            border: 1px solid #1E90FF;
            background-color: white;
            width: 100%;
            height: 200px;
            text-align: center;
            margin-top: 10px;
        }
        #input{
            width: 100%;
            height: 151px;
            border-bottom:1px solid darkgrey ;
        }
        .noSize {
            width: 0px;
            height: 0px;
            padding: 0px;
            margin: 0px;
        }
        .text_area{
            border: none;
            font-size: 10pt;
            height: 130px;
            width: 95%;
            margin-top: 15px;
            resize: none;
        }
        #btn{
            width: 100%;
            height: 59px;
            margin-top: 5px;
        }
        .button_write{
            border:1px solid #1E90FF; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:'Nanum Gothic', sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
            background-color: #1E90FF; background-image: -webkit-gradient(linear, left top, left bottom, from(#1E90FF), to(#1E90FF));
            background-image: -webkit-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: -moz-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: -ms-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: -o-linear-gradient(top, #1E90FF, #1E90FF);
            background-image: linear-gradient(to bottom, #1E90FF, #1E90FF);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#1E90FF, endColorstr=#1E90FF);
        }
        .button_cancle{
            border:1px solid #dadada; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:'Nanum Gothic', sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: none;font-weight:bold; color: darkgrey;
            background-color: #FFFFFF; background-image: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#FFFFFF));
            background-image: -webkit-linear-gradient(top, #FFFFFF, #FFFFFF);
            background-image: -moz-linear-gradient(top, #FFFFFF, #FFFFFF);
            background-image: -ms-linear-gradient(top, #FFFFFF, #FFFFFF);
            background-image: -o-linear-gradient(top, #FFFFFF, #FFFFFF);
            background-image: linear-gradient(to bottom, #FFFFFF, #FFFFFF);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#FFFFFF, endColorstr=#FFFFFF);
        }
        #upload_img{
            float: left;
            width: 450px;
        }
        #btnClick{
            float: right;
            width: 150px;
            color: darkgrey;
            font-size: 9pt;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        window.addEventListener("load",function(){

            var btn_write = document.getElementById("btn_write");
            var btn_cancel = document.getElementById("btn_cancel");
            var val3;
            btn_write.addEventListener("click",function(){
                var form2=document.getElementById("form2");
                val3=$("textarea#txtArea").val();
                if(val3.length==0){
                    alert("글을 입력하세요");
                }else if(document.getElementById("userId").value==null){
                    alert("!");
                }else{
                    form2.method = "post";
                    form2.action = "/write";
                    form2.submit();
                }
            });
            btn_cancel.addEventListener("click",function(){
                var form2=document.getElementById("form2");
                form2.action="/board"
                form2.submit();
            });
        });

    </script>
</head>
<body>
<nav>
    <jsp:include page="/board/inc/navbar.jsp"/>
</nav>
<article>
    <div id="cen">
        <div id="content">
            <form id="form2" method="post" >
                <div id="input">
                    <input type="text" class="noSize" id="userId" value="<%=id%>" name="id" readonly hidden/>
                    <textarea id="txtArea" name="content" class="text_area" placeholder="내용을 입력해주세요" minlength="1"></textarea>
                </div>
                <div id="btn">
                    <div id="upload_img">
                        <%--사진업로드--%>
                    </div>
                    <div id="btnClick">
                        <input type="checkbox" name="anonymity" value="익명"/>익명
                        <button id="btn_write" class="button_write">완료</button>
                        <button id="btn_cancel" class="button_cancle">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</article>
</body>
</html>
