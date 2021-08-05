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
        <title>Admin | Delete Doubts</title>
        <link rel="stylesheet" href="style4.css" type="text/css" >
    </head>
    <body>     
        <%
try {
    
            int did=Integer.parseInt(request.getParameter("did"));
int sumcount=0;
Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
            
String query = "select * from doubts where d_id="+did+" ";
ResultSet rs = s.executeQuery(query);
        //  String sql=" Select sub_id from doubts where d_id="+did+" ";
  //  ResultSet rs=s.executeQuery(sql);
    rs.next();
        int sid=rs.getInt("sub_id");
         out.println(sid);
int x=s.executeUpdate("delete from doubts where d_id="+did+" ");
                        if(x>0)
                        {
                           response.sendRedirect("doubtsquestion_faculty.jsp?sub_id="+sid);
                           // out.println("<script type=\"text/javascript\">");
                           out.println("<script>alert('Doubts deleted successfully')</script>");
                           // out.println("location='Doubts.jsp';");
                           // out.println("</script>");
                        }
                        else
                        {
                            out.print("<script>alert('Something went wrong.')</script>");
                        }
}
catch(Exception e){}
%>

<%/*
try {
int no=Integer.parseInt(request.getParameter("sub_id"));
int sumcount=0;
Class.forName("com.mysql.jdbc.Driver");
            Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement s=  c.createStatement();
            int did=Integer.parseInt(request.getParameter("d_id"));
int x=s.executeUpdate("delete from doubts where d_id="+did+"  ");
                        if(x>0)
                        {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Subject deleted successfully');");
                            out.println("location='Doubts.jsp';");
                            out.println("</script>");
                        }
                        else
                        {
                            out.print("<script>alert('Something went wrong.')</script>");
                        }
}
catch(Exception e){}*/
%>
   </body>
</html>
