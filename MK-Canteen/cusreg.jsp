<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
       
    Connection conn;
    PreparedStatement ps;
    int no;
    String name,smartid,email,pass,hostel,room,phone,answer,security;
    RequestDispatcher dispatcher=null;
    String EMAIL_REGEX= "^[a-z0-9_+&-]+(?:\\.[a-zA-Z0-9_+&-]+)*@(?:[banasthali]+\\.)+[in]{2}$";
    String PASS_REGEX="^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-]).{8,}$";  
    try{
            name=request.getParameter("name");
            session.setAttribute("name",name);
            smartid=request.getParameter("smartid");
            email=request.getParameter("email");
            session.setAttribute("email",email);
            pass=request.getParameter("password");
            hostel=request.getParameter("hostelname");
            room=request.getParameter("roomnumber");
            phone=request.getParameter("mobilenumber");
             security=request.getParameter("securityquestion");
              answer=request.getParameter("answer");
              String nothing="";
              
              if(phone.length()!=10 || phone.charAt(0)=='0')
              {
                    response.sendRedirect("signup.jsp?msg=phone");
                    return;
              }
//              if(name.equals(nothing)){
//                  out.println("<font color=red>please fill the name!</font><br>");
//              }
              if(!email.matches(EMAIL_REGEX) || email==null || email.equals(" ")){
                   response.sendRedirect("signup.jsp?msg=invalid1");
                   return;
                //dispatcher=request.getRequestDispatcher("signup.jsp");
                 //dispatcher.forward(request, response);
                   //out.println("<font color=red>please fill banasthali email address!</font><br>");
              }
              if(!pass.matches(PASS_REGEX) ){
                   response.sendRedirect("signup.jsp?msg=pass");
                 
              }
            Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root",""); 
           
            if(email.matches(EMAIL_REGEX) && pass.matches(PASS_REGEX) )
            {
                ps=conn.prepareStatement("insert into customer(b_name,b_smartid,b_email,b_pass,b_hostel,b_room,b_phone,b_security,b_answer)values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, smartid);
                ps.setString(3, email);
                ps.setString(4, pass);
                ps.setString(5, hostel);
                ps.setString(6, room);
                ps.setString(7, phone);
                ps.setString(8, security);
                ps.setString(9, answer);
                if(ps.executeUpdate()>0)
                { response.sendRedirect("customerHome.jsp");}
            }
        }
        catch(Exception ex)
        {
           response.sendRedirect("signup.jsp?msg=invalid");
        }
   
%>