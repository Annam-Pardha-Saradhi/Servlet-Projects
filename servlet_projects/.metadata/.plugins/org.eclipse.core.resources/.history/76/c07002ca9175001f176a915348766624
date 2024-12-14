<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String subject = request.getParameter("subject");
String body = request.getParameter("body");
String sql="insert into messages (email,subject,body) values(?,?,?)";
try(Connection connection = ConnectionProvider.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql))
{
	preparedStatement.setString(1,email);
	preparedStatement.setString(2,subject);
	preparedStatement.setString(3,body);
	preparedStatement.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=sent");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>