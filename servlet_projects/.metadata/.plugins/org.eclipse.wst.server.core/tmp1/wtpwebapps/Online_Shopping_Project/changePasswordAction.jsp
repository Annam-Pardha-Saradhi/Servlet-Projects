<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if(!(confirmPassword.equals(newPassword)))
{
	response.sendRedirect("changePassword.jsp?msg=notMatch");
}
else
{
	try
	{
		int check=0;
		Connection connection = ConnectionProvider.getConnection();
		Statement statement1 = connection.createStatement();
		String sql1 = "select * from users where email='"+email+"' and password='"+oldPassword+"'";
		ResultSet rs1 = statement1.executeQuery(sql1);
		while(rs1.next())
		{
			check=1;
			String sql2 = "update users set password='"+newPassword+"' where email='"+email+"'";
			Statement statement2 = connection.createStatement();
			statement2.executeUpdate(sql2);
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0)
		{
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("changePassword.jsp?msg=invalid");
	}
}
%>