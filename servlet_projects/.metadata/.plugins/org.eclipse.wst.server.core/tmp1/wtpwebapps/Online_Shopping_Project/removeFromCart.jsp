<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try
{
	String product_id = request.getParameter("id");
	String email = session.getAttribute("email").toString();
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	statement.executeUpdate("delete from cart where product_id='"+product_id+"' and email='"+email+"' and address is null");
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>