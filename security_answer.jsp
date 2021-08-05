<%-- 
    Document   : security_answer
    Created on : Apr 19, 2021, 7:58:24 PM
    Author     : user
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> Password Reset </title>
	<style>
	.container{
	width:35%;
	height:350px;
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
</head>
<body>
    <form method="Post">
	<h1 align="center"> Password Reset</h1>
	<hr style="width:100%;text-align:left;margin-left:0">
		<center>
	<div class="container">
	<h4> We found your account </h4>

<%
    try{
             String username=(String)session.getAttribute("email_id");
            Class.forName("com.mysql.jdbc.Driver");
            session.setAttribute("email",username);
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from student_register where email_id='"+username+"'");
            rs.next();
            out.println(rs.getString(2));
            %>
            <h4> Kindly enter the answer to the given security question you have entered while registering to the Classroom</h4></br>
            Question:
            <%
            out.print(rs.getString(8));
            %>
            </br> <input type="text" name="answer" placeholder="Enter answer" required/></br>
	<button class="button1" name="submitbtn"><span>Submit</span></button></br> </br>
	
	</div>
	</center>
<%
    try{
        if(request.getParameter("submitbtn")!=null)
        {
           String ans=request.getParameter("answer"); 
           if(rs.getString(9).equalsIgnoreCase(ans))
            {
                response.sendRedirect("password_set.jsp");
            }
            else
            {
                out.println("<script>alert('Wrong Answer')</script> ");
            }
        }
}catch (Exception e) {
        e.printStackTrace();
    }
    rs.close();
    st.close();
    con.close();
    }catch (Exception ex) {
        ex.printStackTrace();
    }
  %>       
    </form>
</body>
</html>