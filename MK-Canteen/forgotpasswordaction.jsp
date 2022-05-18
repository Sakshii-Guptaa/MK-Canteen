<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
    Connection connn;
    PreparedStatement ps;
    int no;
    String email,mobilenumber,securityquestion,answer,newpassword;
    int check=0;
        try{
        
            email=request.getParameter("email");
            mobilenumber=request.getParameter("mobilenumber");
            securityquestion=request.getParameter("securityquestion");
            answer=request.getParameter("answer");
            newpassword=request.getParameter("newpassword");
            Class.forName("com.mysql.jdbc.Driver"); 
            connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root",""); 
            Statement st=connn.createStatement();
            ResultSet rs=st.executeQuery("select * from customer where b_email='"+email+"' and b_phone='"+mobilenumber+"' and b_security='"+securityquestion+"' and b_answer='"+answer+"' ");
            while(rs.next())
            {
                check=1;
                st.executeUpdate("update customer set b_pass='"+newpassword+"' where b_email='"+email+"' ");
                response.sendRedirect("forgotPassword.jsp?msg=done");
            }
            if(check==0)
            {
                response.sendRedirect("forgotPassword.jsp?msg=invalid");
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex);
           
        }
  
%>
