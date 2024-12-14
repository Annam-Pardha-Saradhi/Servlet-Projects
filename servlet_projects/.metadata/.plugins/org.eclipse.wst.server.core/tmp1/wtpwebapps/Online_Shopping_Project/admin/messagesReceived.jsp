<%@page import="com.project.connectionprovider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages Received</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
        	<%
	        try
	        {
	        	Connection connection = ConnectionProvider.getConnection();
	        	Statement statement = connection.createStatement();
	        	String sql="select * from messages";
	        	ResultSet rs = statement.executeQuery(sql);
	        	while(rs.next())
	        	{
        	%>
          <tr>
            <td><%=rs.getString("id") %></td>
            <td><%=rs.getString("email") %></td>
            <td><%=rs.getString("subject") %></td>
            <td><%=rs.getString("body") %></td>
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