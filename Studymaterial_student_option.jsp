<%-- 
    Document   : Studymaterial_student_option
    Created on : May 8, 2021, 2:41:25 PM
    Author     : user
--%>
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
	<title> Student | Profile </title>
	<link href="Student_profile.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form method="Post">
<nav>
    <a class="selected" href="Student_profile.jsp">HOME</a>
    <a  href="Studymaterial_student.jsp">STUDY MATERIAL</a>
    <a  href="Video_student.jsp">VIDEO</a>
    <a  href="doubts_student.jsp">DOUBTS</a>
    <a  href="News.jsp">NEWS</a>
    <div class="right">
        <a href="Profile_edit.jsp" align="right">EDIT PROFILE  <img src="editicon1.jpg" height=20px align="center" background="lightblue"></a>
        <a  href="Student_login.jsp">LOGOUT</a>
    </div>
</nav>
<div class=container1>
<%
   String email=(String)session.getAttribute("email1");
   try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    String sql="Select * from student_register where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    rs.next();
    String bra_nch=rs.getString("branch");
    String semester=rs.getString("sem");
    rs=st.executeQuery("Select subj.sub_name from (student_register join subj on student_register.sem=subj.sem and student_register.branch=subj.branch) where student_register.email_id='"+email+"' order by subj.SUB_NAME");
    int cou=0;
    String arr[]=new String[8];
    while(rs.next())
    {
        cou++;
        arr[cou]=rs.getString("sub_name");
%>
<div>  
    <%=cou%>
     <!-- <button type="submit" class="myBtn" name="subject<%=cou%>" value="<%=rs.getString("sub_name")%>"><%=rs.getString("sub_name")%></button>-->
</div>
<% }
rs.close();
}catch(Exception ex)
{
ex.printStackTrace();
}
%>
</div>
<footer>
        <a href="#">FAQ</a>
        <a href="#">Terms of Use</a>
        <a href="#">Privacy Policy</a>
        <a href="#">&copy; 2021</a>
    </footer>
    </form>
</body>
</html>
