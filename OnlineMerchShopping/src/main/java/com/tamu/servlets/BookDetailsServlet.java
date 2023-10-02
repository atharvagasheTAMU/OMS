package com.tamu.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tamu.dao.ApplicationDao;
import com.tamu.entity.Book;

@WebServlet("/html/bookDetails")
public class BookDetailsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bookId = Integer.parseInt(req.getParameter("bookId"));

		ApplicationDao dao = new ApplicationDao();
		Book book = null;
		try {
			book = dao.getBook(bookId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		req.setAttribute("book", book);

		req.getRequestDispatcher("/html/bookDetails.jsp").forward(req, resp);

	}
}
