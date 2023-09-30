package com.tamu.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tamu.entity.Product;
import com.tamu.dao.ApplicationDao;

@WebServlet("/addProducts")
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//get the HTTPSession object
		HttpSession session = request.getSession();
		
		//create a cart as arraylist for the user
		List<String> cart = (ArrayList<String>)session.getAttribute("cart");
		
		if(cart==null){
			cart = new ArrayList<>();
		}

		//add the selected product to the cart
		if(request.getParameter("product")!=null){
			cart.add(request.getParameter("product"));
		}
		
		session.setAttribute("cart", cart);


		//get search criteria from search servlet
		
		String search = (String)session.getAttribute("search");
		
		
		//get the search results from dao
		ApplicationDao dao = new ApplicationDao();
		List<Product> products = null;
		try {
			products = dao.searchProducts(search);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//set the search results in request scope
		request.setAttribute("products", products);
		
		//forward to searchResults.jsp
		request.getRequestDispatcher("/html/searchResults.jsp").forward(request, response);


	}


	
}
