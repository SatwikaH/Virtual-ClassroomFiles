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
        <title>Admin | Home</title>
        <link rel="stylesheet" href="admin.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body >
    <nav>
        <a href="Student.jsp"><i class="fa fa-users" aria-hidden="true"></i>Students</a>
        <a href="Faculty.jsp"><i class="fa fa-users" aria-hidden="true"></i>Faculties</a>
        <a href="Courses.jsp"><i class="fa fa-book" aria-hidden="true"></i>Courses</a>
        <a href="Doubts.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Doubts</a>
        <a href="Announcements.jsp"><i class="fa fa-bell" aria-hidden="true"></i>Announcements</a>
        <div style="text-align:right;
float:right;"><a href="main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></div>
    </nav>
    <main >   
            <center><h1>Welcome to VIRTUAL CLASSROOM Admin</h1></center>
           <% String pass1=(String)session.getAttribute("password1");%>
            <img src="login_3.jpg">
             </main>
    </body>
</html>