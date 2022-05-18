<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%
String eid=request.getParameter("eid");
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    stmt.executeUpdate("delete from employee where e_id='"+eid+"' ");
    response.sendRedirect("allEmployee.jsp?msg=deleted");
}
catch(Exception e)
{
    System.out.println(e);
     response.sendRedirect("allEmployee.jsp?msg=wrong");
}
%>