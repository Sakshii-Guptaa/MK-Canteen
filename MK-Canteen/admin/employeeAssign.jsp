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
<title>Employee Assign</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
 .search-container {
      float: right;
    }
   .search-container button {
      float: right;
      padding: 6px 10px;
      margin-top: 8px;
      margin-right: 16px;
      background: #ddd;
      font-size: 17px;
      border: none;
      cursor: pointer;
    }
    
 .search-container button:hover {
      background: #ccc;
    }
      input[type=text] {
      padding: 6px;
      margin-top: 8px;
      font-size: 17px;
      border: none;
    }
    @media screen and (max-width: 600px) {
      .search-container {
        float: none;
      }
       a, input[type=text],.search-container button {
        float: none;
        display: block;
        text-align: left;
        width: 100%;
        margin: 0;
        padding: 14px;
      }
     input[type=text] {
        border: 1px solid #ccc;  
      }
      }
  
</style>
</head>
<body>               
<div style="color: white; text-align: center; font-size: 30px;">Assign Employee &#10004;</div>
                 
<table>
        <thead>
             <tr>
        
             <div class="search-container" >
                <form action="assignemployeeSearch.jsp" method="post">
                    <input type="text" placeholder="Search" name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>    
                </form>
             </div>
       
            </tr>
          <tr>
            <th scope="col">Employee Name</th>
            <th scope="col">Assign </th>
          </tr>
        </thead>
        <tbody>
       <%
           try{
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement stmt =con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from employee");
                while(rs.next())
                {
           
       %>
          <tr>
             <td><%=rs.getString(2) %></td>
             <td><a style="color:#8a1a30" href="goyal.jsp?id=<%=rs.getString(1)%>"><span style='font-size:25px;'>&#10146;</span></a></td>
          </tr>
         <%
          }
          }
      catch(Exception e)
        {
         System.out.println(e);
        }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
 <script>
            function checker()
            {
                var res=confirm('Are you sure want to delete this item?');
                if(res ===false)
                {
                    event.preventDefault();
                }
            }
        </script>
</body>
</html>