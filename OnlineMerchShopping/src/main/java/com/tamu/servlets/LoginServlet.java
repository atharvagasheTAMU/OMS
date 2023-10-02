package com.tamu.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tamu.dao.ApplicationDao;

@WebServlet("/html/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
		dispatcher.include(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		ApplicationDao dao= new ApplicationDao();
		boolean isValidUser = false;
		try {
			isValidUser = dao.validateUser(username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				if(isValidUser){
			HttpSession session = req.getSession();
			session.setAttribute("username", username);
			RequestDispatcher rd = req.getRequestDispatcher("/html/dashboard");
			rd.forward(req, resp);
		}
		else{
			String errorMessage="Invalid Credentials, please login again!";
			req.setAttribute("error", errorMessage);
			req.getRequestDispatcher("/html/login.jsp").forward(req, resp);
			
		}	
	}

}
