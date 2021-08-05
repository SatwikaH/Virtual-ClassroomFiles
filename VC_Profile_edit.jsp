<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student | Edit</title>
        <link rel="stylesheet" href="edit.css" type="text/css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
    function validate()
    {
        var pn=document.getElementById('pn').value;
        var password=document.getElementById('pass').value;
        var name=document.getElementById('f_name').value;
        var urREGX=/[A-Za-z]+\s/;
        var nameResult = urREGX.test(name);
        var pn=document.getElementById('pn').value;
var pnRGEX=/^((?!(0))[0-9]{10})$/;
var pnResult= pnRGEX.test(pn);
                if(pnResult == false)
		{
			alert('Enter valid phone number ');
			return false;
		}
        if(nameResult == false)
		{
			document.getElementById('f_name').style.backgroundColor='#FFFF99';
			alert('invalid Name');
			return false;
		}
        if(pn.length!=10)
        {
            alert('Phone number must be 10 digit long');
	    return false;
        }
        if(password.length <8)
        {
            document.getElementById('pass').style.backgroundColor='#FFFF99';
            alert('Password must be more or 8 charachters long ');
            return false;
        }
        return true;
		
    }
</script>
    </head>
    <body>
<%
   String email=(String)session.getAttribute("email1");
   
    try{
     Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
   String e="",quest="",answ="";
    String sql="Select * from student_register where email_id='"+email+"'";
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery(sql);   
    rs=st.executeQuery(sql);
    if(rs.next())
    {
        e=rs.getString("email_id");
        quest=rs.getString("sec_ques");
        answ=rs.getString("sec_ans");
%>
<form  method="Post" onchange="return validate()">
    <nav>
    <a  href="VC_Student_profile.jsp"><i class="fa fa-home" aria-hidden="true"></i>  HOME</a>
    <a   href="VC_StudyMaterial_student.jsp"><i class="fa fa-file-text " aria-hidden="true"></i>  STUDY MATERIAL</a>
    <a   href="VC_doubts.jsp"><i class="fa fa-comments " aria-hidden="true"></i>  DOUBTS</a>
    <a   href="VC_News.jsp" ><i class="fa fa-bullhorn " aria-hidden="true"></i>ANNOUNCEMENTS</a>
    <div class="right">
        <a class="selected" href="VC_Profile_edit.jsp" ><i class="fa fa-pencil " aria-hidden="true"></i>  EDIT PROFILE  </a>
        <a  href="VC_Student_logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>
    </div>
</nav>
	<div class="container">
        <h1> Edit Profile <i class="fa fa-pencil" aria-hidden="true"></i></h1>
	<hr>
            <label for="email"><b>Name</b></label>
            <input type="text" id="f_name" name="name" value="<%=rs.getString("s_name")%>"   placeholder="Enter name" required/> <br/>				
	
            <label for="email"><b>Password</b></label>
            <input type=password id="pass" name="pass" value="<%=rs.getString("pass")%>" placeholder="Enter password" required/> <br/>
	
            <label for="email"><b>Phone Number</b></label>
            <input type="text" id="pn" name="ph_no" value="<%=rs.getLong("ph_no")%>" placeholder="Enter phone number" required/> <br/>
	
            <label for="email"><b>Select course</b></label>
            <select name="course">
		<option  selected value="<%=rs.getString("branch")%>" > <%=rs.getString("branch")%></option>
		<option value="Information Technology"> B.Tech Information Technology </option>
		<option value="Computer Science"> B.Tech Computer Science </option>
		<option value="Biotechnology"> B.Tech Biotechnology </option>
		<option value="Chemical Engineering"> B.Tech Chemical Engineering </option>
            </select>
				
            <label for="email"><b>Select Semester</b></label>
            <select name="sem">
		<option selected value="<%=rs.getInt("sem")%>" > <%=rs.getInt("sem")%> </option>
		<option value="1"> 1 </option>
		<option value="2"> 2</option>
		<option value="3"> 3 </option>
		<option value="4"> 4 </option>
		<option value="5"> 5 </option>
		<option value="6"> 6 </option>
		<option value="7"> 7 </option>
		<option value="8"> 8 </option>
            </select>
					
            </hr>
	<button type="submit" class="updatebtn" name="btnUpdate" value="Update">Update</button>
	</div>
<%            
    }
  try{
    if(request.getParameter("btnUpdate")!=null)
    {
        String name_up=request.getParameter("name");
        String pass_up=request.getParameter("pass");
        long phno_up=Long.parseLong(request.getParameter("ph_no"));
        //int phno_up=Integer.parseInt(request.getParameter("ph_no"));
        String course_up=request.getParameter("course");
        int sem_up=Integer.parseInt(request.getParameter("sem"));
        String question_up=request.getParameter("question");
        String answer_up=request.getParameter("answer");
        String sql1="update student_register set  email_id=? , pass=? ,s_name=?, ph_no=? , sem=? , branch=? , sec_ques=? , sec_ans=? where email_id='"+email+"'";
        PreparedStatement ps=con.prepareStatement(sql1);
        ps.setString(1,e);
        ps.setString(2,pass_up);
        ps.setString(3,name_up);
        ps.setLong(4,phno_up);
        ps.setInt(5,sem_up);
        ps.setString(6,course_up);
        ps.setString(7,quest);
        ps.setString(8,answ);
        ps.executeUpdate();
        if(ps.executeUpdate()>=1)
        {
            response.sendRedirect("VC_Student_profile.jsp");
        }
    }
} catch (SQLException exx) {
        exx.printStackTrace();
}
rs.close();
st.close();
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>	
       
</form>
</body>
</html>

