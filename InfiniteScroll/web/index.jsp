
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="jquery-3.2.1.min.js"></script>
    <style>
      body{
        background-color: blue;
      }
      #board{
        margin: auto;
        width: 600px;
        background-color: white;
      }
      .button1{
        margin: auto;
        width: 550px;
        height: 300px;
      }
    </style>
    <script>
      var b_id=2;
      $(document).ready(function(){
          $(window).scroll(function(){
              var scrollHeight = $(window).scrollTop() + $(window).height();
              var documentHeight=$(document).height();

              if(scrollHeight+200>=documentHeight) {
                  loadArticle(count);
                  b_id++;
              }
          });
      });
      function loadArticle(b_id){
          $.ajax({
              type:'GET',
              url:"/select?b_id="+b_id,
              cache:false,
              success:function() {
                  var btn_test = document.createElement("button");
                  setTimeout(function(data){
                      $('#btn_test').addClass('button1');
                      btn_test.value=data;
                      $('#board').append(btn_test);
                  },1000);

              }
          });
      }
    </script>
  </head>
  <body>
    <div id="board">

    </div>
  </body>

</html>
