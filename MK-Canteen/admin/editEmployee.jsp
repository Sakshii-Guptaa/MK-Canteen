<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="employeedetails.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style2.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Edit Employee</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
    <%
         String msg=request.getParameter("msg");
     if("adhar".equals(msg))
                {%>
                <script>
                      Swal.fire("Invalid Aadhar!!","must have 12 digits","error");
                 </script>
                 
                <%}
     
 if("phone".equals(msg))
                {%>
                <script>
                     Swal.fire("inValid Phone Number","~Invalid number/remove '0' from start","error");
                   </script>
                <%}
%>
 <h2><a class="back" href="allEmployee.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String eid=request.getParameter("eid");
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from employee where e_id='"+eid+"' ");
    
    while(rs.next())
    {
       

%>
<form action="editEmployeeAction.jsp" method="post">
<input type="hidden" name="eid" value="<% out.println(eid); %>">
<div class="center-div">
 <h3>Employee Name</h3>
  <center><input class="input-style" type="text" name="ename" value="<%=rs.getString(2)%>" required>
 </center>
<hr>
</div>
<div class="center-div">
 <h3>Employee Password</h3>
  <center><input class="input-style" type="password" name="epass" value="<%=rs.getString(3)%>" required>
 </center>
<hr>
</div>
 <div class="center-div">
 <h3>Employee Contact Number</h3>
  <center><input class="input-style" type="number" name="ephone" value="<%=rs.getString(4)%>" required>
 </center>
<hr>
</div>
 <div class="center-div">
 <h3>Employee Father Name</h3>
  <center><input class="input-style" type="text" name="efather" value="<%=rs.getString(5)%>" required>
 </center>
<hr>
</div>
  <div class="center-div">
 <h3>Employee Mother Name</h3>
  <center><input class="input-style" type="text" name="emother" value="<%=rs.getString(6)%>" required>
 </center>
<hr>
<div class="center-div">
 <h3>Enter Aadhar Number</h3>
 <center><input class="input-style" type="number" name="eadhar" value="<%=rs.getString(7)%>" required>
</center>
     <hr>
</div>
 <h3>Enter Address</h3>
<center><input class="input-style"  name="eaddress" value="<%=rs.getString(8)%>" required>
</center>

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
<br><br><br>
</body>
</html>