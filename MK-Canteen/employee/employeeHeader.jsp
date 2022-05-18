<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/admin-style1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String empid=(String)session.getAttribute("empid");   %>
            <center><h2>MK-CANTEEN</h2></center>
            <h2><a href="">Employee id:<% out.println(empid); %><i class='fas fa-user-alt'></i></a></h2>
            
            <a href="allOrders.jsp">All Orders<i class='fas fa-plus-square'></i></a>
             <a href="paymentstatus.jsp">payment status<i class='fas fa-plus-square'></i></a>
            <a href="PastOrders.jsp">Past Orders<i class='fab fa-elementor'></i></a>          
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
           
          </div>
           <br>
           <!--table-->
