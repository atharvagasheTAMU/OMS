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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Assuming you have a BookService class to get paginated books
        ApplicationDao dao = new ApplicationDao();

        // Get the requested page parameter, default to 1 if not provided
        String searchString = request.getParameter("searchString");
        String searchType = request.getParameter("searchType");
        if (searchString == null) {
        	searchString = "";
        }
        if (searchType == null) {
        	searchType = "book_name";
        }
        int currentPage = 1;
        int pageSize = 10;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            // Handle invalid page number, default to 1
        }

        // Set the number of books per page (you can adjust this based on your needs)

        // Get paginated books from the BookService
        List<Book> books = null;
		try {
			books = dao.searchBookByName(searchString,currentPage);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Calculate the total number of pages
        int totalBooks = 0;
		try {
			totalBooks = dao.getTotalBooks(searchType, searchString);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        int totalPages = (int) Math.ceil((double) totalBooks / pageSize);

        // Set attributes to be used in the JSP
        request.setAttribute("booksPage", books);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Forward to the JSP page
        request.getRequestDispatcher("/html/dashboard.jsp").forward(request, response);
    }
}