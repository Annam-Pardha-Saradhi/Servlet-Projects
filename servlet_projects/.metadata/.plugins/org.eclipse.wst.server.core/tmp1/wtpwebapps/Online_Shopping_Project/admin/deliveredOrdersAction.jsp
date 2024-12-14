<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String id = request.getParameter("id");
String status = "Delivered";
try
{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	String sql = "update cart set status = '"+status+"' where product_id = '"+id+"' and email = '"+email+"' and address is not null";
	statement.executeUpdate(sql);
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>