<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> Student | Profile </title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
*{
box-sizing:border-box;
}
body{
ont-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
width:100%;
height:100%;
margin:0px;     /*edit this line in every page */
}
nav {
    background-color:rgb(17, 124, 143) ;
    overflow: hidden;
}
nav a {
    text-decoration: none;
    padding: 20px;
    text-align: center;
	border:1;
    float: left;
    color: white;
}
nav a:hover{
  background-color:white;
  color:rgb(17, 124, 143);
}
nav a.selected{
   background-color:white;
  color:rgb(17, 124, 143);   
  }
.right{
text-align:right;
float:right;
}
footer {
    background-color:rgb(17, 124, 143);
    overflow: hidden;
	bottom:0;
	width:100%;
}
.underline{
text-decoration:underline;
}
footer {
    background-color:rgb(17, 124, 143);
    overflow: hidden;
	position:absolute;
	bottom:0;
	width:100%;
}
footer a {
    text-decoration: none;
    padding: 20px;
    text-align: center;
    float: left;
    color: white;
}
footer a:hover{
  background-color:white;
  color:rgb(17, 124, 143);
  }
  footer a.active{
  background-color:white;
  color:rgb(17, 124, 143);
  }
  h1 {
  text-shadow: 2px 2px 5px red;
  padding:2px;
margin-left:15px;
}
a {

right:25px;
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
margin-right:25px;
text-align:right;
float:right;
  background-color: #f1f1f1;
  color: black;

}
tr,td{
margin-bottom:0;
margin-top:0px;
padding-bottom:0px;
padding-top:0px;
height:25px;
}
</style>
</head>
<body>
    <form method="Post">
<nav>
    <a class="selected" href="Student_profile.jsp"><i class="fa fa-user " aria-hidden="true"></i>  HOME</a>
    <a  href="Studymaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a  href="Video_student.jsp"><i class="fa fa-video-camera" aria-hidden="true"></i>  VIDEO</a>
    <a  href="doubts_student.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a  href="News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i> NEWS</a>
    <div class="right">
        <a href="Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="Student_login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>
<table width=100%>
<tr height="20px" >
<td>
    <%
        String subject=request.getParameter("subject_name");
        %>
        <span class=underline><h1><%=subject%> </h1></span>
</td>
<td >
<a href="studymaterial_student_new.jsp" class="previous">&laquo; Previous</a>
</td>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");   
Statement st= con.createStatement();

       if(subject!=null)
        { 
            
            ResultSet rs1=st.executeQuery("Select * from documents where sub_name='"+subject+"' ");
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

}
}catch(Exception e)
{
e.printStackTrace();
}
%>
</table>
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