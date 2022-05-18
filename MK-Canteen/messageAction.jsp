<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
String email=(String)session.getAttribute("email"); 
String name=request.getParameter("name");
String desc=request.getParameter("body");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
           PreparedStatement ps=con.prepareStatement("insert into feedbackdb(f_name,f_email,f_desc)values(?,?,?)");
           ps.setString(1, name);
           ps.setString(2, email);
           ps.setString(3, desc);
           ps.executeUpdate();
           response.sendRedirect("messageUs.jsp?msg=valid");
              
                
        } catch(Exception e)
        {
            System.out.println(e);
            response.sendRedirect("messageUs.jsp?msg=invalid");
            
        }        
       
%>