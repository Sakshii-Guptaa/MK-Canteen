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
<title>Edit Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>

<body>
    
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String id=request.getParameter("id");
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from menuitems where it_id='"+id+"' ");
    
    while(rs.next())
    {
       

%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(id); %>">
<div class="center-div">
 <h3>Enter Name</h3>
  <center><input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>
 </center>
<hr>
</div>

<div class="center-div">
<h3>Enter Price</h3>
  <center><input class="input-style" type="number" name="price" value="<%=rs.getString(3)%>" required>
 </center>
<hr>
</div>

<div class="center-div">
<h3>Enter Category</h3>
 <center> <input class="input-style" type="text" name="category" value="<%=rs.getString(4)%>" required>
 </center>
<hr>
</div>
 <center>
 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 </center>
</form>
<%
}
}
catch(Exception e)
        {
         System.out.println(e);
        }
%>

</body>
<%
 String msg=request.getParameter("msg");
    
        if("wrong".equals(msg))
                {%>
                <script>
                      Swal.fire("Item Already Exists!!","enter other name","error");
                 </script>
                 
                <%}

%>
<br><br><br>
</body>
</html>