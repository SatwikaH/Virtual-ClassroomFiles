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
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
         <nav>
<a href="Faculty_profile.jsp"><i class="fa fa-home" aria-hidden="true"></i>HOME</a>
<a href="ViewStudent.jsp"><i class="fa fa-users" aria-hidden="true"></i>STUDENTS</a>
<a href="CStudyMaterial.jsp"><i class="fa fa-file-video-o" aria-hidden="true"></i>STUDY MATERIAL</a>
<a href="FacultyDoubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>DOUBTS</a>
<a href="FacultyNews.jsp"><i class="fa fa-bell" aria-hidden="true"></i>ANNOUNCEMENTS</a>
<div class="right">
<a href="ProfileEdit.jsp" align="right"><i class="fa fa-pencil " aria-hidden="true"></i> EDIT PROFILE </a>
<a href="main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
</div>
        </nav>
        
        <h2>All Announcements </h2>
        <table border="1">
        <tr>
        <th>Notice ID</th>
        <th>Notice</th>
        <th>Date of announcement</th>
        </tr>
        <%
            try{
                
            String email=(String)session.getAttribute("email_id");
            Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");   
Statement s= con.createStatement();
            String sql="select * from announcements";
            ResultSet rs= s.executeQuery(sql);
            while(rs.next())
            {
        %>   
            <tr>
            <td><%=rs.getString("n_id") %></td>
            <td><%=rs.getString("notice") %></td>
            <td><%=rs.getString("date") %></td>
            </tr>
        <%
            }
            rs.close();
            s.close();
            con.close();
            
            }
            catch(Exception e) {
            e.printStackTrace();
            }
        %>
        </table>
        
    </body>
</html>
