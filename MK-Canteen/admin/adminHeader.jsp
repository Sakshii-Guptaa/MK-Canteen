<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/admin-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<!--    Header   create table project.cart(
                   email varchar(100),
                   item_id int,
                   quantity int,
                   price int,
                   total int,
                   hostel varchar(50),
                   room varchar(10),
                   mobile varchar(12),
                   orderdt varchar(100),
                   deliverydt varchar(100)
                   );
                   create table project.menuitems(
                   it_id int NOT NULL,
                   it_name varchar(100),
                   it_price varchar(10),
                   it_category varchar(100),
                   PRIMARY KEY(it_id)
                   );-->
    <br>
    <div class="topnav sticky">
    <% String email=session.getAttribute("email").toString();%>
            <center><h2>MK-CANTEEN</h2></center>
            <a href="addNewProduct.jsp">Add New Item <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Items & Edit Items <i class='fab fa-elementor'></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
             <a href="messagesReceived.jsp">Messages Received <i class='fas fa-comment-alt'></i></a>
           
            <!--            <a href="">Cancel Orders <i class='fas fa-window-close'></i></a>
            <a href="">Delivered Orders <i class='fas fa-dolly'></i></a>
            -->
            <a href="addEmployee.jsp">Employee Data <i class='fas fa-user-alt'></i></a>
          <a href="AssignOrder.jsp">Assign Order &#10004;</a>
           
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
           
          </div>
           <br>
           <!--table-->
