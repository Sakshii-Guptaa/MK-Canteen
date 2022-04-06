<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/addressPaymentForOrder-style1.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
    if(window.history.forward(1) !=NULL)
        window.history.forward(1);</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs1 = stmt.executeQuery("select sum(total) from cart where email='"+email+"' ");
    while(rs1.next())
    {
        total=rs1.getInt(1);
    }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: #f70008;">Total: <i class="fa fa-inr"></i> <%out.println(total);%></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">item Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col" style="background-color:#f2c88d" ><i class="fa fa-inr"></i> Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs=stmt.executeQuery("select *from menuitems inner join cart on menuitems.it_id=cart.item_id and cart.email='"+email+"'  ");
        while(rs.next())
        {
        %>
          <tr>
          <%sno=sno+1; %>
           <td><%out.println(sno);%></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(3) %> </td>
            <td> <%=rs.getString(7) %> </td>
            <td style="background-color:#f2c88d"><i class="fa fa-inr"></i> <%=rs.getString(9) %></td>
            </tr>
            <%}
            ResultSet rs2 = stmt.executeQuery("select *from customer where b_email='"+email+"' ");
            while(rs2.next())
            {
            %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="center-div">
 <h3>Enter Hostel Name</h3>
 <center> <input class="input-style" type="text" name="hostelname" value="<%=rs2.getString(5)%>" placeholder="Enter Hostel Name" required>
 </center></div>

<div class="center-div">
<h3>Enter Room Number</h3>
 <center><input class="input-style" type="number" name="roomnumber" value="<%=rs2.getString(6)%>" placeholder="Enter Room Number" required>
</center>
</div> 

<div class="center-div">
<h3>Enter Mobile Number</h3>
<center> <input class="input-style" type="number" name="mobilenumber" value="<%=rs2.getString(7)%>" placeholder="Enter Mobile Number" required>
</center>
</div>
 <br><br>
<center> <button class="button" type="submit" >Order <i class='far fa-arrow-alt-circle-right'></i></button>
</center>
    <!--<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 
</div>-->

<!--<div class="right-div">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>

<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>

<h3 style="color: red">*Fill form correctly</h3>
</div>-->
</form>
<%
    }
}
catch(Exception e)
{
  System.out.println(e);
}
%>

      <br>
      <br>
      <br>

</body>
</html>