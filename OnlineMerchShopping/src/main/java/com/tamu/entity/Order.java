package com.tamu.entity;

public class Order {

	private long orderId;
	private int bookId;
	private int userId;
	private String orderDate;
	private String dueDate;
	private int isReturned;
	private Book books;
	public int getIsReturned() {
		return isReturned;
	}
	public void setIsReturned(int isReturned) {
		this.isReturned = isReturned;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

}
