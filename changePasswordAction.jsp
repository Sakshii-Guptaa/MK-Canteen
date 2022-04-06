<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=session.getAttribute("email").toString();
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");
if(!confirmpassword.equals(newpassword))
   response.sendRedirect("changePassword.jsp?msg=notMatch");
else
{
    int check=0;
    try
    {
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from customer where b_email='"+email+"' and b_pass='"+oldpassword+"'  ");

    while(rs.next())
    {
       check=1;
       stmt.executeUpdate("update customer set b_pass='"+newpassword+"' where b_email='"+email+"' ");
       response.sendRedirect("changePassword.jsp?msg=done");
    }
    if(check==0)
        response.sendRedirect("changePassword.jsp?msg=wrong");
    }
    catch(Exception e)
{
    System.out.println(e);
  
}
}
%>