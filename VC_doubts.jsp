
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
	<link href="reg_stud.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <script language="javascript">
        function editRecord(id){
        var f=document.form;
        f.method="post";
        f.action='viewstudymaterial.jsp?sub_id='+id;
        f.submit();
        }
    </script>
</head>
<body>
    <form method="Post">
<nav>
    <a  href="VC_Student_profile.jsp"><i class="fa fa-home " aria-hidden="true"></i>  HOME</a>
    <a  href="VC_StudyMaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a  class="selected" href="VC_doubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a  href="VC_News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i>ANNOUNCEMENTS</a>
    <div class="right">
        <a href="VC_Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="VC_Student_logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>
        <div id="nav">
<form method="post" name="form">
	<h2>Details of all Course</h2>
        <table border="1">
        <tr>
        <th>Subject ID</th>    
        <th>Subject Name</th>
        <th>View Doubts</th>
        </tr>

<%
 String email=(String)session.getAttribute("email1");
   //String email="shruti@gmail.com";
   session.setAttribute("email_1",email);
   try{
       Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
     try{
    String sql="Select * from student_register where email_id='"+email+"' ";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    rs.next();
   
    rs=st.executeQuery("Select subj.sub_id,subj.sub_name from (student_register join subj on student_register.sem=subj.sem and student_register.branch=subj.branch) where student_register.email_id='"+email+"' order by subj.sub_id");
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
            <td><a href="doubtsquestion.jsp?sub_id=<%=rs.getString("sub_id") %>"><button type="button" class="delete">View</button></a></td>
            </tr>
<%
            }

            rs.close();
            st.close();
            con.close();
            }catch(Exception ep) {
out.println("error11");
            }
            }
            catch(Exception e) {
            e.printStackTrace();
out.println("error");
            }
        %>
</table>
        </center>

</form>
</div> 
</form>
</body>
</html>