<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">category</th>
            <th scope="col">Quantity</th>
            <th scope="col" style="background-color:#f2c88d"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
            
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from cart inner join menuitems where cart.item_id=it_id and cart.email='"+email+"'and cart.orderdt is not NULL ");
    while(rs.next())
    {
        sno=sno+1;
    
%>
          <tr>
            <td><%out.println(sno);%></td>
            <td><%=rs.getString(14)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(15)%></td>
            <td><%=rs.getString(16)%></td>
            <td><%=rs.getString(3)%></td>
            <td style="background-color:#f2c88d"><i class="fa fa-inr"></i> <%=rs.getString(5)%></td>
             <td><%=rs.getString(9)%></td>
              <td><%=rs.getString(10)%></td>
              
            </tr>
   <%
   }
}
catch(Exception e)
{
  System.out.println(e);
}
   %>      
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>