package com.tamu.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tamu.entity.Book;
import com.tamu.entity.Product;
import com.tamu.entity.User;

public class ApplicationDao {

	public List<Product> searchProducts(String searchString) throws ClassNotFoundException {
		Product product = null;
		List<Product> products = new ArrayList<>();

		try {
			Connection connection = DBConnection.getConnectionToDataBase();

			String sql = "select * from products where product_name like '%" + searchString + "%'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				product = new Product();
				product.setProductId(set.getInt("product_id"));
				product.setProductImgPath(set.getString("image_path"));
				product.setProductName(set.getString("product_name"));
				products.add(product);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return products;
	}
	
	public List<Book> searchBook(String searchType, String searchString, int page) throws ClassNotFoundException {
		Book book = null;
		List<Book> books = new ArrayList<>();
		int pageSize = page *10;
		try {
			Connection connection = DBConnection.getConnectionToDataBase();

			String sql = "select * from books where " + searchType+ " like '%" + searchString + "%'offset " + pageSize + " limit 10;";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				book = new Book();
				book.setBookId(set.getInt("book_id"));
				book.setBookName(set.getString("book_name"));
				book.setBookDescription(set.getString("book_description"));
				book.setGenre(set.getString("genre"));
				book.setAuthorName(set.getString("author_id"));
				books.add(book);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return books;
	}
	
	public List<Book> searchBookByName(String searchString, int page) throws ClassNotFoundException {
		Book book = null;
		List<Book> books = new ArrayList<>();
		int pageSize = page *10;

		try {
			Connection connection = DBConnection.getConnectionToDataBase();

			String sql = "select * from books where book_name like '%" + searchString + "%'offset " + pageSize + " limit 10;";
			System.out.println((sql));
			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				book = new Book();
				book.setBookId(set.getInt("book_id"));
				book.setBookName(set.getString("book_name"));
				book.setBookDescription(set.getString("book_description"));
				book.setGenre(set.getString("genre"));
				book.setAuthorName(set.getString("author_id"));
				books.add(book);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return books;
	}
	
	public int getTotalBooks(String searchType, String searchString) throws ClassNotFoundException {
		int totalCount = 0;
		try {
			Connection connection = DBConnection.getConnectionToDataBase();

			String sql = "select count(*) from books where " + searchType + " like '%" + searchString + "%'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);
			
			while (set.next()) {
				totalCount = set.getInt(1);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return totalCount;
	}
	public int registerUser(User user) throws ClassNotFoundException {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDataBase();

			// write the insert query
			String insertQuery = "insert into users values(?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getFirstName());
			statement.setString(4, user.getLastName());
			statement.setInt(5, user.getAge());
			statement.setString(6, user.getActivity());

			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}
	
	public boolean validateUser(String username, String password) throws ClassNotFoundException{
		boolean isValidUser=false;
		try {
		
		// get the connection for the database
			Connection connection = DBConnection.getConnectionToDataBase();
		
		// write the select query
			String sql = "select * from users where username=? and password=?";
		
		// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
		
		// execute the statement and check whether user exists
			
			ResultSet set = statement.executeQuery();
			while(set.next()){
				isValidUser= true;
			}
		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return isValidUser;
	}

}
