<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
try
{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	String query = "select * from cart where email='"+email+"' and product_id='"+id+"' and address is null";
	ResultSet rs1 = statement.executeQuery(query);
	while(rs1.next())
	{
		price = rs1.getInt("price");
		total = rs1.getInt("total");
		quantity = rs1.getInt("quantity");
	}
	if(quantity==1 && "dec".equals(incdec))
	{
		response.sendRedirect("myCart.jsp?msg=notPossible");
	}
	else if(quantity!=1 && "dec".equals(incdec))
	{
		quantity = quantity-1;
		total = total-price;
		statement.executeUpdate("update cart set quantity='"+quantity+"',total='"+total+"' where email='"+email+"' and product_id='"+id+"' and address is null");
		response.sendRedirect("myCart.jsp?msg=dec");
	}
	else if("inc".equals(incdec))
	{
		quantity = quantity+1;
		total = total+price;
		statement.executeUpdate("update cart set quantity='"+quantity+"',total='"+total+"' where email='"+email+"' and product_id='"+id+"' and address is null");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("myCart.jsp?msg=invalid");
}
%>