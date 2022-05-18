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
<title>My Cart</title>
<style>
h3
{
color: yellow;
text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
        String msg=request.getParameter("msg");
      if("notPossible".equals(msg))
                {%>
                <script>
                     alert("There is only one Quantity! So click on remove!");
                 </script>
                <%}
        if("inc".equals(msg))
                {%>
                   <h3 class="alert"> Quantity  Increased Successfully!</h3>
                <% }
         if("dec".equals(msg))
                {%>
                <h3 class="alert">Quantity  Decreased Successfully!</h3>
                <%}
         if("removed".equals(msg))
               {%>
                   <h3 class="alert">item removed!</h3>
                <% }
%>


<table>
<thead>
<%
    int total=0;
    int sno=0;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs1 = stmt.executeQuery("select sum(total) from cart where email='"+email+"'  ");
   
    while(rs1.next())
    {
       total=rs1.getInt(1);
    }

%>
          <tr>
            <th scope="col" style="background-color: #f70008;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
            <th  style="background-color: yellow">Payment:Cash On Delivery</th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Item Name</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
             <th scope="col">Category</th>
            <th scope="col">Quantity</th>
            <th scope="col" style="background-color:#f2c88d"><i class="fa fa-inr"></i>Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs = stmt.executeQuery("select * from menuitems inner join cart on it_id=cart.item_id and cart.email='"+email+"' ");
     while(rs.next())
     {
 
%>
          <tr>
           <%sno=sno+1;%>
           <td><%out.println(sno);%></td>
            <td><%=rs.getString(2)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3)%> </td>
            <td><%=rs.getString(4)%></td>
           
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%> &quantity=inc "><i class='fas fa-plus-circle' style="color:#8a1a30"></i></a><%=rs.getString(7)%>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%> &quantity=dec "><i class='fas fa-minus-circle' style="color:#8a1a30"></i></a></td>
            <td style="background-color:#f2c88d"><i class="fa fa-inr"></i> <%=rs.getString(9)%></td>
            <td><a onclick="checker()" style="color:#8a1a30" href="removeFromCart.jsp?id=<%=rs.getString(1)%> ">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
}
%>
 <tr>
      <%if(total>0){%> 
     <td></td>
     <td></td>
     <td></td>
   
     
 <th scope="row" style="background-color:#909696; font-size: 18px" ><a style="color:white;" href="addressPaymentForOrder.jsp">Proceed to order</a></th> 
     <td></td>
     <td></td>
     <td></td>
     <%} %>
 </tr>
 <%      
}
catch(Exception e)
{
   
}

%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
      <script>
            function checker()
            {
                var res=confirm('Are you sure you want to remove this item?');
                if(res ===false)
                {
                    event.preventDefault();
                }
            }
        </script>

</body>
</html>