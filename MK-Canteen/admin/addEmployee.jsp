<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="employeedetails.jsp" %>
<%--<%@include file="../footer.jsp" %>--%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style2.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Add New Employee</title>
<style>
    textarea
{
        min-width:25%;
	min-height: 125px;
        max-height:125px;
        max-width:25%;
	font-size: 14px;
}
.input-style {
  width: 50%;
  padding: 12px 20px;
  box-sizing: border-box;
  border: none;
  background-color:white;
  color: black;
  font-size: 16px;
}

input[type=text]:focus, textarea:focus,button:focus{
  outline: 2px solid black;
  background-color:whitesmoke;     /* oranges! yey */
}

.left-div
{
	width: 50%;
/*        margin-left:5%;*/
	display:inline-block;
  
}

.right-div
{
	width: 50%;
/*        margin-right:10%;*/
	display:inline-block;
}
</style>
</head>
<body>
 <%
        String msg=request.getParameter("msg");
        if("done".equals(msg))
                {%>
                <h3 class="alert"> Employee Added Successfully</h3>
                <%}
        if("wrong".equals(msg))
                {%>
                <script>
                     alert("Something Went Wrong! Try Again");
                 </script>
                <%}
    

%>

<%
int id=1;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select max(e_id) from employee");
    
    while(rs.next())
    {
        id=rs.getInt(1);
        id=id+1;
    }
}
catch(Exception e){
    
}
%>
<form action="addEmployeeAction.jsp" method="post">
<h3 style="color: yellow;">Employee ID: <% out.println(id );%> </h3>
<input type="hidden" name="id" value="<% out.println(id );%>">

<div class="left-div">
 <h3>Enter Employee Id</h3>
 <center><input class="input-style" type="text" name="eid" placeholder="Enter Employee Id" required>
</center>
     <hr>
</div>

<div class="right-div">
 <h3>Enter Name</h3>
 <center><input class="input-style" type="text" name="ename" placeholder="Enter Employee Name" required>
</center>
     <hr>
</div>
  
<div class="left-div">
 <h3>Enter Password</h3>
 <center><input class="input-style" type="password" name="epass" placeholder="Enter Password" required>
</center>
     <hr>
</div>
<div class="right-div">
 <h3>Enter Mobile Number</h3>
 <center><input class="input-style" type="number" name="ephone" placeholder="Enter Mobile Number" required>
</center>
     <hr>
</div>
<div class="left-div">
 <h3>Enter Father Name</h3>
 <center><input class="input-style" type="text" name="efather" placeholder="Enter Father Name" required>
</center>
     <hr>
</div>
<div class="right-div">
 <h3>Enter Mother Name</h3>
 <center><input class="input-style" type="text" name="emother" placeholder="Enter Mother Name" required>
</center>
     <hr>
</div>
<div class="right-div">
 <h3>Enter Aadhar Number</h3>
 <center><input class="input-style" type="number" name="eadhar" placeholder="Enter Aadhar Number" required>
</center>
     <hr>
</div>
 <h3>Enter Address</h3>
<center><textarea class="input-style"  name="eaddress" placeholder="Enter Address" required></textarea>
</center>

   
<hr>
<center><button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</center>
</form>
</body>
<br><br><br>
</body>
</html>