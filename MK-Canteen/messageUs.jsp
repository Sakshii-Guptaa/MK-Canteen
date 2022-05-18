<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs1.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body >
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<div style="color: white; text-align: center; font-size: 20px;margin-top: 10px;margin-bottom: 15px">For any queries, you can contact us using the below details. We'll be happy to answer your questions.</div>

<%
        String msg=request.getParameter("msg");
      if("valid".equals(msg))
                {%>
                <h3 style="text-align:center; color:yellow;">Message successfully sent. </h3>
                 <%}
        if("invalid".equals(msg))
                {%>
                <h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
                <%}
%>

<form action="messageAction.jsp" method="post">
<input class="input-style" type="text" name="name" placeholder="Enter Your Name" required>
<hr>
<textarea class="input-style"  name="body" placeholder="Enter Your Message" required></textarea>
<hr>
<center><button class="button" type="submit">Send<i class='far fa-arrow-alt-circle-right'></i></button>
</center>
</form>
 
<br><br><br>
</body>
</html>