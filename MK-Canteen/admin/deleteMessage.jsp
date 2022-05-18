<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%
String email=request.getParameter("email");
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    stmt.executeUpdate("delete from feedbackdb  where f_email='"+email+"'");
    response.sendRedirect("messagesReceived.jsp?msg=deleted");
}
catch(Exception e)
{
    System.out.println(e);
     response.sendRedirect("messagesReceived.jsp?msg=wrong");
}
%>