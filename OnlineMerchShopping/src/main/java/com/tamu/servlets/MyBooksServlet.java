package com.tamu.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tamu.dao.ApplicationDao;
import com.tamu.entity.Book;

@WebServlet("/html/myBooks")
public class MyBooksServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ApplicationDao dao = new ApplicationDao();
		HttpSession session = req.getSession();

		String username = (String) session.getAttribute("username");

		List<Book> books = new ArrayList<Book>();
		try {
			books = dao.getBooks(username);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}



		req.setAttribute("booksPage", books);


		req.getRequestDispatcher("/html/myBooks.jsp").forward(req, resp);

	}
}
