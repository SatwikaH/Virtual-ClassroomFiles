<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
	<title> Student | Doubts </title>
	<link href="doubts.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
</head>
<body>
    <form method="post">
<nav>
    <a  href="VC_Student_profile.jsp"><i class="fa fa-home " aria-hidden="true"></i>  HOME</a>
    <a  href="VC_StudyMaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a  class="selected" href="VC_doubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a  href="VC_News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i> NEWS</a>
    <div class="right">
        <a href="VC_Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="VC_Student_logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>


<%
   String email=(String)session.getAttribute("email1");
 // String email_1="shruti@gmail.com";
  int no_id = Integer.parseInt(request.getParameter("sub_id"));
   try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    String sql="Select * from subj where sub_id="+no_id+" ";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    rs.next();
    int subject_id=rs.getInt("sub_id");
    session.setAttribute("sub_id",no_id);
%>
<table width=100%>
<tr height="20px" >
<td>
    
    <a href="modal.jsp" class="link">Post a Question</a>
</td>
<td >
<a href="VC_doubts.jsp?sub_id=<%=no_id%>" style="text-decoration: none;
  display: inline-block;
  padding: 8px 16px; background-color: #f44336;
  color:white; left:5px;margin-right:25px;
text-align:right;
float:right;">&laquo; Previous</a>
</td>
</tr>
</table>
<%
   ResultSet rs1=st.executeQuery("Select * from doubts where sub_id="+no_id+" ");
    while(rs1.next())
            {
%>
 

<div class="table">
<table width=100% height=100%>
<tr>
    <td width=10% bgcolor="lightblue">
        Question <%=rs1.getInt("d_id")%>;
    </td>
    <td>
<%
        out.println(rs1.getString("ques"));   
 %>
    </td>
    <td width=15%>
         
        <%
            out.println("by "+rs1.getString("asked_by"));
        %>
    </td>
</tr>
<tr>
    <td width=10% bgcolor="cyan">
        Ans<%=rs1.getInt("d_id")%>;
    </td>
    <td>
<%
    if(rs1.getString("ans")==null)
    {
%>
<a href="add_answer.jsp?ques=<%=rs1.getString("ques")%>">Add answer</a>
  <%
    }
    else
        out.println(rs1.getString("ans")); 
 %>
    </td>
    <td width="15%">
<%
    if(rs1.getString("answered_by")!=null)
    {
       out.println(" by  "+rs1.getString("answered_by"));
    }
%>
    </td>
</tr>
</table>
</div>
<%
            }
            rs1.close();

        
rs.close();
    con.close();
    st.close();
 }catch(Exception ex)
{
    ex.printStackTrace();
}
%>
</form>
</body
</html>		