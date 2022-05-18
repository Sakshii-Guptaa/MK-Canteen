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

<%
 int id;
 id=Integer.parseInt( request.getParameter("id"));
String s="pending";

try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    
    
    ResultSet rs = stmt.executeQuery("select email from cart where status='"+s+"' ");
    rs.first();
    String mail=rs.getString(1);
    if(mail!=""){
    PreparedStatement ps=con.prepareStatement("update employee set e_status=? where e_id=?  ");
    ps.setString(1, "Unavailable");
    ps.setInt(2, id);
    ps.executeUpdate();
    }
    ResultSet rs1 = stmt.executeQuery("select subtotal from cart where status='"+s+"' and email='"+mail+"' ");
    rs1.first();
    
    int amt=rs1.getInt(1);
   

          PreparedStatement ps1=con.prepareStatement("insert into assignorder(e_id,b_email,bill_amt,payment_status) values(?,?,?,?)");
//           ps=con.prepareStatement("insert into order(email,item_id,quantity,price,total) values(?,?,?,?,?)");
                ps1.setInt(1, id);
                
                ps1.setString(2, mail);
                
                ps1.setInt(3, amt);
                ps1.setString(4, "not paid");
                ps1.executeUpdate();
                 PreparedStatement ps2=con.prepareStatement("update cart set status=? where email='"+mail+"'  ");
    ps2.setString(1, "Assigned");
    ps2.executeUpdate();
               response.sendRedirect("AssignOrder.jsp?msg=done");
           
    }
//}
catch(Exception e)
{
    System.out.println(e);
     response.sendRedirect("AssignOrder.jsp?msg=notdone");
}
  %>
  </body>
</html>