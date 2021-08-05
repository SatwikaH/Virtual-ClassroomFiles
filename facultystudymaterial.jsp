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
        <script language="javascript">
        function editRecord(id){
        var f=document.form;
        f.method="post";
        f.action='Check.jsp?sub_id='+id;
        f.submit();
        }
    </script>
</head>
<body>
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
<form method="post" name="form">
	<h2>Details of all Course</h2>
        <table border="1">
        <tr>
        <th>Select to upload new file</th>
        <th>Subject ID</th>    
        <th>Subject Name</th>
        <th>Semester</th>
        <th>Branch</th>
        <th>View uploaded files</th>
        </tr>
<%
  // String email=(String)session.getAttribute("email_id");
String email="sk@gmail.com";
   try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
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
            <td><input type="radio" name="name" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
            <td><%=rs.getString("sub_id") %></td>
            <td><%=rs.getString("sub_name") %></td>
            <td><%=rs.getString("sem") %></td>
            <td><%=rs.getString("branch") %></td>
            <td><a href="View.jsp?sub_id=<%=rs.getString("sub_id") %>"><button type="button" class="delete">View</button></a></td>
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
        

<footer>
        <a href="#">FAQ</a>
        <a href="#">Terms of Use</a>
        <a href="#">Privacy Policy</a>
        <a href="#">&copy; 2021</a>
    </footer>
</form>
</body>
</html>