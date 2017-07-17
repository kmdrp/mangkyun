<%@ page import="com.test.InsertCode" %>
<%@ page import="com.test.AutoInsert" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    AutoInsert insert = new AutoInsert();
%>
<html>
<head>

    <title>Title</title>
    <style>
        div {
            width: 200px;
            height: 300px;
            display: inline-block;
        }
        #addBtn{
            margin: auto;

        }
    </style>
</head>
<script>

        document.getElementById("addBtn").addEventListener("click",function () {
            <%
                insert.insertion();
            %>
    });

</script>
<body>
    <div>
        <button id="addBtn">add</button>
    </div>
</body>
</html>
