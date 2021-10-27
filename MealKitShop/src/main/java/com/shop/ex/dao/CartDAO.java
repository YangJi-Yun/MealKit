package com.shop.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop.ex.dto.CartDTO;
import com.shop.ex.dto.UserDTO;

	public class CartDAO {
	private static CartDAO cartDAO = new CartDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String CART_TABLE_NAME = "cart";
	private final String PRODUCT_TABLE_NAME = "product";
	private final String USER_TABLE_NAME = "user";
	private DataSource dataSource;
	private String sql;

	public CartDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/"+CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static CartDAO getCartDAO() {
		return cartDAO;
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn=dataSource.getConnection();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public UserDTO addrInfoDAO(String id) {
		UserDTO dto = new UserDTO();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+USER_TABLE_NAME+" where id=?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddress(rs.getString("roadAddress"));
				dto.setJibunAddress(rs.getString("jibunAddress"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return dto;
	}
	public ArrayList<CartDTO> cartListDAO(String id){
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//sql="select * from "+CART_TABLE_NAME+" where id=?";
		sql = "SELECT c.*, p.product_image FROM "+CART_TABLE_NAME+" c, "+PRODUCT_TABLE_NAME+" p WHERE c.id = ? AND c.product_id = p.product_id";
		//System.out.println(sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setProductId(rs.getString("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setCartQuantity(rs.getInt("cart_quantity"));
				dto.setCartTotalAmount(rs.getInt("cart_total_amount"));
				dto.setProductImage(rs.getString("product_image"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public void cartAddDAO(CartDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="insert into "+CART_TABLE_NAME+" values (?,?,?,?,?,?,now())";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getProductId());
			pstmt.setString(3, dto.getProductName());
			pstmt.setInt(4, dto.getProductPrice());
			pstmt.setInt(5, dto.getCartQuantity());
			pstmt.setInt(6, dto.getCartTotalAmount());
			int result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void cartDeleteDAO(CartDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="delete from "+CART_TABLE_NAME+" where id=? and product_id=? and cart_total_amount=?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getProductId());
			pstmt.setInt(3, dto.getCartTotalAmount());
			int result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void cartAllDeleteDAO(String id) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="delete from "+CART_TABLE_NAME+" where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn){
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close(PreparedStatement pstmt, Connection conn){
		
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
}
