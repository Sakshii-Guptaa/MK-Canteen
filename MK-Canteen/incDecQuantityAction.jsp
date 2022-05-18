<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=(String)session.getAttribute("email");
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from cart where email='"+email+"' and item_id='"+id+"'  ");

    while(rs.next())
    {
       price=rs.getInt(4);
       total=rs.getInt(5);
       quantity=rs.getInt(3);
    }
    if(quantity==1 && incdec.equals("dec"))
        response.sendRedirect("myCart.jsp?msg=notPossible");
    else if(quantity!=1 && incdec.equals("dec"))
    {
        total=total-price;
        quantity=quantity-1;
        stmt.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and item_id='"+id+"'  ");
        response.sendRedirect("myCart.jsp?msg=dec");
    }
    else
    {
         total=total+price;
        quantity=quantity+1;
        stmt.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and item_id='"+id+"' ");
        response.sendRedirect("myCart.jsp?msg=inc");
    }
}
catch(Exception e)
{
    System.out.println(e);
}
%>