<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<html>
    <head>
        <title>Faculty | Upload New Lecture</title>
        <link rel="stylesheet" href="reg_stud.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .bg{
                background-color: lightblue;
                padding:50px;
              margin-left:400px;
              margin-right: 400px;
              border-color: black;
                border-radius: 20px;
            }
        </style>
    </head>
    
    <body>
    <nav>
<a href="Faculty_profile.jsp"><i class="fa fa-home" aria-hidden="true"></i>HOME</a>
<a href="ViewStudent.jsp"><i class="fa fa-users" aria-hidden="true"></i>STUDENTS</a>
<a href="CStudyMaterial.jsp"><i class="fa fa-file-video-o" aria-hidden="true"></i>STUDY MATERIAL</a>
<a href="FacultyDoubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>DOUBTS</a>
<a href="FacultyNews.jsp"><i class="fa fa-bell" aria-hidden="true"></i>ANNOUNCEMENTS</a>
<div class="right">
<a href="ProfileEdit.jsp" align="right"><i class="fa fa-pencil " aria-hidden="true"></i> EDIT PROFILE </a>
<a href="Main.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
</div>
        </nav><br><br/><br><br/><br><br/>
    <center>
        <div class="bg">
    <form method="Post" enctype="multipart/form-data">
    <% try{
        String email=(String)session.getAttribute("email_id");
        Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    String sql="Select * from vc_faculty where email_id='"+email+"'";
        Statement st= con.createStatement();
        ResultSet rs=st.executeQuery(sql);  
        String subname="";
  
while(rs.next()){
        %>
      
        <input type="file" name="file" /><span></span><br><br/>
    <input type="submit" name="upload" value="Upload" />
    
    </form> </div> </center>
    <script>
    let input=document.querySelector('input');
    let span=document.querySelector('span');
    input.addEventListener('change',() =>
    {
        let files=input.files;
        if(files.length>0)
        {
            if(files[0].size>52428800) 
            {
                span.innerText='File size exceeds. Must be less than 50 MB';
                return;
            }
        }
    }
    )
    
    </script>
<%
      int no=Integer.parseInt(request.getParameter("sub_id"));
       
int sumcount=0;
   File file ;
   int maxFileSize = 52428800;
   int maxMemSize =52428800;
   String filePath = "c:/apache-tomcat/webapps/data/";
   String contentType = request.getContentType();
   try{
        if ((contentType.indexOf("multipart/form-data") >= 0))
        {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("c:\\temp"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
        try{ 
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            out.println("<html>");
            out.println("<body>");
            while ( i.hasNext () ) 
            {
               FileItem fi = (FileItem)i.next();
               if ( !fi.isFormField () ) 
               {
                   String fieldName = fi.getFieldName();
                   String fileName = fi.getName();
                   boolean isInMemory = fi.isInMemory();
                   long sizeInBytes = fi.getSize();
                   file = new File( filePath + fileName ) ;
                   String fp=filePath.concat(fileName);
                   String fname=fileName.substring(0,fileName.indexOf("."));
                 
                   fi.write( file ) ;
                    
                  String ext=fileName.substring(fileName.indexOf(".")+1);
                   if(!(ext.equals("css") ||ext.equals("js") ||ext.equals("png") ||ext.equals("jpg") ||ext.equals("jpeg") ||ext.equals("txt") ||ext.equals("ppt")||ext.equals("pptx") ||ext.equals("docx") ||ext.equals("pdf") ||ext.equals("mp4")))
                        out.println("<script>alert('This file is not supported')</script>");
                   else{
                   int x=st.executeUpdate("insert into documents(doc_name,doc_path,sub_id) values('"+fname+"','"+fp+"',"+no+")");
                   if(x>0)
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('File uploaded successfully');");
                        out.println("location='CStudyMaterial.jsp';");
                        out.println("</script>");
                    }
                           }
                 
            }
            out.println("</body>");
            out.println("</html>");
      }
   }
        catch(Exception ex) 
   {
         System.out.println(ex);
   }
     
   }
         else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
      }    
   }
   catch(Exception ex) 
   {
         System.out.println(ex);
   }
   }
   }
catch(Exception ex) 
   {
         System.out.println(ex);
   }

%>

</body>  
</html>                                                                                                                                                                           