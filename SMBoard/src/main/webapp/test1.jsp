<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            background-color: beige;
        }
        #tft {
            width: 333px;
            height: 100px;
            background-color: #1E90FF;
        }
        #textA{
            width: 300px;
            height: 100px;
            resize: none;

        }
    </style>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>

    var val3;
    window.onload=function () {

        var txt = document.getElementById("textA").value;
        var btn = document.getElementById("btn");
        btn.addEventListener("click",function () {
            val3=$("textarea#textA").val();
            alert(val3.length);
        });
    }
</script>
</head>

<body>
<textarea id="textA" ></textarea>
<button id="btn">확인</button>
<p id="tft"></p>
</body>
</html>
