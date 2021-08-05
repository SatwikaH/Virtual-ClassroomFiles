<%@page language="java"%>
<%@page import="java.sql.*"%>
<html>
    <head>
     <title>Faculty | View Study Material</title>
        <link rel="stylesheet" href="reg_stud.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
    </head>
    <body>
<nav>
    <a href="Faculty_profile.jsp">HOME</a>
    <a href="UploadStudyMaterial.jsp">UPLOAD NEW LECTURE</a>
    <a href="#">VIDEO</a>
    <a href="FacultyDoubts.jsp">DOUBTS</a>
	<a href="FacultyNews.jsp">NEWS</a>
	<div class="right"><a href="ProfileEdit.jsp" align="right">EDIT PROFILE  <img src="D:\Image\editicon1.jpg" height=20px align="center" background="lightblue"></a>
	<a href="FacultyLogin.jsp">LOGOUT</a></div>
</nav>
       <form method="post">
<%
try {
int no=Integer.parseInt(request.getParameter("doc_id"));
int sumcount=0;
Class.forName("com.mysql.jdbc.Driver");  
Connection c=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");  
Statement st = c.createStatement();
String query = "select * from documents where doc_id="+no+" ";
ResultSet rs = st.executeQuery(query);
        //  String sql=" Select sub_id from doubts where d_id="+did+" ";
  //  ResultSet rs=s.executeQuery(sql);
    rs.next();
        int sid=rs.getInt("sub_id");
         out.println(sid);
int x=st.executeUpdate("delete from documents where doc_id="+no+" ");
                        if(x>0)
                        {
                            response.sendRedirect("View.jsp?sub_id="+sid);
                           // out.println("<script type=\"text/javascript\">");
                           out.println("<script>alert('Subject deleted successfully')</script>");
                         
                            //out.println("<script type=\"text/javascript\">");
                       // out.println("alert('Study Material deletd successfully');");
                       // out.println("location='CStudyMaterial.jsp';");
                       // out.println("</script>");
                        }
                        else
                        {
                            out.print("<script>alert('Something went wrong.')</script>");
                        }
}
catch(Exception e){}
%>
</table>
</form> 
        
    </body>
</html>
