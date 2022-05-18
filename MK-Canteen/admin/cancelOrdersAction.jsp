<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    stmt.executeUpdate("update cart set  where cart.item_id=menuitems.it_id and cart.orderdt is not NULL");
    int sno=0;
    
}
catch(Exception e)
{
    System.out.println(e);
}
%>