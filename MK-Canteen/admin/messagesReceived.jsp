<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message received to Admin</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
textarea
{
        min-width:90%;
	min-height: 90px;
        max-height:92px;
        max-width:92%;
	font-size: 14px;
}

</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<%
 String msg=request.getParameter("msg");
      if("deleted".equals(msg))
                {%>
                <script>
                     alert("Item Deleted Successfully");
                 </script>
                <%}
        if("wrong".equals(msg))
                {%>
                <script>
                     alert("Something Went Wrong! Try Again");
                 </script>
                <%}

%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Description</th>
             <th scope="col">Delete <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from feedbackdb");
    int sno=0;
    while(rs.next())
    {
       sno=sno+1;
       %>
          <tr>
              <td><%out.println(sno);%></td>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><textarea ><%=rs.getString(3)%></textarea></td>
            <td><a style="color:#8a1a30" href="deleteMessage.jsp?email=<%=rs.getString(2)%> ">Delete <i class='fas fa-trash-alt'></i></a></td>
          
          </tr>
<%
         }
}
catch(Exception e){
    System.out.println(e);
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>