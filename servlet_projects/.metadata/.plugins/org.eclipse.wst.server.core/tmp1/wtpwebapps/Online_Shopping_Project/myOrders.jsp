<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
        <%
        int sno=0;
		try
		{
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select * from cart inner join product where product.id=cart.product_id and cart.email='"+email+"' and orderDate is not null";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next())
			{
				sno=sno+1;
        %>
          <tr>
            <td><%=sno %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("category") %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString("price") %></td>
            <td><%=rs.getString("quantity") %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString("total") %></td>
             <td><%=rs.getString("orderDate") %></td>
              <td><%=rs.getString("deliveryDate") %></td>
               <td><%=rs.getString("paymentMethod") %></td>
               <td><%=rs.getString("status") %></td>
            </tr>
         <%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>