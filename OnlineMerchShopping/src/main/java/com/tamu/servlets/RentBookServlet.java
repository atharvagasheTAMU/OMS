package com.tamu.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tamu.dao.ApplicationDao;
import com.tamu.entity.Book;
import com.tamu.entity.Order;


@WebServlet("/html/rentBook")
public class RentBookServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bookId = Integer.parseInt(req.getParameter("bookId"));
		int days =  Integer.parseInt(req.getParameter("rentDays"));
		LocalDate dueDate = LocalDate.now().plusDays(days);
		LocalDate orderDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String dueD = dueDate.format(formatter);
		String orderD = orderDate.format(formatter);
 
		HttpSession session = req.getSession();

		String username = (String) session.getAttribute("username");
		Order order = new Order();
		order.setBookId(bookId);
		order.setDueDate(dueD);
		order.setOrderDate(orderD);
		ApplicationDao dao = new ApplicationDao();
		int rows = 0;
		try {
			rows = dao.insertOrder(order,username);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (rows >0) {
			resp.getWriter().append("<h4> Book Ordered Successfully </h4>");
			
		}
		req.getRequestDispatcher("/html/dashboard.jsp").forward(req, resp);

	}
}
