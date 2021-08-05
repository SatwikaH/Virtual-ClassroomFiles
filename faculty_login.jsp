<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty | Login</title>
        <link rel="stylesheet" href="login_student.css" type="text/css" >
    </head>
    <body>
        <nav>
        <a href="#">Contact Us</a>
        <a href="#">Help</a>
        </nav>
        <main>
        <section>
            <h3>Faculty Login</h3>
            <center><h4>Enter valid credentials</h4></center>
			<center>
            <form  method="post">
                
                Email<input type="text" name="user_email" placeholder="enter username" required></br> </br>
                Password <input type="password" name="password" placeholder="enter password" required></br></br>
                <button class="button1" name="log_in" value="logged_in">Login</button></br> </br>
				If not Registered then <a href="Faculty_Registration.jsp">Register</a>  
              
<%
     try{
    if(request.getParameter("log_in")!=null)
    {
String user=request.getParameter("user_email");
String password=request.getParameter("password");
session.setAttribute("email_id",user);
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");   
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from vc_faculty where email_id='"+user+"' and pass='"+password+"'");

try{  
   rs.next();
        if(rs.getString("pass").equals(password) && rs.getString("email_id").equals(user))
        {
            response.sendRedirect("Faculty_profile.jsp");
        }
        else
        {
            out.print("<script>alert('Invalid password or username.')</script>");
        }
    
   }
catch (Exception e) {
e.printStackTrace();
}
    }
    }
catch (Exception e) {
e.printStackTrace();
}
%>


            </form>
			</center>
        </section>
    </main>
    <footer>
        <a href="#">FAQ</a>
        <a href="#">Terms of Use</a>
        <a href="#">Privacy Policy</a>
        <a href="#">&copy; 2021</a>
    </footer>
    </body>
</html>
