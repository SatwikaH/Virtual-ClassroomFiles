<%-- 
    Document   : add_answer
    Created on : Apr 10, 2021, 7:57:13 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Add answer</title>
        <style>
             *
{
    box-sizing: border-box;
}

body {
    margin: 0px;
    width:100%;
    height:105%;
   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}


nav {
    background-color:rgb(17, 124, 143) ;
    overflow: hidden;
}
nav a {
    text-decoration: none;
    padding: 20px;
    text-align: center;
	border:1;
    float: left;
    color: white;
}
nav a:hover{
  background-color:white;
  color:rgb(17, 124, 143);
}
nav a.selected{
   background-color:white;
  color:rgb(17, 124, 143);   
  }

.right{
text-align:right;
float:right;
}
footer {
    background-color:rgb(17, 124, 143);
    overflow: hidden;
	position:absolute;
	bottom:0;
	width:100%;
}

footer a {
    text-decoration: none;
    padding: 20px;
    text-align: center;
    float: left;
    color: white;
}
footer a:hover{
  background-color:white;
  color:rgb(17, 124, 143);
  }
  footer a.active{
  background-color:white;
  color:rgb(17, 124, 143);
  }

	.container {
    width:95%;
  padding: 16px;
  background-color: lightblue;
}
input[type=text]{
  width: 95%;
  padding: 10px;
 
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
.insertbtn {
  background-color: #4CAF50;
  font-weight:bold;
  color: black;
  padding: 16px 20px;
  margin: 3px 0;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
  table{
      border-collapse: separate;
    border-spacing: 0 1em;
  }
}

</style>
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
	<br/><br/>
            
            <%
                String question=request.getParameter("ques");
                
                %>
                <center> <div class="container">
	<h4>Post an answer</h4> 
	<table width=100%>
	<tr>
		<td >
		<label for="email"><b>Question</b></label>
		</td>
		<td>
		<% out.println(question);%>
		</td>
	</tr>
        <tr>
		<td >
		<label for="email"><b>Answered by</b></label>
		</td>
                <td>
                <input type="text" name="add_name" placeholder="Enter name" required/> <br/>	
                </td>
        </tr>
        <tr>
                <td >
		<label for="email"><b>Answer</b></label>
		</td>
        <br/>
                <td>
                <textarea rows="4" cols="155" name="add_ans" width="100%"></textarea>
                </td>
        </tr>
        </table>
                        <center><button type="submit" class="insertbtn" name="btnInsert" value="Insert" >Done</button></center>
	</div>
</center>
                <%
                    if(request.getParameter("btnInsert")!=null)
                    {
                        String nm=request.getParameter("add_name");
                        String ans=request.getParameter("add_ans");
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
                   
                        int subject_id = (int)session.getAttribute("sub_id");
                        Statement st= con.createStatement();
                        ResultSet rs1=st.executeQuery("Select * from documents where sub_id="+subject_id+" ");
                        int x=st.executeUpdate("update doubts set ans='"+ans+"' , answered_by='"+nm+"' where ques='"+question+"'  ");
                        if(x>0)
                        {
                            response.sendRedirect("doubtsquestion.jsp?sub_id="+subject_id );
                        }
                           
                    }
                    %>
                  
        </form>
    </body>
</html>

