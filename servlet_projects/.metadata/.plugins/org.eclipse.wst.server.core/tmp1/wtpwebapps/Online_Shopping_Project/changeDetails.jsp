<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src="https://kit.fontawesome.com/d72ad669ec.js" crossorigin="anonymous"></script>
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try
{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	String sql = "select * from users where email = '"+email+"'";
	ResultSet rs = statement.executeQuery(sql);
	while(rs.next())
	{
%>
<h3>Name: <%=rs.getString("name") %></h3>
<hr>
 <h3>Email: <%=rs.getString("email") %></h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString("mobileNumber") %></h3>
 <hr>
<h3>Security Question: <%=rs.getString("securityQuestion") %></h3>
<hr>
      <br>
      <br>
      <br>
<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>