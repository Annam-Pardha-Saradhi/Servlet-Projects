<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String sql = "update users set address=?,city=?,state=?,country=? where email=?";
try(Connection connection = ConnectionProvider.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql))
{
	preparedStatement.setString(1, address);
	preparedStatement.setString(2, city);
	preparedStatement.setString(3, state);
	preparedStatement.setString(4, country);
	preparedStatement.setString(5, email);
	preparedStatement.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=updated");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>