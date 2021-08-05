<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  

<title>Admin | Edit Courses</title>
<link rel="stylesheet" href="style.css" type="text/css" >
</head>
<body>
<%
try{
int no=Integer.parseInt(request.getParameter("sub_id"));
int sumcount=0;
Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
            
String query = "select * from subj where sub_id="+no+"";
ResultSet rs=s.executeQuery(query);
if(rs.next())
{
%>
<form method="Post">
<nav>
        <a href="AdminHome.jsp"><i class="fa fa-home" aria-hidden="true"></i>HOME</a>
        <a href="Courses.jsp"><i class="fa fa-home" aria-hidden="true"></i>BACK</a>
        <div style="text-align:right;
             float:right;"><a href="main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></div>
</nav>

<div class="container">

<hr>
<label for="email"><b>Subject name</b></label>
<input type="text" name="Subject" value="<%=rs.getString("sub_name")%>" placeholder="Enter Subject name" required/> <br/>

<label for="email"><b>Semester</b></label>
<input type="text" name="Semester" value="<%=rs.getInt("sem")%>" placeholder="Enter Semester" required/> <br/>

<label for="email"><b>Branch</b></label>
<input type="text" name="Branch" value="<%=rs.getString("branch")%>" placeholder="Enter Branch" required/> <br/>

<label for="email"><b>Faculty name</b></label>
<input type="text" name="Faculty" value="<%=rs.getString("fname")%>" placeholder="Enter Faculty name" required/> <br/>
</hr>
<button type="submit" class="updatebtn" name="btnUpdate" value="Update">Update</button>
</div>
<%
}
try{
if(request.getParameter("btnUpdate")!=null)
{
String name_up=request.getParameter("Subject");
int sem_up=Integer.parseInt(request.getParameter("Semester"));
String branch_up=request.getParameter("Branch");
String f_up=request.getParameter("Faculty");
String sql1="update subj set sub_name=? ,sem=?,branch=? , fname=? where sub_id="+no+"";
PreparedStatement ps=c.prepareStatement(sql1);
ps.setString(1,name_up);
ps.setInt(2,sem_up);
ps.setString(3,branch_up);
ps.setString(4,f_up);
ps.executeUpdate();
if(ps.executeUpdate()>=1)
{
   out.println("<script type=\"text/javascript\">");
   out.println("alert('Subject is updated successfully');");
   out.println("location='Courses.jsp';");
   out.println("</script>");
}
}
} catch (SQLException exx) {
exx.printStackTrace(response.getWriter());
}
rs.close();
s.close();
c.close();

} catch (Exception e) {
e.printStackTrace();
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
