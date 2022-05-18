<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails1.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>
 <%
        String msg=request.getParameter("msg");
      if("done".equals(msg))
                {%>
                <h3 class="alert">Your Mobile Number successfully changed!</h3><%}
        if("wrong".equals(msg))
                {%>
                <h3 class="alert">Your Password is wrong!</h3>
                <%}
%>
<form action="changeMobileNumberAction.jsp" method="post">
 <h3>Enter New Mobile Number</h3>
 <input class="input-style" type="number" name="mobilenumber" placeholder="Enter New Mobile Number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter Password (For Security)" required>

<hr>
 <center><button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</center>
</form>
</body>
<br><br><br>
</html>