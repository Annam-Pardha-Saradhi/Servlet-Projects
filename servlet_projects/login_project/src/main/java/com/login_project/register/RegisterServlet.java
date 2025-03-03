package com.login_project.register;

import java.io.IOException;

import com.login_project.bean.User;
import com.login_project.dao.DaoLayer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String mobile = request.getParameter("contact");
		
		User user = new User(name,email,password,mobile);
		DaoLayer daoLayer = new DaoLayer();
		
		if(daoLayer.validateUserEmail(email))
		{
			request.setAttribute("status", "failed");
		}
		else
		{
			if(daoLayer.insert(user))
			{
				request.setAttribute("status", "success");
			}
			else
			{
				request.setAttribute("status", "failed");
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
		dispatcher.forward(request, response);
	}

}
