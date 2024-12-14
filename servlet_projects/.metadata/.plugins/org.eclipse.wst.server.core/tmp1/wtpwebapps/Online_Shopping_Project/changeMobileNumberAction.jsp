<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String newMobileNumber = request.getParameter("newMobileNumber");
String password = request.getParameter("password");
int check=0;
String sql1 = "select * from users where email='"+email+"' and password='"+password+"'";
String sql2 = "update users set mobileNumber=? where email=? and password=?";
try(Connection connection = ConnectionProvider.getConnection();
		Statement statement = connection.createStatement();
		PreparedStatement preparedStatement = connection.prepareStatement(sql2))
{
	ResultSet rs = statement.executeQuery(sql1);
	while(rs.next())
	{
		check=1;
		preparedStatement.setString(1,newMobileNumber);
		preparedStatement.setString(2, email);
		preparedStatement.setString(3, password);
		preparedStatement.executeUpdate();
		response.sendRedirect("changeMobileNumber.jsp?msg=updated");
	}
	if(check==0)
	{
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("changeMobileNumber.jsp?msg=invalid");
}
%>