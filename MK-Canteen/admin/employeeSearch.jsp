<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="employeedetails.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Search</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
 .search-container {
      float: right;
    }
   .search-container button {
      float: right;
      padding: 6px 10px;
      margin-top: 8px;
      margin-right: 16px;
      background: #ddd;
      font-size: 17px;
      border: none;
      cursor: pointer;
    }
    
 .search-container button:hover {
      background: #ccc;
    }
      input[type=text] {
      padding: 6px;
      margin-top: 8px;
      font-size: 17px;
      border: none;
    }
    @media screen and (max-width: 600px) {
      .search-container {
        float: none;
      }
       a, input[type=text],.search-container button {
        float: none;
        display: block;
        text-align: left;
        width: 100%;
        margin: 0;
        padding: 14px;
      }
     input[type=text] {
        border: 1px solid #ccc;  
      }
      }
  
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Employee <i class='fas fa-users'></i></div>
<table>
        <thead>
            <tr>
        
             <div class="search-container" >
                <form action="employeeSearch.jsp" method="post">
                    <input type="text" placeholder="Search" name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>    
                </form>
             </div>
       
            </tr>
        <tr>
            <th scope="col">Sno</th>
            <th scope="col">Name</th>
            <th scope="col">Password</th>
            <th scope="col">Contact Number</th>
            <th scope="col">Father Name</th>
            <th scope="col">Mother Name</th>
            <th scope="col">Address</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
<%
    int z=0;
try{
    int sn=0;
    String search=request.getParameter("search");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from employee where e_name like '%"+search+"%' or e_id like '%"+search+"%' ");
    
    while(rs.next())
    {
      z=1;
      sn=sn+1;
%> 
           <tr>
            
          <td><%out.println(sn);%></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
             <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><a style="color:#8a1a30" href="editEmployee.jsp?eid=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            <td><a onclick="checker()" style="color:#8a1a30" href="deleteEmployee.jsp?eid=<%=rs.getString(1)%> ">Delete <i class='fas fa-trash-alt'></i></a></td>
          
          </tr>
       <%
}
}
catch(Exception e)
{
System.out.println(e);
}%>  
        </tbody>
      </table>
      	<%
            if(z==0)
            {%>
                <h1 style="color:white; text-align: center;">Nothing to show</h1>
            <%}
        %>
	
	<script>
            function checker()
            {
                var res=confirm('Are you sure you want to fire this employee?');
                if(res ===false)
                {
                    event.preventDefault();
                }
            }
        </script>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved</p>
      </div>

</body>
</html>