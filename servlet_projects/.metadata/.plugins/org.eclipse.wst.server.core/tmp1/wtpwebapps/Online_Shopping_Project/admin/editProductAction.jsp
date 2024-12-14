<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");
String sql = "update product set name=?,category=?,price=?,active=? where id=?";
try(Connection connection=ConnectionProvider.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql))
{
	preparedStatement.setString(1,name);
	preparedStatement.setString(2,category);
	preparedStatement.setString(3,price);
	preparedStatement.setString(4,active);
	preparedStatement.setString(5,id);
	int rowsUpdated=preparedStatement.executeUpdate();
	if(active.equals("No"))
	{
		Statement statement = connection.createStatement();
		statement.executeUpdate("delete from cart where id='"+id+"' and address is null");
		statement.close();
	}
	if(rowsUpdated>0)
	{
		response.sendRedirect("allProductEditProduct.jsp?msg=done");
	}
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
