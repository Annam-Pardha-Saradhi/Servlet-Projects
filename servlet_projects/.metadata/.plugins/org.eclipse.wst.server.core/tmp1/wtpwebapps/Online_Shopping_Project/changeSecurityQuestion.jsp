<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src="https://kit.fontawesome.com/d72ad669ec.js" crossorigin="anonymous"></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("updated".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something Went Wrong! Try Again</h3>
<%} %>

<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
    <select class="input-style" name="newSecurityQuestion" required>
  		<option value="What is your first car?">What is your first car?</option>
  		<option value="What is the name of your first pet?">What is the name of your first pet?</option>
  		<option value="What elementary school did you attend?">What elementary school did you attend?</option>
  		<option value="What is name of town where you were born?">What is name of town where you were born?</option>
  	</select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter Your New Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter Password (For Security)" required>
<hr>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>

</body>
<br><br><br>
</html>