
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login</title>
        <link rel="stylesheet" href="login_student.css" type="text/css" >
    </head>
    <body>
        <nav>
        <a class="selected" href="VC_Student_login.jsp"> Student Login </a>
        <a href="#"  style="text-align:right;
float:right;">Contact Us-<span style="color: cyan">9987643456</span> </a>
        </nav>
        <main style="background-image: url(login_6.jpg)">
        <section>
            <h3>Student Login</h3>
            <center><h4>Enter valid credentials</h4></center>
	    <center>
            <form  method="post">
               Email&nbsp; &nbsp; &nbsp; &nbsp;
               <input type="text" name="user_email" placeholder="enter username"  align="middle" required></br> </br>
               Password&nbsp;
               <input type="password" name="password"  placeholder="enter password" align="middle" required></br></br>
                  
                <button class="button1" name="log_in" value="logged_in">Login</button></br> </br>
                <a href="forgot_password.jsp">Forgot Password?</a></br></br>
                If not Registered then <a href="VC_Student_Registration.jsp">Register</a> </br>
<%
    try{
        if(request.getParameter("log_in")!=null)
        {
            String username=request.getParameter("user_email");
            String password=request.getParameter("password");
            session.setAttribute("email1",username);
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from student_register where email_id='"+username+"' and pass='"+password+"'");
         
            try{  
                if(rs.next())
                {
                    if(rs.getString("pass").equalsIgnoreCase(password) && rs.getString("email_id").equalsIgnoreCase(username) && rs.getInt("status")==1)
                    {
                        response.sendRedirect("VC_Student_profile.jsp");
                    }
                    else if(rs.getInt("status")!=1)
                    {
                        out.println("<script> alert('You cannot login until you are verified by admin')</script>");
                    }
                }
                else
                {
                    out.print("<span>Invalid password or username</span>");
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
            
            st.close();
            con.close();
            rs.close();
        }
    }catch (Exception e) {
        e.printStackTrace();
    }
%>
</br>
</br>
            </form>
            </center>
        </section>
    </main>
    <footer>
        <a href="TermsOfUse.jsp">Terms of Use</a>
        <a href="PrivacyPolicy.jsp">Privacy Policy</a>
        <a href="#">&copy; 2021</a>
    </footer>
    </body>
</html>
