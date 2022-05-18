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
<title>Add or Change Address</title>
</head>
<body>
<%
        String msg=request.getParameter("msg");
      if("valid".equals(msg))
                {%>
               <h3 class="alert">Address Successfully Updated !</h3>
                <%}
        if("invalid".equals(msg))
                {%>
                <h3 class="alert">Some thing Went Wrong! Try Again!</h3>
                <%}
%>

<%
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from customer where b_email='"+email+"'   ");

    while(rs.next())
    {
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Hostel name</h3>
 <input class="input-style" type="text" name="hostelname" value="<%=rs.getString(5)%>" placeholder="Enter Hostel Name" required>        
 
 <hr>
 <h3>Enter Room Number</h3>
 <input class="input-style" type="text" name="roomnumber" value="<%=rs.getString(6)%>" placeholder="Enter Room Number" required>        

<hr>
<center><button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</center>
</form>
<%
    }
}
 catch(Exception e)
{
    System.out.println(e);
  
}
%>
</body>
<br><br><br>
</html>