<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 
<!DOCTYPE html>
<html>
    <head>
        <title>Virtual Classroom | Home</title>
        <link rel="stylesheet" href="login_student.css" type="text/css" >
    </head>
    <body>
    <nav>
        <a href="VC_Student_login.jsp">Student Login</a>
        <a href="FacultyLogin.jsp">Faculty Login</a>
        <a href="#" style="text-align:right;
float:right;">Contact Us-<span style="color: cyan">9987643456</span> </a>
    </nav>
    <main style="background-image: url(login_6.jpg)">
        <section>
                <h3>Admin Login</h3><br/>
            <center><h4>Enter valid credentials</h4></center><br/>
            <form method="Post">
                <center>
                <input type="password" name="password1" placeholder="enter password" required><br/><br/>
                <button class="button1" name="btnlogin" value="login"><span>Login</span></button>
                </center>
        <%
            if(request.getParameter("btnlogin")!=null)
            {
            
            try{
            String user=request.getParameter("password1");
            session.setAttribute("password",user); 
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s =  con.createStatement();
          String pass1=request.getParameter("password1");
            
            String sql="select pass from admin";
            ResultSet rs= s.executeQuery(sql);
            rs.next();
            //out.println(pass1); 
            //out.println("from data"+rs.getString(1));
            if( (!pass1.isEmpty()) && rs.getString(1).equalsIgnoreCase(pass1) )
            {
                response.sendRedirect("AdminHome.jsp");
            }
            else
            {
                out.print("<script>alert('Try with correct password.')</script>");
            }
            rs.close();
            s.close();
            con.close();
            
            }
            catch(Exception e) {
            e.printStackTrace();
            }
            }
        %>
            </form>
        </section>
    </main>
    <footer>
        <a href="TermsOfUse.jsp">Terms of Use</a>
        <a href="PrivacyPolicy.jsp">Privacy Policy</a>
        <a href="#">&copy; 2021</a>
    </footer>
    </body>
</html>
