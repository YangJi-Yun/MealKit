package com.shop.ex.dto;

public class CartDTO {
	private String id;
	private String productId;
	private String productName;
	private String productImage;
	private int productPrice;
	private int cartQuantity;
	private int cartTotalAmount;
	private String cartIndate;
	
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public int getCartTotalAmount() {
		return cartTotalAmount;
	}
	public void setCartTotalAmount(int cartTotalAmount) {
		this.cartTotalAmount = cartTotalAmount;
	}
	public String getCartIndate() {
		return cartIndate;
	}
	public void setCartIndate(String cartIndate) {
		this.cartIndate = cartIndate;
	}
	
	
	
	
}
