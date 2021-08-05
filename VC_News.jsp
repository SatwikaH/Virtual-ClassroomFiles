
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
        <title>Virtual Classroom | Announcements</title>
        <link rel="stylesheet" href="reg_stud.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
    <nav>
    <a  href="VC_Student_profile.jsp"><i class="fa fa-home  " aria-hidden="true"></i>  HOME</a>
    <a   href="VC_StudyMaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a   href="VC_doubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a  class="selected" href="VC_News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i> ANNOUNCEMENTS</a>
    <div class="right">
        <a href="VC_Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="VC_Student_logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>
    
        <h2> Announcements </h2>
        <div id="table1">
        <center>
        <table  width="75%">
            <tr>
                <th>Notice ID</th>
                <th>Notice</th>
                <th>Date of announcement</th>
             </tr>
<%
            try{
            String email=(String)session.getAttribute("email1");
            //String email="shruti@gmail.com";
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            Statement s= c.createStatement();
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
            c.close();
           
            }
            catch(Exception e) {
            e.printStackTrace();
            }
        %>
        </table>
        <div class="imag"></div>
        </center>
        </div>
       
    </body>
</html>

