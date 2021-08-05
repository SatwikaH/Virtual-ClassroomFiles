<%-- 
    Document   : Student_logout
    Created on : May 10, 2021, 12:05:54 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("VC_Student_login.jsp");
    %>