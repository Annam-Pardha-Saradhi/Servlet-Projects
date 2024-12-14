<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src="https://kit.fontawesome.com/d72ad669ec.js" crossorigin="anonymous"></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>

<%
String msg=request.getParameter("msg");
if("sent".equals(msg))
{
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="meassageUsAction.jsp" method="post">
<input class="input-style" name="subject" type="text" placeholder="subject" required/>
<hr>
<textarea class="input-style" name="body" placeholder="Enter Your Message" required></textarea>
<hr>
<button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<br><br>
<h4 style="text-align:center; color:brown">Please Don't Spam!</h4>
<br>
</body>
</html>