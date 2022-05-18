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
<title>Message Us</title>
</head>
<body>
  <%
        String msg=request.getParameter("msg");
      if("notMatch".equals(msg))
                {%>
                 <h3 class="alert">New password and Confirm password does not match!</h3>
                <%}
        if("wrong".equals(msg))
                {%>
                  <h3 class="alert">Your old Password is wrong!</h3>
               
                <%}
    if("done".equals(msg))
                {%>
                <h3 class="alert">Password change successfully!</h3>
                
                <%}
    if("invalid".equals(msg))
                {%>
                <script>
                     alert("Some thing went wrong! Try again!");
                 </script>
                <%}
%>
<form action="changePasswordAction.jsp" method="post" >


<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldpassword" placeholder="Enter Old Password" required>        
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newpassword" placeholder="Enter New Password" required>        
  
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmpassword" placeholder="Enter Confirm Password" required>        
  
<hr>
<center>
<button class="button" type="submit">
   Save <i class='far fa-arrow-alt-circle-right'></i>
</button></center>
</form>
</body>
<br><br><br>
</html>