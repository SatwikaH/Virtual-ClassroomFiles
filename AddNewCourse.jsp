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
        <title>Admin | Add New Course</title>
        <link rel="stylesheet" href="style.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
	<center>
	
            <form  method="Post">
		<center>
                    <h1>ADD NEW COURSE</h1>
                    <p>Enter the required details</p>
                    <hr>
			<label for="email"><b>Subject name</b></label>
			<input type="text" name="subject name" placeholder="Enter subject name" required/> <br/>
                        <label for="email"><b>Semester</b></label>
			<input type="text" name="Semester" placeholder="Enter Semester" required/> <br/>
                        <label for="email"><b>Branch</b></label>
			<input type="text" name="Branch" placeholder="Enter Branch" required/> <br/>
                        <label for="email"><b>Faculty name</b></label>
			<input type="text" name="Faculty name" placeholder="Enter Faculty name" required/> <br/>
                    </hr>
                    <button type="submit" class="registerbtn" name="btnInsert" value="Insert">Add</button>
                </center>
                        
                <%
                String pass1=(String)session.getAttribute("password1");
                try{
                    if(request.getParameter("btnInsert")!=null)
                    {
                        String n=request.getParameter("subject name"); 
                        int se=Integer.parseInt(request.getParameter("Semester"));
                        String b=request.getParameter("Branch");
                        String f=request.getParameter("Faculty name");
                        Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
            
                        int x=s.executeUpdate("insert into subj(sub_name,sem,branch,fname) values ('"+n+"',"+se+",'"+b+"','"+f+"')");
                        if(x>0)
                        {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('New subject added successfully');");
                        out.println("location='Courses.jsp';");
                        out.println("</script>");    
                        }
                        s.close();
                        if(n.isEmpty() ||b.isEmpty() || f.isEmpty()|| se==0)
                        {
                            RequestDispatcher req = request.getRequestDispatcher("AddNewCourse.jsp");
                            req.include(request, response);
                        }
                    }
                } 
                catch (SQLException exx)
                {
                    exx.printStackTrace();
                    out.println("something wrong");
                }           
%>
        </form>
	</center>
   </body>
</html>

