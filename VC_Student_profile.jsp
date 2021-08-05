

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form method="Post">
<nav>
    <a class="selected" href="VC_Student_profile.jsp"><i class="fa fa-home " aria-hidden="true"></i>  HOME</a>
    <a  href="VC_StudyMaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a  href="VC_doubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a  href="VC_News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i> ANNOUNCEMENTS</a>
    <div class="right">
        <a href="VC_Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="VC_Student_logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>
<table  height=100% width=100%>
<tr>
<td width=20% valign="top">
<div class="column1">
<img src="profile_2.png" height=120px width=130px>
<h3> Logged in as: </h3>
<% 
    //String email="shruti@gmail.com";
   String email=(String)session.getAttribute("email1");
  //  String email=(String)session.getAttribute("email1");
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
    String sql="Select * from student_register where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    if(rs.next())
    {
    out.println("<h4>"+"Name: "+rs.getString(4)+"</h4>");
   
%>
  </div>
<div class="cd"> 
<%
    
    out.println("<h4>"+"Branch: "+rs.getString(7)+"</h4>"); 
%>
</div>
<div class="cd"> 
<%
    out.println("<h4>"+"Semester: "+rs.getInt(6)+"</h4>");
    st.close();
    con.close();
    rs.close();
    }
    }catch(Exception e ){
        out.println("error in semester");
        System.out.println("error in semester");
    }
%>
</div>
<div class="cd1"> 
<%
    try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    String sql="Select s_name from student_register where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery("Select subj.sub_name from (student_register join subj on student_register.sem=subj.sem and student_register.branch=subj.branch) where student_register.email_id='"+email+"' order by subj.SUB_NAME");
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
                    out.print("<h5>"+rs.getString("sub_name")+"</h5>");
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
    String sql="Select s_name from student_register where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery("Select ph_no from student_register where email_id='"+email+"'");
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

