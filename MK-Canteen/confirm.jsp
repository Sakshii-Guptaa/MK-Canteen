<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=(String)session.getAttribute("email");
String product_id=request.getParameter("id");
%>
<script>
    
    var deletePost =confirm("do you?");
    if(deletePost)
    {
        <%
        try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    stmt.executeUpdate("delete from cart where email='"+email+"' and item_id='"+product_id+"' ");
    response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e)
{
    System.out.println(e);
}
        %>
    }
    </script>