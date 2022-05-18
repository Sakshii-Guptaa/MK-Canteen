<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
     Connection conn;
    PreparedStatement ps;
String id=request.getParameter("id");
String name=request.getParameter("name");
String price=request.getParameter("price");
String category=request.getParameter("category");
try{
    Class.forName("com.mysql.jdbc.Driver"); 
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root",""); 
    Statement stmt =conn.createStatement();
    stmt.executeUpdate("update menuitems set it_name='"+name+"',it_price='"+price+"',it_category='"+category+"' where it_id='"+id+"' ");
    response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e)
{

 response.sendRedirect("allProductEditProduct.jsp?msg=wrong");  
}
 %>           
     