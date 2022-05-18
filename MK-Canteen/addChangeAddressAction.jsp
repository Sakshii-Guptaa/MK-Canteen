<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=session.getAttribute("email").toString();
String hostelname=request.getParameter("hostelname");
String roomnumber=request.getParameter("roomnumber");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    PreparedStatement ps = con.prepareStatement("update customer set b_hostel=?,b_room=? where b_email=? ");
    ps.setString(1, hostelname);
    ps.setString(2, roomnumber);
    ps.setString(3, email);
    ps.executeUpdate();
    response.sendRedirect("addChangeAddress.jsp?msg=valid");
    
}
catch(Exception e)
{
    System.out.println(e);
    response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>