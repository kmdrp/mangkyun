<!-- 로그인 하고나면 모든 페이지 에 들어가는 상단 바 -->


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin: 0px;
            padding:0px;
        }
        #nav{
            background-color: white;
            border-bottom: 0.5px solid #e3e3e3;
            width: 100%;
            height: 80px;
        }
        #inner{
            width: 900px;
            height: 100%;
            margin: auto;
            text-align: center;
        }
        .line_fix{
            display: inline-block;
            width: 100%;
            height: 50%;
            margin-top: 20px;
        }
        #logo{
            height: 100%;
            float: left;
            width: 300px;
        }
        #linker{
            height: 100%;
            float: left;
            width:300px;

        }
        #user{
            height: 100%;
            float: left;
            width: 300px;

        }
        button{
            border: none;
            background: none;
        }
        img{
            height: 100%;
        }
    </style>
    <script>
        window.onload=function() {
            var btn_home = document.getElementById("btn_home");
            var btn_user = document.getElementById("btn_user");
            btn_home.addEventListener("click",homeClick);
            //btn_user.addEventListener("click", mypage);
            btn_user.onclick=function () {
                alert(" my page "); // 위에 꺼랑 똑같ㅇ
            }
        }
        function homeClick() {
            location.href = "/board/test.jsp";
        }
        function mypage() {
            alert("mypage");
        }
    </script>
</head>
<body>
    <div id="nav">
        <div id="inner">
            <div class="line_fix">
                <div id="logo">
                    <button id="btn_home"><img src="/setting/images/home.png"/></button>
                </div>
                <div id="linker">

                </div>
                <div id="user">
                    <button id="btn_user"><img src="/setting/images/user2.png"/></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
