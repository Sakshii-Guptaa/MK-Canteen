<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/admin-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
            <center><h2>Employee Details<i class="fa fa-edit"></i></h2></center>
              <%String email=(String)session.getAttribute("email");   %>
            <h2><a href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
            <a href="addEmployee.jsp">Add Employee <i class='fas fa-plus-square'></i></a>
            <a href="allEmployee.jsp">All Employee <i class='fas fa-users'></i></a>
            
             </div>
           <br>
           <!--table-->
