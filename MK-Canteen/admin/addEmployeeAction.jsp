<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
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
    Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root",""); 
           
             if(ephone.length()!=10 || ephone.charAt(0)=='0')
              {
                    response.sendRedirect("addEmployee.jsp?msg=phone");
                    return;
              }
              if(eadhar.length()!=12 || eadhar.charAt(0)=='0')
              {
                    response.sendRedirect("addEmployee.jsp?msg=adhar");
                    return;
              }
                ps=conn.prepareStatement("insert into employee(e_id,e_name,e_pass,e_phone,e_father,e_mother,e_adhara,e_address,e_status)values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, eid);
                ps.setString(2, ename);
                ps.setString(3, epass);
                ps.setString(4, ephone);
                ps.setString(5, efather);
                ps.setString(6, emother);
                ps.setString(7, eadhar);
                ps.setString(8, eaddress);
                ps.setString(9,"available");
                if(ps.executeUpdate()>0)
                { response.sendRedirect("addEmployee.jsp?msg=done");}
}
catch(Exception e)
{
  response.sendRedirect("addEmployee.jsp?msg=wrong");  
}



%>
