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
        <title>Admin | Add New Announcement</title>
        <link rel="stylesheet" href="style.css" type="text/css" >
    </head>
    <body>
	<center>
	
            <form  method="Post">
		<center>
                    <h1>ADD NEW ANNOUNCEMENTS</h1>
                    <p>Enter the required details</p>
                    <hr>
			<label for="email"><b>Notice</b></label>
			<input type="text" name="notice" placeholder="Enter new notice" required/> <br/>
                        
                    </hr>
                    <button type="submit" class="registerbtn" name="btnInsert" value="Insert">Add</button>
                </center>
                        
                <%
                
            String pass1=(String)session.getAttribute("password1");
                    if(request.getParameter("btnInsert")!=null)
                    {
                        String n=request.getParameter("notice");                
                        Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
             try{
                   
             
                     java.util.Date now = new java.util.Date();
                        String DATE_FORMAT = "yyyy-MM-dd";
                        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
                        String strDateNew = sdf.format(now) ;
                        Statement s= c.createStatement();
                        int x=s.executeUpdate("insert into announcements( notice,date) values ('"+n+"','"+strDateNew+"')");
                        if(x>0)
                            out.println("data inserted sucessfully");
                        s.close();
                        if(n.isEmpty() )
                        {
                            response.sendRedirect("AddNewsAnnouncements.jsp");
                        }
                        else
                        {
                            response.sendRedirect("Announcements.jsp");
                        }
                    
                } 
                catch (SQLException exx)
                {
                    exx.printStackTrace();
                    out.println("something wrong");
                }   
}
%>
        </form>
	</center>
   </body>
</html>
