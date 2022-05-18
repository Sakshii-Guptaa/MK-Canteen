<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<html>
<head>
<link rel="stylesheet" href="css/bill1.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String name=(String)session.getAttribute("name");
try{
    int total=0;
    int sno=0;
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select sum(total) from cart where email='"+email+"' ");

    while(rs.next())
    {
       total=rs.getInt(1);
    }
    ResultSet rs2 = stmt.executeQuery("select * from customer inner join cart where cart.email='"+email+"' ");
     while(rs2.next())
    {

%>
<div id='container'>
     <div class='bill'>
    <form>
<h3>MK-CANTEEN</h3>
<hr>
<div class="center-div"><h3>Name:  <%out.println(name);%>  </h3></div>
<div class="center-div-right"><h3>Email:  <%out.println(email);%></h3></div>
<div class="center-div"><h3>Mobile Number: <%=rs2.getString(17)%> </h3></div>  

<div class="center-div"><h3>Order Date: <%=rs2.getString(18)%> </h3></div>
<div class="center-div"><h3>Expected Delivery: <%=rs2.getString(19)%> </h3></div> 

<div class="left-div"><h3>Hostel Name: <%=rs2.getString(15)%> </h3></div> 
<div class="right-div"><h3>Room Number: <%=rs2.getString(16)%> </h3></div> 


<hr>

<%
break;
}
%>
	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Item Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
   ResultSet rs1 = stmt.executeQuery("select * from cart inner join menuitems where cart.item_id=menuitems.it_id and cart.email='"+email+"' ");
   while(rs1.next())
   {
       sno=sno+1;
   
  %>
  <tr>
    <td><%out.println(sno);%></td>
    <td><%=rs1.getString(14)%></td>
    <td><%=rs1.getString(16)%></td>
    <td> <i class="fa fa-inr"></i><%=rs1.getString(15)%></td>
    <td><%=rs1.getString(3)%></td>
    <td> <i class="fa fa-inr"></i><%=rs1.getString(5)%></td>
  </tr>
  <tr>
<% } %>
</table>
<h3>Total: <i class="fa fa-inr"></i> <%out.println(total);%></h3>
    </form>

     </div>
   
</div>
    <div style="display:flex ;justify-content: center;">
<a href="home.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
    </div>
<br><br><br><br>
<%
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>