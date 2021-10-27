package com.shop.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop.ex.dto.OrdersDTO;

public class OrdersDAO {
	private static OrdersDAO ordersDAO = new OrdersDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String ORDERS_TABLE_NAME = "orders";
	private final String PRODUCT_TABLE_NAME = "product";
	private final String USER_TABLE_NAME = "user";
	private DataSource dataSource;
	private String sql;

	public OrdersDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/"+CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static OrdersDAO getOrdersDAO() {
		return ordersDAO;
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
	public void productOrdersDAO(OrdersDTO dto) {//결제 후에 올라감
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="insert into "+ORDERS_TABLE_NAME+" values (?,?,?,?,?,?,now())";
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "11111111"); // 주문내역 아이디
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getProductId());
			pstmt.setInt(4, dto.getProductPrice());
			pstmt.setInt(5, dto.getOdQuantity());
			pstmt.setInt(6, dto.getTotalAmount());
			int reuslt=pstmt.executeUpdate();
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
