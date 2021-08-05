<%-- 
    Document   : password_set
    Created on : Apr 19, 2021, 7:58:42 PM
    Author     : user
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> Password Reset </title>
	<style>
	.container{
	width:30%;
	height:400px;
	border:solid;
	border-width:1px;
	border-color:blue;
	box-shadow:3px 2px 2px 3px #808080;
	}
	input[type=text], input[type=password], input[type=number]{
  width: 50%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
h1{
color:black;
text-shadow:-1px 0 blue, 0 1px blue , 1px 0 blue,0 -1px blue;
}
.button1 {
  background-color: dodgerblue;
  color: white;
  padding: 12px 15px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 25%;
  opacity: 0.9;
}

.button1:hover {
  opacity: 1;
}
	</style>
        <script>
		function validate(){
                var password=document.getElementById('pass').value;
		var c_password=document.getElementById('c_pass').value;
                if(password.length <8)
                {
                        alert('Password must be more or 8 charachters long ');
			return false;
                }
                if(password !== c_password)
		{
			alert('password does not match ');
			return false;
		}
                return true;
		}
	</script>
</head>
<body>
    <form method="Post" onsubmit="return validate()">
	<h1 align="center"> Password Reset</h1>
	<hr style="width:100%;text-align:left;margin-left:0">
		<center>
	<div class="container">
	<h4> Enter New Password</h4>
	<h5>Password</h5>
	<input type="password" id="pass" name="password" placeholder="Enter password" required/></br>
	<h5>Re-type Passsword</h5>
	<input type="password" id="c_pass"  name="c_password" placeholder="Enter password" required/></br>
	<button class="button1" name="submitbtn"><span>Submit</span></button></br> </br>
	
	</div>
	</center>
<%
    try{
        if(request.getParameter("submitbtn")!=null)
        {
            String pass=request.getParameter("password");
            String user=(String)session.getAttribute("email");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            Statement st= con.createStatement();
            String sql1="update student_register set pass=? where email_id='"+user+"'";
            PreparedStatement ps=con.prepareStatement(sql1);
            ps.setString(1,pass);
            if(ps.executeUpdate()>0)
            {
                response.sendRedirect("VC_Student_login.jsp");
            }
        }
}catch (Exception e) {
        e.printStackTrace();
    }
  %>      
    </form>
</body>
</html>