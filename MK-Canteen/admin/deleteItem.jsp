<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%
String product_id=request.getParameter("id");
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    stmt.executeUpdate("delete from menuitems where it_name='"+product_id+"' ");
    response.sendRedirect("allProductEditProduct.jsp?msg=deleted");
}
catch(Exception e)
{
    System.out.println(e);
     response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>