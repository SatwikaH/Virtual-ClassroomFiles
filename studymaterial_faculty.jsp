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
	<link href="Studymaterial_student.css" type="text/css" rel="stylesheet">
       
</head>
<body>
    <form method="Post">
<nav>
    <a href="Faculty_profile.jsp">HOME</a>
    <a href="UploadStudyMaterial.jsp">UPLOAD NEW LECTURE</a>
    <a href="#">VIDEO</a>
    <a href="FacultyDoubts.jsp">DOUBTS</a>
	<a href="FacultyNews.jsp">NEWS</a>
	<div class="right"><a href="ProfileEdit.jsp" align="right">EDIT PROFILE  <img src="D:\Image\editicon1.jpg" height=20px align="center" background="lightblue"></a>
	<a href="FacultyLogin.jsp">LOGOUT</a></div>
</nav>
<div id="nav">

<%
   String email=(String)session.getAttribute("email_id");

   try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    String sql="Select * from vc_faculty where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    rs.next();
    rs=st.executeQuery("Select subj.sub_name,subj.branch,subj.sem from (vc_faculty join subj on vc_faculty.fname=subj.fname) where vc_faculty.email_id='"+email+"' order by subj.branch");
    int cou=0;
    String arr[]=new String[8];
    while(rs.next())
    {
        cou++;
        arr[cou]=rs.getString("sub_name");
%>
 <button type="submit" class="myBtn" name="subject<%=cou%>" value="<%=rs.getString("sub_name")%>"><%=rs.getString("sub_name")%><%=rs.getString("sem")%><%=rs.getString("branch")%></button>
 <% } %>

</div>
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
<th> File Path </th>
</tr>
<%
    while(rs1.next())
    {
 %>
<tr>
<td><%=rs1.getString("doc_name") %></td>
<td><%=rs1.getString("doc_path") %></td>
</tr>
<%
}
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
<th> File Path </th>
</tr>
<%
    while(rs1.next())
    {
        
%>
<tr>
<td><%=rs1.getString("doc_name") %></td>
<td><%=rs1.getString("doc_path") %></td>
</tr>
<%
}
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
<th> File Path </th>
</tr>
<%
    while(rs1.next())
    {
%>
<tr>
<td><%=rs1.getString("doc_name") %></td>
<td><%=rs1.getString("doc_path") %></td>
</tr>
<%
}
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
<th> File Path </th>
</tr>
<%
    while(rs1.next())
    {
        
%>
<tr>
<td><%=rs1.getString("doc_name") %></td>
<td><%=rs1.getString("doc_path") %></td>
</tr>
<%
}
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
<th> File Path </th>
</tr>
<%
    while(rs1.next())
    {
%>
<tr>
<td><%=rs1.getString("doc_name") %></td>
<td><%=rs1.getString("doc_path") %></td>
</tr>
<%
}
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
<th> File Path </th>
</tr>
<%
    while(rs1.next())
    {
%>
<tr>
<td><%=rs1.getString("doc_name") %></td>
<td><%=rs1.getString("doc_path") %></td>
</tr>
<%
}
%>
</table>
</div>
<%
  }
}catch(Exception e1)
{
out.println("cant click button");
}
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

