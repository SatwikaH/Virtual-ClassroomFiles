<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> Student | Profile </title>
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
.cont{
padding:30px;
height:100px;
width:300px;
background-color:orange;
color:BLACK;
font-weight:500;
font-size:25px;
margin:30px;
margin-bottom:0px;
margin-top:0px;
padding:2px;
text-align:center;
  text-align: center;
  line-height: 50px;
  
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
.cont:hover {background-color: #999900}
.cont:active {
  background-color: #999900;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.container1{
display:flex;
flex-wrap:wrap;
align-content:space-around;
flex-direction:row;
justify-content:space-around;
width:100%;
height:540px;
}
.myBtn{
    background-color: orange;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 10%;
  opacity: 0.9;
}
.myBtn:active{
    opacity:1;
    color:orange;
    background-color: white;
}
.myBtn:hover {
  opacity: 1;
}
.right{
text-align:right;
float:right;
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
</style>
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
        <a href="Profile_edit.jsp" align="right">EDIT PROFILE  </a>
        <a  href="Student_login.jsp">LOGOUT</a>
    </div>
</nav>
<div class=container1>
    
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
    <button type="submit" class="cont"> <a href="studymaterial_option.jsp?subject_name=<%=arr[cou]%>"> <%=arr[cou]%></a></button>
       
        <%
      
}
rs.close();
st.close();
con.close();
}catch(Exception e)
{
    e.printStackTrace();
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