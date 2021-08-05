<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Announcements</title>
        <link rel="stylesheet" href="reg_stud.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav>
        <a href="AdminHome.jsp"><i class="fa fa-home" aria-hidden="true"></i>HOME</a>
        <a href="AddNewsAnnouncements.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i>Add New Announcements</a>
        <div class="right"><a href="main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></div>
        </nav>
        
        <h2>All Announcements </h2>
        <table border="1">
        <tr>
        <th>Notice ID</th>
        <th>Notice</th>
        <th>Date of announcement</th>
        <th>Delete</th>
        </tr>
        <%
            String pass1=(String)session.getAttribute("password1");
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
            
            String sql="select * from announcements";
            ResultSet rs= s.executeQuery(sql);
            while(rs.next())
            {
        %>   
            <tr>
            <td><%=rs.getString("n_id") %></td>
            <td><%=rs.getString("notice") %></td>
            <td><%=rs.getString("date") %></td>
            <td><a href="DeleteAnnouncements.jsp?nid=<%=rs.getInt("n_id") %>"><button type="button" class="delete">Delete</button></a></td>
            </tr>
        <%
            }
            rs.close();
            s.close();
            c.close();
            
            }
            catch(Exception e) {
            e.printStackTrace();
            }
        %>
        </table>
        </footer>
        
    </body>
</html>
