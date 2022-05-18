<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Images</title>
        <style>
            img{
                height: auto;
                width: 25%;
                padding: 0.7% 0.7%;
                object-fit: cover;
            }
            img:hover{
                -o-transition:.5s;
                 transition:.5s;
                 box-shadow: 20px 25px 50px -12px #888888;
            }
        </style>
    </head>
    <body>
        <div class="img" style="display: flex">
            <img src="img/img16.jpg" alt=""/>
             <img src="img/img2.jpg" alt=""/>
              <img src="img/img4.jpg" alt=""/>
             <img src="img/img5.jpg" alt=""/>
        </div>
        <div class="img" style="display: flex">
            <img src="img/img6.jpg" alt=""/>
             <img src="img/img7.jpg" alt=""/>
              <img src="img/img8.jpg" alt=""/>
             <img src="img/img10.jpg" alt=""/>
        </div>
        <div class="img" style="display: flex">
            <img src="img/img21.jpg" alt=""/>
             <img src="img/img3.jpg" alt=""/>
              <img src="img/img17.jpeg" alt=""/>
          <img src="img/img25.jpeg" alt=""/>
        </div>
         <div class="img" style="display: flex">
            <img src="img/img23.jpeg" alt=""/>
             <img src="img/img22.jpg" alt=""/>
              <img src="img/img15.jpg" alt=""/>
             <img src="img/img12.jpg" alt=""/>
        </div>
    </body>
</html>
