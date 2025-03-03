<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp" %>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");
String sql = "insert into product values(?,?,?,?,?)";
if(id!=null)
{
	try(Connection connection=ConnectionProvider.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql))
	{
		preparedStatement.setString(1,id);
		preparedStatement.setString(2,name);
		preparedStatement.setString(3,category);
		preparedStatement.setString(4,price);
		preparedStatement.setString(5,active);
		int rowsUpdated=preparedStatement.executeUpdate();
		if(rowsUpdated>0)
		{
			response.sendRedirect("addNewProduct.jsp?msg=done");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("addNewProduct.jsp?msg=wrong");
	}
}
%>