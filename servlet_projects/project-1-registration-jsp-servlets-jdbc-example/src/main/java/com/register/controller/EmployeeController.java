package com.register.controller;

import com.register.dao.EmployeeDao;
import com.register.model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class EmployeeController extends HttpServlet 
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
	{
		Employee employee = new Employee();
		int id;
		if(request.getParameter("id")==null)
		{
			id=0;
		}
		else
		{
			id = Integer.parseInt(request.getParameter("id"));
		}
		employee.setId(id);
		employee.setFirstName(request.getParameter("firstName"));
		employee.setLastName(request.getParameter("lastName"));
		employee.setUserName(request.getParameter("userName"));
		employee.setPassword(request.getParameter("password"));
		employee.setAddress(request.getParameter("address"));
		employee.setContact(request.getParameter("contact"));
		
		EmployeeDao employeeDao = new EmployeeDao();
		try {
			int rowsAffected = employeeDao.registerEmployee(employee);
			if(rowsAffected>0)
			{
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("regSuccess.jsp");
				requestDispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
