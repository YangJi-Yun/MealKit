package com.shop.ex.dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.sql.DataSource;

import com.shop.ex.dto.NoticeDTO;
import com.shop.ex.dto.QnADTO;

public class QnADAO {
	private static QnADAO qnaDAO = new QnADAO();
	private int sizeOfPage=10;
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String QNA_TABLE_NAME = "qna";
	private DataSource dataSource;
	private String sql=null;
	private String yAnswer="y";
	private String yQnaKind="y";
	
	public QnADAO() {
		try {
			Context context = new InitialContext();
			dataSource=(DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static QnADAO getQnADAO() {
		return qnaDAO;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn=dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public QnADTO getQnADTO(int no) {
		QnADTO dto = new QnADTO();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+QNA_TABLE_NAME+" where where answer=? and qnaKind=? and no=?";
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, yAnswer);
			pstmt.setString(2, yQnaKind);
			pstmt.setInt(3, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setCategories(rs.getInt("categories"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}		
		return dto;
	}
	
	
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void increaseHit(int no) {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		sql="update "+QNA_TABLE_NAME+" set hit=hit+1 where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			int result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps, conn);
		}
	}
	public int cntOfList() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			sql="select count(*) from "+QNA_TABLE_NAME;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
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
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
		return totalPage;
	}
	public String replaceWtime(String wtime) {
		wtime=wtime.substring(0,11);
		return wtime;
	}
	public void productQnaInsertDAO(QnADTO dto, int categories) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="insert into "+QNA_TABLE_NAME+" (id, product_id, categories, title, contents, wtime) values (?,?,?,?,?,now())";
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getProductId());
			pstmt.setInt(3, categories);
			pstmt.setString(4, dto.getTitle());
			pstmt.setString(5, dto.getContents());
			int result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
	}
	//상품문의하고나서 리스트들(상품에 대한 qna)
	public ArrayList<QnADTO> productQnaListDAO(int curPage, String productId){
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+QNA_TABLE_NAME+" where product_id=? order by no desc limit ?, ?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setWtime(wtime);
				
				dto.setAnswer(rs.getString("answer"));
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
	
	public ArrayList<QnADTO> askedQnaListDAO(int curPage){
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+QNA_TABLE_NAME+" where answer=? and qnaKind=? order by no limit ?, ?";
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, yAnswer);
			pstmt.setString(2, yQnaKind);
			pstmt.setInt(3, curPage*sizeOfPage);
			pstmt.setInt(4, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setCategories(rs.getInt("categories"));
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
	public ArrayList<QnADTO> searchKeyword(int curPage, String searchKeyword){
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		sql="select * from "+QNA_TABLE_NAME+" where qnaKind=? and title like ? or contents like ? order by no desc limit ?, ?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, yQnaKind);
			pstmt.setString(2, "%" + searchKeyword + "%");
			pstmt.setString(3, "%" + searchKeyword + "%");
			pstmt.setInt(4, curPage*sizeOfPage);
			pstmt.setInt(5, sizeOfPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setCategories(rs.getInt("categories"));
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
	public ArrayList<QnADTO> inquiryListDAO(int curPage, String id){
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+QNA_TABLE_NAME+" where id=? order by no limit ?, ?";
//		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setCategories(rs.getInt("categories"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setWtime(wtime);
				
				dto.setAnswer(rs.getString("answer"));
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
	public QnADTO viewQNADAO(int no) {
		increaseHit(no);
		QnADTO dto = new QnADTO();
		dto = getQnADTO(no);
		return dto;
	}
	
}
