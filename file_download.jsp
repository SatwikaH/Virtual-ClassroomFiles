<%-- 
    Document   : file_download
    Created on : Apr 14, 2021, 10:00:00 PM
    Author     : user
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.activation.MimetypesFileTypeMap"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
        <title> Download page </title>
    </head>
    <body>
        <form method="post" >
        </form>
    </body>
</html>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    String docname=request.getParameter("docname");
    String sql="Select * from documents where doc_name='"+docname+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql); 
    rs.next();
    int BUFFER_SIZE1 = 52428000;
    String UPLOAD_DIR = "uploadedFiles";
    String filepath= rs.getString("doc_path");
    File file = new File(filepath);
    OutputStream outStream = null;
    FileInputStream inputStream = null;
    if (file.exists()) 
    {
        String mimeType = "application/octet-stream";
        response.setContentType(mimeType);
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
        response.setHeader(headerKey, headerValue);
        try {
            outStream = response.getOutputStream();
            inputStream = new FileInputStream(file);
            byte[] buffer = new byte[BUFFER_SIZE1];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                   outStream.write(buffer, 0, bytesRead);
            }               
            } catch(IOException ioExObj) {
                System.out.println("Exception While Performing The I/O Operation?= " + ioExObj.getMessage());
            } finally {             
                if (inputStream != null) {
                    inputStream.close();
            }
            outStream.flush();
            if (outStream != null) {
                outStream.close();
             }
            }
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<h3>File Is Not Present .....!</h3>");
    }
    rs.close();
    st.close();
    con.close();
 %>

