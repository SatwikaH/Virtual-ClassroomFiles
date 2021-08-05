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
        <title>Admin | All Courses</title>
        <link rel="stylesheet" href="reg_stud.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav>
        <a href="AdminHome.jsp"><i class="fa fa-home" aria-hidden="true"></i>HOME</a>
        <a href="Courses.jsp"><i class="fa fa-book" aria-hidden="true"></i>Courses</a>
        <a href="AddNewCourse.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i>Add New Course</a>
       <div class="right"><a href="main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></div></nav>
        <form method="post" name="form">
	<h2>Details of all Courses</h2>
        <table border="1">
        <tr>
        <th>Subject ID</th>    
        <th>Subject Name</th>
        <th>Semester</th>
        <th>Branch</th>
        <th>Faculty</th>
        <th>Edit</th>
        <th>Delete</th>
        </tr>
        <%
            String pass1=(String)session.getAttribute("password1");
            try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
           
            String sql="select * from subj";
            ResultSet rs= s.executeQuery(sql);
            while(rs.next())
            {
        %>   
        <center>
            <tr>
            <td><%=rs.getInt("sub_id") %></td>
            <td><%=rs.getString("sub_name") %></td>
            <td><%=rs.getInt("sem") %></td>
            <td><%=rs.getString("branch") %></td>
            <td><%=rs.getString("fname") %></td>
            <td><a href="EditCourses.jsp?sub_id=<%=rs.getInt("sub_id") %>"><button type="button" class="delete">Edit</button></a></td>
            <td><a href="DeleteCourses.jsp?sub_id=<%=rs.getInt("sub_id") %>"><button type="button" class="delete">Delete</button></a></td>
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
        
    </body>
</html>