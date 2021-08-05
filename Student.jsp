<%@ page import="java.sql.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Registered Students</title>
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
	<h2>Details of all Registered Students</h2>
        <table border="1">
        <tr>
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Email-id</th>
        <th>Contact details</th>
        <th>Semester</th>
        <th>Branch</th>
        <th>Delete</th>
        <th>Verify</th>
        </tr>
        <%
            String pass1=(String)session.getAttribute("password1");
            try{    
                
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();

            String sql="select * from student_register";
            ResultSet rs= s.executeQuery(sql);
            while(rs.next())
            {
        %> 
        <center>
            <tr>
            <td><%=rs.getInt("s_id") %></td>
            <td><%=rs.getString("s_name") %></td>
            <td><%=rs.getString("email_id") %></td>
            <td><%=rs.getLong("ph_no") %></td>
            <td><%=rs.getInt("sem") %></td>
            <td><%=rs.getString("branch") %></td>
            <td><a href="update.jsp?sid=<%=rs.getInt("s_id") %>"><button type="button" class="delete">Delete</button></a></td>
            <td><a href="verifyStudent.jsp?sid=<%=rs.getInt("s_id") %>"><button type="button" class="delete">Verify</button></a></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>
</body>
</html>
