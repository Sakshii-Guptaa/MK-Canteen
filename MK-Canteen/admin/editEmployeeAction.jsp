<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%
     Connection conn;
    PreparedStatement ps;
String eid=request.getParameter("eid");
String ename=request.getParameter("ename");
String epass=request.getParameter("epass");
String ephone=request.getParameter("ephone");
String efather=request.getParameter("efather");
String emother=request.getParameter("emother");
String eadhar=request.getParameter("eadhar");
String eaddress=request.getParameter("eaddress");
try{
     if(ephone.length()!=10 || ephone.charAt(0)=='0')
              {
                    response.sendRedirect("allEmployee.jsp?msg=phone");
                    return;
              }
     if(eadhar.length()!=12 || eadhar.charAt(0)=='0')
              {
                    response.sendRedirect("allEmployee.jsp?msg=adhar");
                    return;
              }
    Class.forName("com.mysql.jdbc.Driver"); 
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); 
    Statement stmt =conn.createStatement();
    stmt.executeUpdate("update employee set e_name='"+ename+"',e_pass='"+epass+"',e_phone='"+ephone+"',e_father='"+efather+"',e_mother='"+emother+"',e_adhara='"+eadhar+"',e_address='"+eaddress+"' where e_id='"+eid+"' ");
    response.sendRedirect("allEmployee.jsp?msg=done");}
catch(Exception e)
{
  response.sendRedirect("allEmployee.jsp?msg=wrong");  
}



%>