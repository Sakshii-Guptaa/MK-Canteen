
<%--<%@include file="index.html"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>

<%
       String u=request.getParameter("email");
       session.setAttribute("email",u);
       String eid=request.getParameter("empid");
       session.setAttribute("empid",eid);
       String sq=request.getParameter("securityquestion");
       String p=request.getParameter("password");
       if("mk@gmail.com".equals(u) && "MKadmin".equals(p)){
           session.setAttribute("email", u);
           response.sendRedirect("admin/adminHome.jsp");
       }
       else if("EmployeeID".equals(sq))
       {
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement stmt =con.createStatement();
              ResultSet rs2 = stmt.executeQuery("select *from employee");
         String e_id,e_pass;
              int flag=0;
            while(rs2.next()){
                e_id =rs2.getString("e_id");
                e_pass= rs2.getString("e_pass");

                if(eid.equals(e_id) && p.equals(e_pass) ){
           
                    response.sendRedirect("employee/employeeHome.jsp");
                    flag=1;
                    break;
                }
       }
            if(flag==0)
            {
                 response.sendRedirect("login.jsp?msg=notexist");
          
            }
            con.close();
            }catch(Exception e)
        {
            out.println(e);
            response.sendRedirect("login.jsp?msg=invalid");
        }   
       }
      
       else{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement stmt =con.createStatement();
            ResultSet rs1 = stmt.executeQuery("select b_name from customer where b_email='"+u+"' ");
            String name;
            while(rs1.next())
            {
               name =rs1.getString("b_name"); 
               session.setAttribute("name",name);
            }
            ResultSet rs = stmt.executeQuery("select * from customer ");
              String b_email,b_pass;
              int flag=0;
            while(rs.next()){
                b_email =rs.getString("b_email");
                b_pass= rs.getString("b_pass");

                if(u.equals(b_email) && p.equals(b_pass) ){
           
                    response.sendRedirect("customerHome.jsp");
                    flag=1;
                    break;
                }
            }
            if(flag==0)
            {
                 response.sendRedirect("login.jsp?msg=notexist");
          
            }
            con.close();
        } catch(Exception e)
        {
            out.println(e);
            response.sendRedirect("login.jsp?msg=invalid");
        }        
       }
%>
</body>
</html>