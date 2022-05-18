<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%@include file="../footer.jsp" %>
<%@include file="employeeHeader.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Past Orders</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
 .search-container {
      float: right;
    }
   .search-container button {
      float: right;
      padding: 6px 10px;
      margin-top: 8px;
      margin-right: 16px;
      background: #ddd;
      font-size: 17px;
      border: none;
      cursor: pointer;
    }
    
 .search-container button:hover {
      background: #ccc;
    }
      input[type=text] {
      padding: 6px;
      margin-top: 8px;
      font-size: 17px;
      border: none;
    }
    @media screen and (max-width: 600px) {
      .search-container {
        float: none;
      }
       a, input[type=text],.search-container button {
        float: none;
        display: block;
        text-align: left;
        width: 100%;
        margin: 0;
        padding: 14px;
      }
     input[type=text] {
        border: 1px solid #ccc;  
      }
      }
  
</style>
</head>
<body>
<!--    <div style="color: black; text-align: center; font-size: 30px;">---Delivered!---</div>-->


<table>
        <thead>
          <tr>
               <th scope="col">Customer name</th>
            <th scope="col">Customer Email</th>
            
             <th scope="col">Customer Contact Number</th>
              <th scope="col">Customer Hostel Name</th>
             <th scope="col">Customer Room Number</th>
              <th scope="col">Total Bill</th>
<!--            <th scope="col"><i class="fa fa-inr"></i> Total Bill</th>-->
              
          </tr>
        </thead>
        <tbody>
<%
try{
    String notpaid="paid";
 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
      ResultSet rs = stmt.executeQuery("select * from customer inner join assignorder on e_id='"+empid+"' and payment_status='"+notpaid+"' and customer.b_email=assignorder.b_email");
   
//    ResultSet rs = stmt.executeQuery("select * from assignorder where e_id='"+empid+"' && payment_status='"+notpaid+"'");
//    String cusemail=rs.getString(2);
//    
//    ResultSet rs1=stmt.executeQuery("select * from customer where b_email='"+cusemail+"'");
//    
while(rs.next())
    {
  
%>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(11)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
             <td><%=rs.getString(12)%></td>
           
          </tr>
<%
}
}
catch(Exception e)
{
System.out.println(e);
}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>