
<!DOCTYPE html>
<html>
    <script>
        function change()
        {
            var state=document.getElementById("selectid").value;
            if(state=="EmailID")
            {
//              document.getElementById("emp").style.visibility='hidden';
               document.getElementById("emp").style.display="none";
               document.getElementById("emp").required=false;
               document.getElementById("emailid").required=true;      
              document.getElementById("emailid").style.display="block"; 
               
            }
            else if(state=="EmployeeID")
            {
                document.getElementById("emailid").style.display="none";
                document.getElementById("emailid").required=false;
                document.getElementById("emp").required=true;
                document.getElementById("emp").style.display="block";
            }
        }
    </script>
<head>
<link rel="stylesheet" href="css/signup-style1.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="cuslog.jsp" method="post">
          <select name="securityquestion" id="selectid" onchange="change(this.value);" required>
              <option  >- - - - - - - - - - - -Select ID- - - - - - - - - - - -</option>
              <option value="EmailID">Email ID</option>
              <option value="EmployeeID">Employee ID</option>
              </select>
       <input style="display:none" type="email" name="email" id="emailid" placeholder="Enter Email ID "  />
       <input  style="display:none" type="text" name="empid" id="emp" placeholder="Enter Employee ID" />
       <input type="password" name="password"  placeholder="Enter Password" required/>
        <input type="submit"  value="Login">
      </form>
      <h2><a style="color:dimgray" href="signup.jsp">SignUp</a></h2>
       <h2><a style="color:dimgray" href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
    <%
        String msg=request.getParameter("msg");
      if("notexist".equals(msg))
                {%>
                <script>
                     alert("Incorrect Email or Password");
                 </script>
                <%}
        if("invalid".equals(msg))
                {%>
                <script>
                     alert("Something Went Wrong! Try Again!");
                 </script>
                <%}
%>
<!--  <div class='whysignLogin'>
  <h1>Incorrect Username or Password</h1>

<h1>Some thing Went Wrong! Try Again !</h1>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>-->
</div>

</body>
</html>