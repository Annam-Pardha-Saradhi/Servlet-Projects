<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try
{
	String email=session.getAttribute("email").toString();
	String status="processing";
	
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	String sql = "update cart set status='"+status+"' where email='"+email+"' and status='bill'";
	statement.executeUpdate(sql);
	System.out.println(sql);
	response.sendRedirect("home.jsp");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>