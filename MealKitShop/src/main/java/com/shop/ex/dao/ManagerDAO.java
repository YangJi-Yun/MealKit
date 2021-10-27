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

import com.shop.ex.dto.ManagerDTO;
import com.shop.ex.dto.NoticeDTO;
import com.shop.ex.dto.ProductDTO;
import com.shop.ex.dto.ProductDetailDTO;
import com.shop.ex.dto.UserDTO;

public class ManagerDAO{
	private static ManagerDAO managerDAO = new ManagerDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String MANAGER_TABLE_NAME = "manager";
	private final String USER_TABLE_NAME = "user";
	private final String PRODUCT_TABLE_NAME = "product";
	private final String PRODUCT_DETAIL_TABLE_NAME = "product_detail";
	private final String ORDERS_TABLE_NAME = "orders";
	private final String NOTICE_TABLE_NAME = "notice";
	private final String QNA_TABLE_NAME = "qna";
	private DataSource dataSource;
	private String sql;
	private int sizeOfPage=10;
	private String nWithdrawal="n";
	private String yWithdrawal="y";
	private String yProductUse="y";

	public ManagerDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/"+CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static ManagerDAO getManagerDAO() {
		return managerDAO;
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
	public int cntOfList( ) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select count(*) from "+USER_TABLE_NAME;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);;
		}
		return cnt;
	}
	public int calTotalPage() {
		int numberOfArticles=cntOfList();
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
		return totalPage; 
	}
	public String replaceWtime(String wtime) {
		wtime=wtime.substring(0,11);
		return wtime;
	}
	public ArrayList<UserDTO> managerUserDAO(int curPage){
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+USER_TABLE_NAME+" where withdrawal=? order by name limit ?, ?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nWithdrawal);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				String wTime=rs.getString("wTime");
				wTime=replaceWtime(wTime);
				dto.setwTime(wTime);
				
				dto.setWithdrawal(rs.getString("withdrawal"));
				dto.setCellphone(rs.getString("cellphone"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setBirthYear(rs.getInt("birthYear"));
				dto.setBirthMonth(rs.getInt("birthMonth"));
				dto.setBirthDate(rs.getInt("birthDate"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddress(rs.getString("roadAddress"));
				dto.setJibunAddress(rs.getString("jibunAddress"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<UserDTO> searchKeyword(int curPage, String searchKeyword){
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+USER_TABLE_NAME+" where name like ? or id like ? or cellphone like ? or email like ? order by name limit ?, ?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchKeyword + "%");
			pstmt.setString(2, "%" + searchKeyword + "%");
			pstmt.setString(3, "%" + searchKeyword + "%");
			pstmt.setString(4, "%" + searchKeyword + "%");
			pstmt.setInt(5, curPage*sizeOfPage);
			pstmt.setInt(6, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setwTime(wtime);
				
				dto.setWithdrawal(rs.getString("withdrawal"));
				dto.setCellphone(rs.getString("cellphone"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setBirthYear(rs.getInt("birthYear"));
				dto.setBirthMonth(rs.getInt("birthMonth"));
				dto.setBirthDate(rs.getInt("birthDate"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddress(rs.getString("roadAddress"));
				dto.setJibunAddress(rs.getString("jibunAddress"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<UserDTO> selectUser(int curPage, String selectUser){
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+USER_TABLE_NAME+" where name like ? or id like ? or cellphone like ? or email like ? order by name limit ?, ?";
//		System.out.println(sql);
		try {
			if(selectUser.equals("y")){
				sql="select * from "+USER_TABLE_NAME+" where withdrawal=? order by name limit ?, ?";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, yWithdrawal);
				pstmt.setInt(2, curPage*sizeOfPage);
				pstmt.setInt(3, sizeOfPage);
			}else if(selectUser.equals("0")){
				sql="select * from "+USER_TABLE_NAME+" order by name limit ?, ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, curPage*sizeOfPage);
				pstmt.setInt(2, sizeOfPage);
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setwTime(wtime);
				
				dto.setWithdrawal(rs.getString("withdrawal"));
				dto.setCellphone(rs.getString("cellphone"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setBirthYear(rs.getInt("birthYear"));
				dto.setBirthMonth(rs.getInt("birthMonth"));
				dto.setBirthDate(rs.getInt("birthDate"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddress(rs.getString("roadAddress"));
				dto.setJibunAddress(rs.getString("jibunAddress"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<ProductDTO> productListDAO(int curPage){
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+PRODUCT_TABLE_NAME+" where product_use=? order by product_reg desc limit ?, ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, yProductUse);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getString("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductDesc(rs.getString("product_desc"));
				dto.setCost(rs.getInt("cost"));
				dto.setPrice(rs.getInt("price"));
				dto.setDiscount(rs.getInt("discount"));
				dto.setProductImage(rs.getString("product_image"));
				dto.setProductUse(rs.getString("product_use"));
				dto.setProductReg(rs.getString("product_reg"));
				dto.setProductKind(rs.getInt("product_kind"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<ProductDetailDTO> productDetailListDAO(String productId){
		ArrayList<ProductDetailDTO> listD = new ArrayList<ProductDetailDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select d.* from "+PRODUCT_TABLE_NAME+" p, "+PRODUCT_DETAIL_TABLE_NAME+" d where p.product_use=? and p.product_id=? and d.product_id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, yProductUse);
			pstmt.setString(2, productId);
			pstmt.setString(3, productId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDetailDTO dtoD= new ProductDetailDTO();
				dtoD.setUnit(rs.getString("unit"));
				dtoD.setWeight(rs.getString("weight"));
				dtoD.setOrigin(rs.getString("origin"));
				dtoD.setShelfLife(rs.getString("shelf_life"));
				dtoD.setGuide(rs.getString("guide"));
				dtoD.setDescImage(rs.getString("desc_image"));
				listD.add(dtoD);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return listD;
	}
	public void productRegisterDAO(ProductDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		try {
				sql="insert into "+PRODUCT_TABLE_NAME+" (product_id, product_name, product_desc, cost, price, discount, product_image, product_use, product_reg, product_kind, product_category) values (?,?,?,?,?,?,?,?,now(),?,?)";
//				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getProductId());
				pstmt.setString(2, dto.getProductName());
				pstmt.setString(3, dto.getProductDesc());
				pstmt.setInt(4, dto.getCost());
				pstmt.setInt(5, dto.getPrice());
				pstmt.setInt(6, dto.getDiscount());
				pstmt.setString(7, dto.getProductImage());
				pstmt.setString(8, yProductUse);
				pstmt.setInt(9, dto.getProductKind());
				pstmt.setString(10, dto.getProductCategory());
			int result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
	}
	public void productDetailRegisterDAO(ProductDetailDTO detail) {
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		try {
			sql="insert into "+PRODUCT_DETAIL_TABLE_NAME+" (product_id, product_name, cost, price, discount, product_image, unit, weight, origin, shelf_life, guide, desc_image) values (?,?,?,?,?,?,?,?,?,?,?,?)";
//			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, detail.getProductId());
			pstmt.setString(2, detail.getProductName());
			pstmt.setInt(3, detail.getCost());
			pstmt.setInt(4, detail.getPrice());
			pstmt.setInt(5, detail.getDiscount());
			pstmt.setString(6, detail.getProductImage());
			pstmt.setString(7, detail.getUnit());
			pstmt.setString(8, detail.getWeight());
			pstmt.setString(9, detail.getOrigin());
			pstmt.setString(10, detail.getShelfLife());
			pstmt.setString(11, detail.getGuide());
			pstmt.setString(12, detail.getDescImage());
			int result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
	}
	public ArrayList<NoticeDTO> managerNoticeDAO(int curPage){
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+NOTICE_TABLE_NAME+" order by no desc limit ?, ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setmId(rs.getString("m_id"));
				dto.setHit(rs.getInt("hit"));
				
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setWtime(wtime);
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<NoticeDTO> searchNotice(int curPage, String searchKeyword){
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+NOTICE_TABLE_NAME+" where m_id like ? or title like ? or contents like ? order by no desc limit ?, ?";
		System.out.println(sql);
		try {
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchKeyword + "%");
			pstmt.setString(2, "%" + searchKeyword + "%");
			pstmt.setString(3, "%" + searchKeyword + "%");
			pstmt.setInt(4, curPage*sizeOfPage);
			pstmt.setInt(5, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setmId(rs.getString("m_id"));
				dto.setHit(rs.getInt("hit"));
				
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setWtime(wtime);
				
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	public void writeNoticeDAO(NoticeDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		sql="insert into "+NOTICE_TABLE_NAME+" (m_id, title, contents, wtime) values (?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents());
			int result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
	}
	public void deleteNoticeDAO(String noStr) {
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		try {
			String[] num=noStr.split(",");
			for(int i=0; i<num.length; i++) {
				int no=Integer.parseInt(num[i]);
				sql="delete from "+NOTICE_TABLE_NAME+"where no=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				int result=pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
	}
	
	public int cntOfListPaging() {
		int cnt = 0;
		
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM " + USER_TABLE_NAME;
		
		try {
			ps = conn.prepareStatement(sql);
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
	public int getSizeOfPage() {
		return sizeOfPage; 
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
