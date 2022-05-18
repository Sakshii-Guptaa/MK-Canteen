<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=session.getAttribute("email").toString();
String securityquestion=request.getParameter("securityquestion");
String newanswer=request.getParameter("newanswer");
String password=request.getParameter("password");
int check=0;
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from customer where b_email='"+email+"' and b_pass='"+password+"' ");
    while(rs.next())
    {
        check=1;
        stmt.executeUpdate("update customer set b_security='"+securityquestion+"',b_answer='"+newanswer+"' where b_email='"+email+"'");
        response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
    }
    if(check==0)
       response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
}


catch(Exception e)
{
    System.out.println(e);
    
}
%>