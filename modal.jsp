<%-- 
    Document   : modal
    Created on : Apr 9, 2021, 9:07:48 PM
    Author     : user
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Post question</title>
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
.postbtn {
  background-color: #4CAF50;
  font-weight:bold;
  color: black;
  padding: 16px 20px;
  margin: 3px 0;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
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

</style>
    </head>
<body>
 <form method="Post">
	
	<!--Step 1:Adding HTML-->
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
			<center> <div class="container">
	<h4>Post a Question</h4> 
	<table   width=100%>
	<tr>
		<td >
		<label for="email"><b>Question</b></label>
		</td>
		<td>
		<input type="text" name="quest" placeholder="Enter question" /> <br/>
		</td>
	</tr>
	<tr>
		<td >
		<label for="email"><b>Asked by</b></label>
		</td>
		<td>
		<input type="text" name="ask" placeholder="Enter name" /> <br/>
		</td>
	</tr>
	</table>
        <center><button type="submit" class="postbtn" name="postbtn"  value="Post" >Submit</button></center>
	</div>
</center>
                    <%
   
    if(request.getParameter("postbtn")!=null)
    {
        
         Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
    Statement st= con.createStatement();
   try{
    int no_id = (int)session.getAttribute("sub_id");
    
        String que=request.getParameter("quest");
        String asked=request.getParameter("ask");
        out.println(no_id);
        out.println(que);
        out.println(asked);
    try{
        int x=st.executeUpdate("Insert into doubts (sub_id,ques,asked_by) values ("+no_id+",'"+que+"','"+asked+"')");
        if(x>0)
        {
            //request.setAttribute("sub_id",no_id);
            response.sendRedirect("doubtsquestion.jsp?sub_id="+no_id );
        }
       }catch(Exception ex){
    out.println("cannot ");
}
    }catch(Exception e)
    {
        out.println("cannot 22");
    }
    }

%> 
                </form>
	</div>

	

</body>

</html>