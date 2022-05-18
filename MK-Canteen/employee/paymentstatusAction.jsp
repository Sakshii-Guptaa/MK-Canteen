<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}                                
</style>
</head>
<body>
    <div style="color: black; text-align: center; font-size: 30px;">---No Orders---</div>

<%
      Connection con;
    
String empid=(String)session.getAttribute("empid");
    String notpaid="not paid";
    String amount=request.getParameter("amount");
// int id;
// id=Integer.parseInt( request.getParameter("empid"));

try{
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs2 = stmt.executeQuery("select * from assignorder where e_id='"+empid+"' && payment_status='"+notpaid+"'");   
   rs2.first();
    String bill=rs2.getString(3);
    ResultSet rs1 = stmt.executeQuery("select b_email from assignorder where e_id='"+empid+"' && payment_status='"+notpaid+"'");
    rs1.first();
    String cus_email=rs1.getString(1);
   
    if(bill.equals(amount)){
        
        PreparedStatement ps=con.prepareStatement("update employee set e_status=? where e_id=?");
    ps.setString(1, "available");
    ps.setString(2, empid);
 ps.executeUpdate();
  PreparedStatement ps1=con.prepareStatement(" update cart set status=? where email=? ");
    ps1.setString(1, "done");
    ps1.setString(2,cus_email);
                ps1.executeUpdate();
                PreparedStatement ps2=con.prepareStatement(" update assignorder set payment_status=? where e_id=?");
    ps2.setString(1, "paid");
    ps2.setString(2,empid);
                ps2.executeUpdate();
        response.sendRedirect("paymentstatus.jsp?msg=done");
        
    }
    else{
         response.sendRedirect("paymentstatus.jsp?msg=notdone");
    }
     
               
           
    }
//}
catch(Exception e)
{
    System.out.println(e);
}
  %>
  </body>
</html>