<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    
<head>
<link rel="stylesheet" href="css/signup-style1.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Signup</title>
</head>
<body >
<div id='container'>
  <div class='signup'>
      <form action="cusreg.jsp" >
          <input type="text" name="name" placeholder="Enter Name" required>
          <input type="text" name="smartid" placeholder="Enter SmartID" required>
          <input type="email" name="email" placeholder="Enter Email" required>
          <input type="password" name="password" placeholder="Enter Password" required>
          <input type="text" name="hostelname" placeholder="Enter Hostel Name" required>
          <input type="number" name="roomnumber" placeholder="Enter Room Number" required>
          <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
<!--        
          <span style="color:black" id="message"></span><br>-->
          <select name="securityquestion" required>
              <option value="What was your first car?">What was your first car?</option>
              <option value="What is the name of your first pet?">What is the name of your first pet?</option>
              <option value="What elementary school did you attend?">What elementary school did you attend?</option>
              <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
          </select>
          <input type="text" name="answer" placeholder="Enter Answer" required>
          <input type="submit" name="btn_Signup" value="Sign up">
      </form>
      <h2><a style="color:dimgray" href="login.jsp">Login</a></h2>
  </div>
    <%
        String msg=request.getParameter("msg");
      if("invalid1".equals(msg))
                {%>
                <script>
                      Swal.fire("Invalid Email","*banasthali.in","error");
                 </script>
                 
                <%}
        if("pass".equals(msg))
                {%>
                <script>
                     Swal.fire("invalid Password"," ~ 8 characters.\n ~at least one UPPERCASE character.\n ~at least one LOWERCASE character.\n ~at least one number.\n~at least one Special character.","error");
               
                 </script>
                <%}
 if("phone".equals(msg))
                {%>
                <script>
                     Swal.fire("inValid Phone Number","~Invalid number/remove '0' from start","error");
                   </script>
                <%}

%>
</div>
<!--<script>
   function myfun()
   {
       var a=document.getElementById("mobilenumber").value;
       if(a==="")
       {
        document.getElementById("message") .innerHTML="*fill the field";
        return false;
       }
       if(isNaN(a))
       {
           document.getElementById("message") .innerHTML="*only numbers";
        return false;
       }
       if(a.length<10)
       {
            document.getElementById("message") .innerHTML="*number must be 10";
        return false;
       }
       if(a.length>10)
       {
            document.getElementById("message") .innerHTML="*number must not be greater than 10";
        return false;
       }
       if((a.charAt(0)!=9)&&(a.charAt(0)!=8)&&(a.charAt(0)!=7)&&(a.charAt(0)!=6))
       {
             document.getElementById("message") .innerHTML="*number must start with 9,8,7,6";
        return false;
       }
   }
    </script>-->
</body>
</html>