<%-- 
    Document   : addNewProductAction
    Created on : 27 Feb, 2022, 7:48:04 PM
    Author     : hp
--%>
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
String category=request.getParameter("category");
String price=request.getParameter("price");
try{
    Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root",""); 
           
            
                ps=conn.prepareStatement("insert into menuitems(it_id,it_name,it_price,it_category)values(?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, price);
                ps.setString(4, category);
                if(ps.executeUpdate()>0)
                { response.sendRedirect("addNewProduct.jsp?msg=done");}
}
catch(Exception e)
{
  response.sendRedirect("addNewProduct.jsp?msg=wrong");  
}



%>
