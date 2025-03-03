<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Delivered Orders</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>



<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
          </tr>
         <%
        try
        {
        	Connection connection = ConnectionProvider.getConnection();
        	Statement statement = connection.createStatement();
        	String sql = "select * from cart inner join product where cart.product_id=product.id and orderDate is not null and status='Delivered'";
        	ResultSet rs = statement.executeQuery(sql);
        	while(rs.next())
        	{
        %>
       
          <tr>
          <td><%=rs.getString("mobileNumber") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("quantity") %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString("total") %> </td>
                <td><%=rs.getString("address") %></td>
               <td><%=rs.getString("city") %></td>
                <td><%=rs.getString("state") %></td>
                 <td><%=rs.getString("country") %></td>
             <td><%=rs.getString("orderDate") %></td>
              <td><%=rs.getString("deliveryDate") %></td>
               <td><%=rs.getString("paymentMethod") %></td>
               <td><%=rs.getString("transactionId") %></td>
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
         
        </table>
      <br>
      <br>
      <br>

</body>
</html>