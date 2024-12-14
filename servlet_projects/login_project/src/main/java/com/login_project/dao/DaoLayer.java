package com.login_project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.login_project.bean.User;

public class DaoLayer 
{
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login_project";
	String user = "root";
	String pwd =  "root";
	
	public DaoLayer()
	{
		
	}
	
	public Connection getConnection()
	{
		Connection connection = null;
		try
		{
			Class.forName(driver);
			connection = DriverManager.getConnection(url,user,pwd);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return connection;
	}
	
	private static final String INSERT_QUERY = "insert into users (uname,upwd,uemail,umobile) values(?,?,?,?)"; 
	private static final String VALID_USER_QUERY = "select * from users where uname=? and upwd=?";
	private static final String USER_EMAIL_VALIDATE_QUERY = "select * from users where uemail=?";
	
	public boolean insert(User user)
	{
		boolean RowInserted = false;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(INSERT_QUERY))
		{
			statement.setString(1,user.getName());
			statement.setString(2,user.getPassword());
			statement.setString(3,user.getEmail());
			statement.setString(4,user.getMobile());
			RowInserted = statement.executeUpdate()>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return RowInserted;
	}
	
	public boolean validateUser(String uname,String pwd)
	{
		boolean validUser=false;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(VALID_USER_QUERY))
		{
			statement.setString(1,uname);
			statement.setString(2,pwd);
			validUser = statement.executeQuery().next();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return validUser;
	}
	public boolean validateUserEmail(String uemail)
	{
		boolean validUserEmail=false;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(USER_EMAIL_VALIDATE_QUERY))
		{
			statement.setString(1,uemail);
			validUserEmail = statement.executeQuery().next();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return validUserEmail;
	}
}
