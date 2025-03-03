package com.register.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.register.model.Employee;

public class EmployeeDao {
	
	public int registerEmployee(Employee employee) throws ClassNotFoundException
	{
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serveletpractice";
		String user = "root";
		String password = "root";
		
		String sql = "insert into employee values(?,?,?,?,?,?,?)";
		
		Class.forName(driver);
		
		try(Connection connection = DriverManager.getConnection(url, user, password))
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employee.getId());
			preparedStatement.setString(2, employee.getFirstName());
			preparedStatement.setString(3, employee.getLastName());
			preparedStatement.setString(4, employee.getUserName());
			preparedStatement.setString(5, employee.getPassword());
			preparedStatement.setString(6, employee.getAddress());
			preparedStatement.setString(7, employee.getContact());
			int rowCount=preparedStatement.executeUpdate();
			return rowCount;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}

}
