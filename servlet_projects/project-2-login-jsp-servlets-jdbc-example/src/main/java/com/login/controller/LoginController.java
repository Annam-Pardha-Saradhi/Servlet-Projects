package com.login.controller;

import java.io.IOException;

import com.login.dao.LoginDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String unmae=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		
		LoginDao logindao= new LoginDao();
		
		try {
			if(logindao.validateLogin(unmae, pwd))
			{
				response.sendRedirect("loginsuccess.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
