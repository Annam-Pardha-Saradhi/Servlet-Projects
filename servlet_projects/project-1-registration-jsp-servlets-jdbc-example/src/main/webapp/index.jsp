<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form
{
display:flex;
flex-direction:column;
  justify-content: center;
  align-items: center;
}
form input
{
	padding:7px;
	width:250px;
}
form p
{
width:250px;
text-align:center;
color:green;
}
</style>
</head>
<body>
<form action="register" method="post">
<h1>Employee Registration</h1>
<p>id</p>
<input type="text" name="id"/>
<p>first_Name</p> 
<input type="text" name="firstName"/>
<p>last_Name</p>
<input type="text" name="lastName"/>
<p>user_Name</p>
<input type="text" name="userName"/>
<p>password</p>
<input type="password" name="password"/>
<p>address</p>
<input type="text" name="address"/>
<p>contact</p>
<input type="text" name="contact"/><br><br>
<input type="submit" style="cursor:pointer"/>
</form>
</body>
</html>