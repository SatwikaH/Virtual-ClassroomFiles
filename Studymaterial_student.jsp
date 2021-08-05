<%-- 
    Document   : Studymaterial_student
    Created on : Apr 14, 2021, 9:57:19 PM
    Author     : user
--%>

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
	<title> Student | Study Material </title>
	<link href="Studymaterial_student.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form method="Post">
<nav>
    <a  href="Student_profile.jsp"><i class="fa fa-home  " aria-hidden="true"></i>  HOME</a>
    <a  class="selected" href="Studymaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a  href="Video_student.jsp"><i class="fa fa-video-camera" aria-hidden="true"></i>  VIDEO</a>
    <a  href="doubts_student.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a  href="News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i> NEWS</a>
    <div class="right">
        <a href="Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="Student_logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>


<span id="nav">

<%
   //String email=(String)session.getAttribute("email1");
   String email="shruti@gmail.com";
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
        
     <button type="submit" class="myBtn" name="subject<%=cou%>" value="<%=rs.getString("sub_name")%>"><%=rs.getString("sub_name")%></button>
      
<% }
rs.close();
%>

</span>
<%
    try{
       if(request.getParameter("subject1")!=null)
        { 
            String subject_name=arr[1];
            ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject_name+"'");
%>
<div class="table">
<table border=1 width=100% height=100%>
<tr>
<th> File Name </th>
<th> Download </th>
</tr>
<%
            while(rs1.next())
            {
 %>
<tr>
<td>
<% 
                String docs=rs1.getString("doc_name");
                out.println(docs );
%>
</td>
<td>
    
    <a href="file_download.jsp?docname=<%=rs1.getString("doc_name")%>" > DOWNLOAD </a>     
           
</td>
</tr>
<%
            }
            rs1.close();
%>
</table>
</div>
<%
        }
    }catch(Exception e1)
    {
        out.println("cant click button");
    }
    try{
        if(request.getParameter("subject2")!=null)
        {
          String subject_name=arr[2];
          ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject_name+"'");
                    
%>
    <div class="table">
<table border=1 width=100% height=100%>
<tr>
<th> File Name </th>
<th> Download </th>
</tr>
<%
            while(rs1.next())
            {
        
%>
<tr>
<td>
<% 
                out.println(rs1.getString("doc_name"));
%>
</td>
<td>
<a href="file_download.jsp?docname=<%=rs1.getString("doc_name")%>" > DOWNLOAD </a>  
</td>
</tr>
<%
            }
            rs1.close();
%>
</table>
</div>
<%
        }
    }catch(Exception e1)
    {
        out.println("cant click button");
    }
    try{
        if(request.getParameter("subject3")!=null)
        {
            String subject_name=arr[3];
            ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject_name+"'");
%>
    <div class="table">
<table border=1 width=100% height=100%>
<tr>
<th> File Name </th>
<th> Download </th>
</tr>
<%
            while(rs1.next())
            {
%>
<tr>
<td>
<% 
                out.println(rs1.getString("doc_name"));
%>
</td>
<td>
<a href="file_download.jsp?docname=<%=rs1.getString("doc_name")%>" > DOWNLOAD </a>  
</td>
</tr>
<%
            }
            rs1.close();
%>
</table>
</div>
<%
        }
    }catch(Exception e1)
    {
        out.println("cant click button");
    }
    try{
        if(request.getParameter("subject4")!=null)
        {
            String subject_name=arr[4];
            ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject_name+"'");
%>
    <div class="table">
<table border=1 width=100% height=100%>
<tr>
<th> File Name </th>
<th> Download </th>
</tr>
<%
            while(rs1.next())
            {
        
%>
<tr>
<td>
<% 
                out.println(rs1.getString("doc_name"));
%>
</td>
<td>
<a href="file_download.jsp?docname=<%=rs1.getString("doc_name")%>" > DOWNLOAD </a>  
</td>
</tr>
<%
            }
            rs1.close();
%>
</table>
</div>
<%
        }
    }catch(Exception e1)
    {
        out.println("cant click button");
    }
    try{
        if(request.getParameter("subject5")!=null)
        {
            String subject_name =arr[5];
            ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject_name+"'");
%>
    <div class="table">
<table border=1 width=100% height=100%>
<tr>
<th> File Name </th>
<th> Download </th>
</tr>
<%
            while(rs1.next())
            {
%>
<tr>
<td>
<% 
                out.println(rs1.getString("doc_name"));
%>
</td>
<td>
<a href="file_download.jsp?docname=<%=rs1.getString("doc_name")%>" > DOWNLOAD </a>  
</td>
</tr>
<%
            }
            rs1.close();
%>
</table>
</div>
<%
        }
    }catch(Exception e1)
    {
        out.println("cant click button");
    }
    try{
        if(request.getParameter("subject6")!=null)
        { 
            String subject_name=arr[6];
            ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject_name+"'");
%>
    <div class="table">
<table border=1 width=100% height=100%>
<tr>
<th> File Name </th>
<th> Download </th>
</tr>
<%
            while(rs1.next())
            {
%>
<tr>
<td>
<% 
                out.println(rs1.getString("doc_name"));
%>
</td>
<td>
<a href="file_download.jsp?docname=<%=rs1.getString("doc_name")%>" > DOWNLOAD </a>  
</td>
</tr>
<%
            }
            rs1.close();
%>
</table>
</div>
<%
        }
    }catch(Exception e1)
    {
        out.println("cant click button");
    }
    con.close();
    st.close();
}catch(Exception ex)
{
    ex.printStackTrace();
}
%>
<footer>
        <a href="#">FAQ</a>
        <a href="#">Terms of Use</a>
        <a href="#">Privacy Policy</a>
        <a href="#">&copy; 2021</a>
    </footer>
</form>
</body>
</html>

