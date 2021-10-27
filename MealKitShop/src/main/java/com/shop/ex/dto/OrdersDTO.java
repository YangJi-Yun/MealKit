package com.shop.ex.dto;

public class OrdersDTO {
	private String ordersId;
	private String id;
	private String productId;
	private int odQuantity;
	private int productPrice;
	private int totalAmount;
	private String ordersIndate;
	
	public String getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getOdQuantity() {
		return odQuantity;
	}
	public void setOdQuantity(int odQuantity) {
		this.odQuantity = odQuantity;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getOrdersIndate() {
		return ordersIndate;
	}
	public void setOrdersIndate(String ordersIndate) {
		this.ordersIndate = ordersIndate;
	}
	
	
	
	
}
