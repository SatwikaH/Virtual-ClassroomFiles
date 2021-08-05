<%-- 
    Document   : file_upload
    Created on : Apr 22, 2021, 11:49:01 AM
    Author     : user
--%>

<%@page import="java.io.File"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
    /*add full-width input fields*/
    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 2px solid #ccc;
        box-sizing: border-box;
    }
    /* set a style for all buttons*/
    button {
        background-color: green;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        cursor: pointer;
        width: 100%;
    }
    /*set styles for the cancel button*/
    .cancelbtn {
        padding: 14px 20px;
        background-color: #FF2E00;
    }
    /*float cancel and signup buttons and add an equal width*/
    .cancelbtn,
    .signupbtn {
        float: left;
        width: 50%
    }
    /*add padding to container elements*/
    .container {
        padding: 16px;
    }
    /*define the modal’s background*/
     
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
        padding-top: 60px;
    }
    /*define the modal-content background*/
     
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto;
        border: 1px solid #888;
        width: 80%;
    }
    /*define the close button*/
     
    .close {
        position: absolute;
        right: 35px;
        top: 15px;
        color: #000;
        font-size: 40px;
        font-weight: bold;
    }
    /*define the close hover and focus effects*/
     
    .close:hover,
    .close:focus {
        color: red;
        cursor: pointer;
    }
     
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }
     
    @media screen and (max-width: 300px) {
        .cancelbtn,
        .signupbtn {
            width: 100%;
        }
    }
</style>
 
<body>
 
    <h2>Modal Signup Form</h2>
    <!--Step 1:Adding HTML-->
    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Sign Up</button>
 
    <div id="id01" class="modal">
        <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
        <form class="modal-content animate" action="/action_page.php">
            <div class="container">
                <label><b>Document name</b></label>
                <input type="text" name="docname" placeholder="Enter Email" name="email" required>
 
                <label><b>document path</b></label>
                <input type="text" name="docpath" placeholder="Enter Password" name="psw" required>
 
                <label><b>Subject name</b></label>
                <input type="text" name="subj_name" placeholder="Repeat Password" name="psw-repeat" required>
                <input type="checkbox"> Remember me
                <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
 
                <div class="clearfix">
                    <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                    <button type="submit" name="signupbtn" class="signupbtn">Sign Up</button>
                </div>
            </div>
            <%
                String path=request.getParameter("docpath");
                 JFileChooser choose = new JFileChooser();
            choose.setMultiSelectionEnabled(true);
             choose.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
             choose.setFileHidingEnabled(false);
             if(choose.showOpenDialog(null) == JFileChooser.APPROVE_OPTION)
             {
                File f=choose.getSelectedFile();
                System.out.println(f.getAbsolutePath());
             }
                try{
                    if(request.getParameter("signupbtn")!=null) 
                    {
                String name=request.getParameter("docname");
                //String path=request.getParameter("docpath");
                String subject_name=request.getParameter("subj_name");
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?zeroDateTimeBehaviour=convertToNull","root","root");
                PreparedStatement pst=con.prepareStatement("insert into documents(?,?,?,?) ");
                pst.setString(2,name);
                pst.setString(3,path);
                pst.setString(4,subject_name);
                if(pst.executeUpdate()>=1)
        {
            out.println("<script>alert('data inserted')</script>");
        }
                    }
                }catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                %>
        </form>
    </div>
 
    <!--close the modal by just clicking outside of the modal-->
    <script>
        var modal = document.getElementById('id01');
 
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
 
</body>
 
</html>

 






 


