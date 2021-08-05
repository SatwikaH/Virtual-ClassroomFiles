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
<title>Faculty | Profile Edit</title>
<link rel="stylesheet" href="edit.css" type="text/css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
    function validate()
    {
        var pn=document.getElementById('pn').value;
        var password=document.getElementById('pass').value;
        var name=document.getElementById('f_name').value;
        var urREGX=/[A-Za-z]+\s/;
        var nameResult = urREGX.test(name);
        var pn=document.getElementById('pn').value;
var pnRGEX=/^((?!(0))[0-9]{10})$/;
var pnResult= pnRGEX.test(pn);
                if(pnResult == false)
		{
			alert('Enter valid phone number ');
			return false;
		}
        if(nameResult == false)
		{
			document.getElementById('f_name').style.backgroundColor='#FFFF99';
			alert('invalid Name');
			return false;
		}
        if(pn.length!=10)
        {
            alert('Phone number must be 10 digit long');
	    return false;
        }
        if(password.length <8)
        {
            document.getElementById('pass').style.backgroundColor='#FFFF99';
            alert('Password must be more or 8 charachters long ');
            return false;
        }
        return true;
		
    }
</script>
</head>
<body>
<%
String email=(String)session.getAttribute("email_id");
//String email="sk@gmail.com";
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");   
String sql="Select * from vc_faculty where email_id='"+email+"'";
Statement st= con.createStatement();
String e="",quest="",answ="";
ResultSet rs=st.executeQuery(sql);
rs=st.executeQuery(sql);
if(rs.next())
{
    e=rs.getString("email_id");
    quest=rs.getString("sec_ques");
    answ=rs.getString("sec_ans");
%>
<form method="Post" onchange="return validate()">
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
<div class="container">
<h1> Edit Profile </h1>
<hr>

<label for="email"><b>Name</b></label>
<input type="text" id="f_name" name="name" value="<%=rs.getString("fname")%>" placeholder="Enter name" required/> <br/>

<label for="email"><b>Phone Number</b></label>
<input type="text" id="pn" name="ph_no" value="<%=Long.parseLong(rs.getString("ph_no"))%>" placeholder="Enter phone number" required/> <br/>

<label for="email"><b>Password</b></label>
<input type=password id="pass" name="pass" value="<%=rs.getString("pass")%>" placeholder="Enter password" required/> <br/>

</hr>
<button type="submit" class="updatebtn" name="btnUpdate" value="Update">Update</button>
</div>
<%
}
try{
if(request.getParameter("btnUpdate")!=null)
{
String name_up=request.getParameter("name");
long phno_up=Long.parseLong(request.getParameter("ph_no"));
String pass_up=request.getParameter("pass");
String sql1="update vc_faculty set email_id=? ,fname=?, ph_no=? ,pass=? , sec_ques=? , sec_ans=? where email_id='"+email+"'";
PreparedStatement ps=con.prepareStatement(sql1);
ps.setString(1,e);
ps.setString(2,name_up);
ps.setLong(3,phno_up);
ps.setString(4,pass_up);
ps.setString(5,quest);
ps.setString(6,answ);
ps.executeUpdate();
if(ps.executeUpdate()>=1)
{
response.sendRedirect("Faculty_profile.jsp");
}
}
} catch (SQLException exx) {
exx.printStackTrace(response.getWriter());
}
rs.close();
st.close();
con.close();

} catch (Exception e) {
e.printStackTrace();
}
%>

</form>
</body>
</html>
