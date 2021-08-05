<%-- 
    Document   : Student_Registration
    Created on : Apr 14, 2021, 8:43:53 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration</title>
        <link rel="stylesheet" href="Student_register.css" type="text/css" >
        <script>
		function validate(){
                var name=document.getElementById('f_name').value;
                var email_id=document.getElementById('email').value;
                var pn=document.getElementById('pn').value;
                var password=document.getElementById('pass').value;
		var c_password=document.getElementById('c_pass').value;
		var emailRGEX=/^\w+\.?\w+@[a-zA-Z_]+\.[a-zA-Z]{2,5}$/i ;
                var urREGX=/[A-Za-z]+\s/;
                var pnRGEX=/^((?!(0))[0-9]{10})$/;
		var emailResult = emailRGEX.test(email_id);
                var nameResult = urREGX.test(name);
                var pnResult= pnRGEX.test(pn);
                if(pnResult == false)
		{
			alert('Enter valid phone number ');
			return false;
		}
		if(emailResult == false)
		{
			document.getElementById('email').style.backgroundColor='#FFFF99';
			alert('invalid email');
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
                if(password !== c_password)
		{
			alert('password does not match ');
			return false;
		}
                return true;
		}
	</script>
    </head>
    <body>
	<center>
	
            <form  method="Post" onsubmit="return validate()">
		<center>
			<div class="container">
                        <h1>Register</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>
					<label for="email"><b>Name</b></label>
					<input type="text"  id="f_name" name="name" placeholder="Enter name" required/> <br/>
					
					<label for="email"><b>Email</b></label>
					<input type="text"  id="email" name="e-mail" placeholder="Enter email" required/> <br/>
					
                                        <label for="email"><b>Password</b></label>
					<input type=password id="pass" name="pass" placeholder="Enter password" required/> <br/>
                                        
                                        <label for="email"><b>Re-enter Password</b></label>
					<input type=password id="c_pass" name="pass" placeholder="Enter password" required/> <br/>
                                        
                                        <label for="email"><b>Phone Number</b></label>
					<input type="number" id="pn" name="ph_no" placeholder="Enter Phone number" required/> <br/>
                                        
                                        <label for="email"><b>Select course</b></label>
					<select name="course">
						<option selected hidden </option>
						<option value="Information Technology"> B.Tech Information Technology </option>
						<option value="Computer Science"> B.Tech Computer Science </option>
						<option value="Biotechnology"> B.Tech Biotechnology </option>
                                                <option value="Chemical Engineering"> B.Tech Chemical Engineering </option>
					</select>
					
					<label for="email"><b>Select Semester</b></label>
					<select  name="semester">
                                            
						<option selected hidden </option>
						<option value="1"> 1 </option>
						<option value="2"> 2</option>
						<option value="3"> 3 </option>
						<option value="4"> 4 </option>
						<option value="5"> 5 </option>
						<option value="6"> 6 </option>
						<option value="7"> 7 </option>
						<option value="8"> 8 </option>
					</select>
					
					<label for="email"><b>Enter a security question</b></label>
					<input type="text" name="question" placeholder="Enter question" required/> <br/>
                                        
                                        <label for="email"><b>Enter answer to the security question</b></label>
					<input type="text" name="answer" placeholder="Enter answer" required/> <br/>
				</hr>
                                <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
				<button type="submit" class="registerbtn" name="btnInsert" value="Insert">Register</button>
			</div>
			<div class.="container signin">
				<p>Already have an account? <a href="VC_Student_login.jsp">Log in</a>.</p>
			</div>
			</center>
                        
<%

    try{
        if(request.getParameter("btnInsert")!=null)
        {
            String n=request.getParameter("name");                
            String p=request.getParameter("pass");  
            String e=request.getParameter("e-mail"); 
            long pn=Long.parseLong(request.getParameter("ph_no"));
            //int pn=123;
            String cou=request.getParameter("course");
            int sem=Integer.parseInt(request.getParameter("semester"));
            String que=request.getParameter("question");
            String ans=request.getParameter("answer");  
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=  DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
            
            Statement st =  con.createStatement();
            ResultSet rs=st.executeQuery("Select * from student_register where email_id='"+e+"'");
            int count =0;
            while(rs.next())
            {
                count++;
            }
            if(count>0)
            {
                out.println("<script>alert('Email id already exists try with another email id or try sigining in')</script>");
            }
            else
            {
            int x=st.executeUpdate("insert into student_register (email_id,pass,s_name,ph_no,sem,branch,sec_ques,sec_ans) values ('"+e+"','"+p+"','"+n+"',"+pn+","+sem+",'"+cou+"','"+que+"','"+ans+"')");
            if(x>0)
            if(e.isEmpty() || n.isEmpty() || p.isEmpty() || que.isEmpty() || ans.isEmpty() || cou.isEmpty() ||  sem==0)
            {
		response.sendRedirect("VC_Student_Registration.jsp");
            }
            else
            {
                out.print("<script>alert('Please wait for admin verification')</script>");
                //session.setAttribute("email1",e);
                //response.sendRedirect("VC_Student_profile.jsp");
            }
        }
            
            st.close();
            con.close();
            rs.close();
        }
    } catch (SQLException exx) {
        exx.printStackTrace();
        out.println("something wrong");
    }           
%>

		</form>
</center>
   </body>
</html>





		


                                        

                                            