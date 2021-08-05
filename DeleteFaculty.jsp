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
<%
try {
int no=Integer.parseInt(request.getParameter("fid"));
int sumcount=0;
Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement st=  c.createStatement();


int x=st.executeUpdate("delete from vc_faculty where fid="+no+" ");
                        if(x>0)
                        {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Faculty deleted successfully');");
                            out.println("location='Faculty.jsp';");
                            out.println("</script>");
                        }
                        else
                        {
                            out.print("<script>alert('Something went wrong.')</script>");
                        }
}
catch(Exception e){}
%>
   </body>
</html>