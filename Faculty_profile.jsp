<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
<title> Faculty | Profile </title>
<link href="Student_profile.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
</head>
<body>
<form method="Post">
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
<table height=100% width=100%>
<tr>
<td width=20% valign="top">
<div class="column1">
<img src="profile_2.png" height=120px width=130px>
<h3> Logged in as: </h3>
<%
String email=(String)session.getAttribute("email_id");
out.println("<h3>"+email+"</h3>");
%>
</div>
</td>
<td height=100% width=100%>
<div class=container>
<div class="cd">
<%
try{
Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
   String sql="Select fname from vc_faculty where email_id='"+email+"'";
Statement st= con.createStatement();
ResultSet rs=st.executeQuery(sql);
rs=st.executeQuery(sql);
rs.next();
out.println("<h4>"+"Name: "+rs.getString(1)+"</h4>");
st.close();
con.close();
}catch(Exception e ){
out.println("error in name");
System.out.println("error in name");
}
%>
</div>

<div class="cd1">
<%
try{
Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
   String sql="Select fname from vc_faculty where email_id='"+email+"'";
Statement st= con.createStatement();
ResultSet rs=st.executeQuery(sql);
rs=st.executeQuery("Select subj.sub_name,subj.branch,subj.sem from (vc_faculty join subj on vc_faculty.fname=subj.fname) where vc_faculty.email_id='"+email+"' order by subj.SUB_NAME");
int count=0;
while(rs.next())
{
count++;
%>
<center>
<table>
<tr>

<td>
<%
out.print("<h5>"+"Subject "+count+":</h5>");

%>
</td>
<td>
<%
out.print("<h5>"+rs.getString("sub_name")+"   Semester:  " +rs.getString("sem")+ "   Branch:  " +rs.getString("branch")+"</h5>");
%>
</td>
</h4>
</tr>
</table>
</center>
<%
}
st.close();
con.close();
rs.close();
}catch(Exception e ){
out.println("error in subject");
System.out.println("error in subject");
}

%>
</div>
<div class="cd">
<%
try{
Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
   String sql="Select fname from vc_faculty where email_id='"+email+"'";
Statement st= con.createStatement();
ResultSet rs=st.executeQuery(sql);
rs=st.executeQuery("Select ph_no from vc_faculty where email_id='"+email+"'");
rs.next();
out.println("<h4>"+"Phone Number: "+rs.getString(1)+"</h4>");
st.close();
con.close();
rs.close();
}catch(Exception e ){
out.println("error in phone number");
System.out.println("error in phone number");
}
%>
</div>
</div>
</td>
</tr>

</table>
</form>
</body>
</html>


