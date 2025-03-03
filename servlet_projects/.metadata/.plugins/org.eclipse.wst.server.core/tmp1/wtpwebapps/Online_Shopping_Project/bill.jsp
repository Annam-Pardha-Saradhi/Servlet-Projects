<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>

<h3>Online Shopping Bill</h3>
<hr>
<%
String email = session.getAttribute("email").toString();
int total=0;
try
{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	String query1 = "select sum(total) from cart";
	ResultSet rs1 = statement.executeQuery(query1);
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}
	String query2 = "select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'";
	ResultSet rs2 = statement.executeQuery(query2);
	while(rs2.next())
	{
%>
<div class="left-div"><h3>Name: <%=rs2.getString("name") %> </h3></div>
<div class="right-div-right"><h3>Email:  <%=email %></h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs2.getString("mobileNumber") %> </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs2.getString("orderDate") %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs2.getString("paymentMethod") %> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs2.getString("deliveryDate") %> </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs2.getString("transactionId") %> </h3></div>
<div class="right-div-right"><h3>City:  <%=rs2.getString("city") %></h3></div> 
<div class="right-div"><h3>Address: <%=rs2.getString("address") %> </h3></div> 

<div class="left-div"><h3>State:  <%=rs2.getString("state") %></h3></div>
<div class="right-div-right"><h3>Country:  <%=rs2.getString("country") %></h3></div>  

<hr>

<%break; }%>
	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
    <%
  int sno=0;
  ResultSet rs3 = statement.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.status='bill'");
  while(rs3.next())
  {
	  sno=sno+1;
  %>
  <tr>
    <td><%=sno %></td>
    <td><%=rs3.getString("name") %></td>
    <td><%=rs3.getString("category") %></td>
    <td><%=rs3.getString("price") %></td>
    <td><%=rs3.getString("quantity") %></td>
     <td><%=rs3.getString("total") %></td>
  </tr>
  <tr>
  <%} %>

</table>
<h3>Total: <%=total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</body>
</html>