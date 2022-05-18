<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=session.getAttribute("email").toString();
String hostelname=request.getParameter("hostelname");
String roomnumber=request.getParameter("roomnumber");
String mobilenumber=request.getParameter("mobilenumber");
String status="bill";
String total=request.getParameter("total");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    PreparedStatement ps = con.prepareStatement("update customer set b_hostel=?,b_room=?,b_phone=? where b_email=? ");
    ps.setString(1, hostelname);
    ps.setString(2, roomnumber);
    ps.setString(3, mobilenumber);
    ps.setString(4, email);
    ps.executeUpdate();
     
    
    PreparedStatement ps1 = con.prepareStatement("update cart set hostel=?,room=?,mobile=?,subtotal=?,orderdt=now(),deliverydt=DATE_ADD(orderdt, INTERVAL 1 HOUR) where email=?  ");
    ps1.setString(1, hostelname);
    ps1.setString(2, roomnumber);
    ps1.setString(3, mobilenumber);
     ps1.setString(4, total);
    ps1.setString(5, email);
   
    ps1.executeUpdate();
    response.sendRedirect("bill.jsp");

}
catch(Exception e)
{
    System.out.println(e);
}
%>