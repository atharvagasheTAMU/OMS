package com.tamu.servlets;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tamu.dao.ApplicationDao;
import com.tamu.entity.Book;

@WebServlet("/html/dashboard")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doGet(req, resp);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ApplicationDao dao = new ApplicationDao();

        String searchString = request.getParameter("searchString");
        String searchType = request.getParameter("searchType");
        if (searchString == null) {
        	searchString = "";
        }
        if (searchType == null) {
        	searchType = "book_name";
        }
        int currentPage = 0;
        int pageSize = 10;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
        }
        List<Book> books = null;
		try {
			books = dao.searchBookByName(searchString,currentPage);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

        int totalBooks = 0;
		try {
			totalBooks = dao.getTotalBooks(searchType, searchString);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        int totalPages = (int) Math.ceil((double) totalBooks / pageSize);

        request.setAttribute("booksPage", books);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/html/dashboard.jsp").forward(request, response);
    }
}