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

import com.shop.ex.dto.ProductDTO;
import com.shop.ex.dto.ProductDetailDTO;

public class ProductDAO {
	private static ProductDAO productDAO= new ProductDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String PRODUCT_TABLE_NAME = "product";
	private final String PRODUCT_DETAIL_TABLE_NAME = "product_detail";
	private final String QNA_TABLE_NAME = "qna";
	private DataSource dataSource;
	private String sql;
	private String yProductUse="y";
	private String nProductUse="n";
	private int sizeOfPage = 9; 
	
	
	public ProductDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/"+CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static ProductDAO getProductDAO() {
		return productDAO;
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
	public int cntOfList() {
		int cnt=0;
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select count(*) from "+PRODUCT_TABLE_NAME;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return cnt;
	}
	public int calTotalPage() {
		int numberOfArticles = cntOfList();
		int totalPage=numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage= numberOfArticles % sizeOfPage == 0 ? totalPage-1: totalPage;
		return totalPage;
	}
	
	public String makeQuery(String data, String categoryOrKind) {
		String sql=null;
		if(categoryOrKind.equals("category")) {
			if(data.equals("normal")) {
				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? limit ?, ?";
			}else if(data.equals("product_reg")) {
				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? order by "+data+" limit ?, ?";
//			}else if(data.equals("product_reg")) { 인기상품순: 판매수
//				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? order by "+data+" limit ?, ?";
			}else if(data.equals("discount")) {
				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? order by "+data+" limit ?, ?";
			}else if(data.equals("lowPrice")) {
				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? order by price limit ?, ?";
			}else if(data.equals("highPrice")) {
				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? order by price desc limit ?, ?";
			}else if(data.equals("none")) {
				sql="select product_id, product_image, product_name, price, discount, product_desc, product_category from "+PRODUCT_TABLE_NAME+" where product_category=? and product_use=? limit ?, ?";
			}
		}else if(categoryOrKind.equals("kind")){
			sql="select product_id, product_image, product_name, price, discount, product_desc, product_kind from "+PRODUCT_TABLE_NAME+" where product_kind=? and product_use=? limit ?, ?";
		}
		return sql;
		
	}
	public int countProduct(int curPage, String value, String sql, String categoryOrKind) {
		int count=0;
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String query="select count(*) from ("+sql+") as subproduct";
		try {
			pstmt=conn.prepareStatement(query);
			if(categoryOrKind.equals("category")) {
				pstmt.setString(1, value);
			}else if(categoryOrKind.equals("kind")){
				pstmt.setInt(1, Integer.parseInt(value));
			}
			pstmt.setString(2, yProductUse);
			pstmt.setInt(3, curPage*sizeOfPage);
			pstmt.setInt(4, sizeOfPage);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return count;
	}
	public ArrayList<ProductDTO> listDAO(int curPage, String value, String sql, String categoryOrKind){
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(sql);
			if(categoryOrKind.equals("category")) {
				pstmt.setString(1, value);
				pstmt.setString(2, yProductUse);
				pstmt.setInt(3, curPage*sizeOfPage);
				pstmt.setInt(4, sizeOfPage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setProductId(rs.getString("product_id"));
					dto.setProductImage(rs.getString("product_image"));
					dto.setProductName(rs.getString("product_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setDiscount(rs.getInt("discount"));
					dto.setProductDesc(rs.getString("product_desc"));
					dto.setProductCategory(rs.getString("product_category"));
					list.add(dto);
				}
			}else if(categoryOrKind.equals("kind")){
				pstmt.setInt(1, Integer.parseInt(value));
				pstmt.setString(2, yProductUse);
				pstmt.setInt(3, curPage*sizeOfPage);
				pstmt.setInt(4, sizeOfPage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setProductId(rs.getString("product_id"));
					dto.setProductImage(rs.getString("product_image"));
					dto.setProductName(rs.getString("product_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setDiscount(rs.getInt("discount"));
					dto.setProductDesc(rs.getString("product_desc"));
					dto.setProductKind(rs.getInt("product_kind"));
					list.add(dto);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	// 검색 리스트
	public int cntOfListSearch(String sword) {
		int cnt = 0;
		
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM " + PRODUCT_TABLE_NAME + " WHERE concat(product_name, product_desc, cost, price, discount, product_kind) LIKE ?";
		
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + sword + "%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}
		
		return cnt;
	}
	
	public ArrayList<ProductDTO> searchListDAO(int curPage, String sword){
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT product_id, product_image, product_name, cost, price, discount, product_desc, product_category FROM "+PRODUCT_TABLE_NAME+" WHERE concat(product_name, product_desc, cost, price, discount, product_kind) LIKE ? ORDER BY product_reg DESC limit ?, ?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%" + sword + "%");
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getString("product_id"));
				dto.setProductImage(rs.getString("product_image"));
				dto.setProductName(rs.getString("product_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setPrice(rs.getInt("price"));
				dto.setDiscount(rs.getInt("discount"));
				dto.setProductDesc(rs.getString("product_desc"));
				dto.setProductCategory(rs.getString("product_category"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int getSizeOfPage() {
		return sizeOfPage; 
	}
	
	
	public String replaceWtime(String wtime) {
		wtime=wtime.substring(0,11);
		return wtime;
	}
	public ProductDetailDTO productDescDAO(String productId) {
		ProductDetailDTO dto = new ProductDetailDTO();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select d.* from "+PRODUCT_TABLE_NAME+" p, "+PRODUCT_DETAIL_TABLE_NAME+" d where p.product_id=? and d.product_id=? and p.product_use=?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setString(2, productId);
			pstmt.setString(3, yProductUse);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setProductId(rs.getString("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setDiscount(rs.getInt("discount"));
				dto.setPrice(rs.getInt("price"));
				dto.setProductImage(rs.getString("product_image"));
				dto.setUnit(rs.getString("unit"));
				dto.setWeight(rs.getString("weight"));
				dto.setOrigin(rs.getString("origin"));
				dto.setShelfLife(rs.getString("shelf_life"));
				dto.setGuide(rs.getString("guide"));
				dto.setDescImage(rs.getString("desc_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int cntOfListPaging(String type, String result) {
		int cnt = 0;
		
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM " + PRODUCT_TABLE_NAME + " WHERE ";
		if(type.equals("category")) {
			sql = sql + "product_category=?";
		} else  if(type.equals("kind")) {
			sql = sql + "product_kind=?";
		}
		
		try {
			ps = conn.prepareStatement(sql);

			if(type.equals("category")) {
				ps.setString(1, result);
			} else  if(type.equals("kind")) {
				ps.setInt(1, Integer.parseInt(result));
			}
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}
		
		return cnt;
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
