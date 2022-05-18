<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails1.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from customer where b_email='"+email+"' ");
    while(rs.next())
    {
%>

<h3>Name:<%=rs.getString(1)%> </h3>
<hr>
 <h3>Email: <%=rs.getString(3)%></h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(7)%></h3>
 <hr>
<h3>Security Question: <%=rs.getString(8)%></h3>
<hr>
      <br>
      <br>
      <br>
<%
}
}
catch(Exception e)
{
System.out.println(e);
}%>
</body>
</html>