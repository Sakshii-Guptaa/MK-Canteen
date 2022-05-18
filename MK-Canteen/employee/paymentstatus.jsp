<%-- 
    Document   : paymentstatus
    Created on : 4 May, 2022, 8:43:20 PM
    Author     : simco
--%>
<%@include file="../footer.jsp" %>
<%@include file="employeeHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/admin-style.css">
        <title>payment Status</title>
    </head>
    <body>
        <style>
            .input-style {
  width: 30%;
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
.button {
  background-color: #2f3030;
  border: none;
  color: white;
  padding: 12px 20px;
  text-decoration: none;
  font-size: 14px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  font-size: 25px;
  width: 15%;
   border-radius: 25px;
}
h3{
    text-align: center;
    color: white; 
}

        </style>
        <%
        String msg=request.getParameter("msg");
      if("done".equals(msg))
                {%>
                <script>
                     alert("Thanks for deliver!");
                 </script>
                <%}
        if("notdone".equals(msg))
                {%>
                <script>
                     alert("Sorry! Fill the correct amount");
                 </script>
                <%}
%>
        <form action="paymentstatusAction.jsp" method="post">
            <div class="center-div">
                <br>
                <br>
    <h3>Enter Total Amount</h3>
 <center><input class="input-style" type="text" name="amount" placeholder="Enter total amount" required>
</center>
    <br>
</div>
            <center><button onclick=checker() class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</center>
          <script>
            function checker()
            {
                var res=confirm('Are you sure delivered the item?');
                if(res ===false)
                {
                    event.preventDefault();
                }
            }
        </script>
        </form>
    </body>
</html>
