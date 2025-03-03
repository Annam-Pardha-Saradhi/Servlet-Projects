<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber =  request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
String sql = "insert into users(name,email,mobileNumber,securityQuestion,answer,password,address,city,state,country) values(?,?,?,?,?,?,?,?,?,?)";
	try(Connection connection=ConnectionProvider.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql))
	{
		preparedStatement.setString(1,name);
		preparedStatement.setString(2,email);
		preparedStatement.setString(3,mobileNumber);
		preparedStatement.setString(4,securityQuestion);
		preparedStatement.setString(5,answer);
		preparedStatement.setString(6,password);
		preparedStatement.setString(7,address);
		preparedStatement.setString(8,city);
		preparedStatement.setString(9,state);
		preparedStatement.setString(10,country);
		preparedStatement.executeUpdate();
		response.sendRedirect("signup.jsp?msg=valid");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("signup.jsp?msg=invalid");
	}
%>