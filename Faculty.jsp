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
        <title>Admin | Registered Faculties</title>
        <link rel="stylesheet" href="reg_stud.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav>
        <a href="AdminHome.jsp"><i class="fa fa-home" aria-hidden="true"></i>HOME</a>
        <a class="active" href="Student.jsp"><i class="fa fa-users" aria-hidden="true"></i>Students</a>
        <a href="Faculty.jsp"><i class="fa fa-users" aria-hidden="true"></i>Faculties</a>
        <a href="Courses.jsp"><i class="fa fa-book" aria-hidden="true"></i>Courses</a>        
        <a href="Doubts.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Doubts</a>
        <a href="Announcements.jsp"><i class="fa fa-bell" aria-hidden="true"></i>Announcements</a>
        <div class="right"><a href="main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></div>
        </nav>
        <form method="post" name="form">
	<h2>Details of all Registered Faculties</h2>
        <table border="1">
        <tr>
        <th>Faculty ID</th>    
        <th>Faculty Name</th>
        <th>Email-id</th>
        <th>Contact details</th>
        <th>Delete</th>
        <th>Verify</th>
        </tr>
        <%
            String pass1=(String)session.getAttribute("password1");
            try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
   
            String sql="select * from vc_faculty";
            ResultSet rs= s.executeQuery(sql);
            while(rs.next())
            {
        %>   
        <center>
            <tr>
            <td><%=rs.getString("fid") %></td>
            <td><%=rs.getString("fname") %></td>
            <td><%=rs.getString("email_id") %></td>
            <td><%=rs.getString("ph_no") %></td>
            <td><a href="DeleteFaculty.jsp?fid=<%=rs.getInt("fid") %>"><button type="button" class="delete">Delete</button></a></td>
            <td><a href="verifyFaculty.jsp?fid=<%=rs.getInt("fid") %>"><button type="button" class="delete">Verify</button></a></td>
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
        </center>
        </form>
        
    </body>
</html>
