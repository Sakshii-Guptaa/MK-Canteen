<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
    int z=0;
try{
    String search=request.getParameter("search");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from menuitems where it_name like '%"+search+"%' or it_category like '%"+search+"%' ");
    
    while(rs.next())
    {
      z=1;
%>
          <tr>
           <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(4)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3)%></td>
          
            <td><a style="color:#8a1a30" href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
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
	
	
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by MK-CANTEEN</p>
      </div>

</body>
</html>