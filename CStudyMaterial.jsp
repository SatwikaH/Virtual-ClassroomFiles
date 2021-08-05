<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
	<title> Faculty | Study Material </title>
	<link href="reg_stud.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </script>
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
<form method="post" name="form">
	<h2>Details of all Course</h2>
        <table border="1">
        <tr>
        <th>Subject ID</th>    
        <th>Subject Name</th>
        <th>Semester</th>
        <th>Branch</th>
        <th>View uploaded files</th>
        <th>Upload New Material</th>
        </tr>
<%
   String email=(String)session.getAttribute("email_id");

   try{
    Class.forName("com.mysql.jdbc.Driver");    
    Connection con=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");      
String sql="Select * from vc_faculty where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    rs.next();
    rs=st.executeQuery("Select subj.sub_id,subj.sub_name,subj.branch,subj.sem from (vc_faculty join subj on vc_faculty.fname=subj.fname) where vc_faculty.email_id='"+email+"' order by subj.branch");
    int cou=0;
    String arr[]=new String[8];
    while(rs.next())
    {
        cou++;
        arr[cou]=rs.getString("sub_name");
%>
<center>
            <tr>
            <td><%=rs.getString("sub_id") %></td>
            <td><%=rs.getString("sub_name") %></td>
            <td><%=rs.getString("sem") %></td>
            <td><%=rs.getString("branch") %></td>
            <td><a href="View.jsp?sub_id=<%=rs.getString("sub_id") %>"><button type="button" class="delete">View</button></a></td>
            <td><a href="Check.jsp?sub_id=<%=rs.getString("sub_id") %>"><button type="button" class="delete">Upload</button></a></td>
            </tr>
<%
            }
            rs.close();
            st.close();
            con.close();
            
            }
            catch(Exception e) {
            e.printStackTrace();
            }
        %>
</table>
        </center>

</form>
</div>
        

</form>
</body>
</html>
