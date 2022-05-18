<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style2.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Add New Item</title>
</head>
<body>
<%
 String msg=request.getParameter("msg");
      if("done".equals(msg))
                {%>
                <h3 class="alert"> Item Added Successfully</h3>
                <%}
        if("wrong".equals(msg))
               {%>
                <script>
                      Swal.fire("Item already exixts!","Enter New Item","error");
                 </script>
                 
                <%}

%>
<%
int id=1;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select max(it_id) from menuitems");
    
    while(rs.next())
    {
        id=rs.getInt(1);
        id=id+1;
    }
}
catch(Exception e){
    
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <% out.println(id );%> </h3>
<input type="hidden" name="id" value="<% out.println(id );%>">

<div class="center-div">
 <h3>Enter Name</h3>
 <center><input class="input-style" type="text" name="name" placeholder="Enter Item Name" required>
</center>
     <hr>
</div>

<div class="center-div">
<h3>Enter Category</h3>
<center> <input class="input-style" type="text" name="category" placeholder="Enter Category" required>
</center>
<hr>
</div>

<div class="center-div">
<h3>Enter Price</h3>
<center><input class="input-style" type="number" name="price" placeholder="Enter Price" required>
</center>
</div>

   
<hr>
</div>
<center><button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</center>
</form>
</body>
<br><br><br>
</body>
</html>