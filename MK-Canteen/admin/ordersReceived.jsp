<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Order received to admin</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<%
 String msg=request.getParameter("msg");
      if("cancel".equals(msg))
                {%>
                <h3 class="alert">Order Cancel Successfully!</h3>
                <%}
        if("delivered".equals(msg))
                {%>
               <h3 class="alert">Successfully Updated!</h3>
                <%}
 if("invalid".equals(msg))
                {%>
              <h3 class="alert">Some thing went wrong! Try Again!</h3>
                <%}

%>

<table id="customers">
          <tr>
          <th scope="col">S No.</th>
          <th scope="col">Customer Email</th>
            <th scope="col">Item Name</th>
            <th scope="col">Quantity</th>
            <th scope="col" style="background-color:#c3dbc9"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Hostel</th>
            <th>Room No.</th>
            <th>Mobile Number</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
              <!--<th scope="col">Cancel order <i class='fas fa-window-close'></i></th>-->
   <th scope="col">Delivery Status <i class='fas fa-dolly'></i></th>
          </tr>
     <%
       try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from cart inner join menuitems where cart.item_id=menuitems.it_id and cart.orderdt is not NULL order by status DESC");
    int sno=0;
    while(rs.next())
    {
       sno=sno+1;
      
%>    
       
          <tr>
          <td><%out.println(sno);%></td>
          <td ><%=rs.getString(1)%></td>
            <td><%=rs.getString(14)%></td>
            <td><%=rs.getString(3)%></td>
            <td style="background-color:#c3dbc9"><i class="fa fa-inr"></i><%=rs.getString(5)%>  </td>
                <td><%=rs.getString(6)%></td>
               <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                 <td><%=rs.getString(9)%></td>
             <td><%=rs.getString(10)%></td>
                 <td><%=rs.getString(11)%></td>
                <!--<td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%> & email=<%=rs.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>-->
                </tr>
      <%
          
     }

%>

 <%
}
      catch(Exception e){
    System.out.println(e);
}
      %>   
        </table>
      <br>
      <br>
      <br>

</body>
</html>