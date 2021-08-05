<%@page import="java.text.SimpleDateFormat"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Delete Student</title>
        <link rel="stylesheet" href="style4.css" type="text/css" >
    </head>
    <body>
	<center>
	
            <form  method="Post">
		<center>
                    <h1>Delete Registered Members</h1>
                    <p>Enter Email-id of member you want to remove</p>
                    <hr>
                    Email<input type="text" name="user_email" placeholder="enter email id " required></br> </br>

                    </hr>
                    <button type="submit" name="btnDelete" value="Delete">Delete</button>
                </center>
                        
                <%
                String pass1=(String)session.getAttribute("password1");
                try{
                    if(request.getParameter("btnDelete")!=null)
                    {
                        String e=request.getParameter("user_email");  
                        out.println(e);
                        Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
             Statement s= c.createStatement();
                            int x=s.executeUpdate("delete from student_register where email_id='"+e+"'");
                        if(x>0)
                        {
                            out.println("data deleted sucessfully");
                            response.sendRedirect("Student.jsp");
                        }
                        else
                        {
                            out.print("<script>alert('Something went wrong.')</script>");
                        }
                    }
                } 
                catch (Exception e)
                {
                    e.printStackTrace();
                    
                }           
            %>
        </form>
	</center>
   </body>
</html>

