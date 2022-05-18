<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>delivery Status</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}                                
</style>
</head>
<body>
<!--    <div style="color: black; text-align: center; font-size: 30px;">---Delivered!---</div>-->

<%
    String empid=session.getAttribute("empid").toString();  
    String notpaid="not paid";
// int id;
// id=Integer.parseInt( request.getParameter("empid"));

try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs2 = stmt.executeQuery("select b_email from assignorder where e_id='"+empid+"' && payment_status='"+notpaid+"'");
   
    String cus_email=rs2.getString(1);
    PreparedStatement ps=con.prepareStatement("update employee set e_status=? where e_id=?");
    ps.setString(1, "available");
    ps.setString(2, empid);
 ps.executeUpdate();
  
    PreparedStatement ps1=con.prepareStatement(" update cart set status=? where email=? ");
    ps1.setString(1, "done");
    ps1.setString(2,cus_email);
                ps1.executeUpdate();
                
               response.sendRedirect("allOrders.jsp?msg=done");
           
    }
//}
catch(Exception e)
{
    System.out.println(e);
}
  %>
  </body>
</html>