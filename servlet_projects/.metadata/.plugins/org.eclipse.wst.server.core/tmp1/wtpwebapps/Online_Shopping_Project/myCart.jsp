<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%
}
%>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity Increased Successfully!</h3>
<%
}
%>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity Decreased Successfully!</h3>
<%
}
%>
<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%
}
%>
<table>
<thead>
		<%
			int total=0;
			int sno=0;
			try
			{
				Connection connection = ConnectionProvider.getConnection();
				Statement statement = connection.createStatement();
				String query1 = "select sum(total) from cart where address is null";
				ResultSet rs1 = statement.executeQuery(query1);
				while(rs1.next())
				{
					total=rs1.getInt(1);
				}
		%>	
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%=total %> </th>
            <% 
            	if(total>0)
            	{
            %>
            	<th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
            <%
            	}
            %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      		<%
      			ResultSet rs2= statement.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and address is null");
      			while(rs2.next())
      			{
      		%>
          <tr>
			<%sno=sno+1; %>
           <td><%=sno %></td>
            <td><%=rs2.getString(2) %></td>
            <td><%=rs2.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(2) %></td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs2.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs2.getString("quantity")%> <a href="incDecQuantityAction.jsp?id=<%=rs2.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString("total") %></td>
            <td><a href="removeFromCart.jsp?id=<%=rs2.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
            <%
      			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
        %>
          </tr>

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>