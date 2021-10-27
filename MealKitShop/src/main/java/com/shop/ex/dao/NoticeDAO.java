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

import com.shop.ex.dto.NoticeDTO;

public class NoticeDAO {
	private static NoticeDAO noticeDAO = new NoticeDAO();
	private int sizeOfPage=20;
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String NOTICE_TABLE_NAME = "notice";
	private DataSource dataSource;
	private String sql=null;

	private NoticeDAO() {
		try {
			Context context = new InitialContext();
			dataSource=(DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static NoticeDAO getNoticeDAO() {
		return noticeDAO;
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
	
	public String replaceWtime(String wtime) {
		wtime=wtime.substring(0,11);
		return wtime;
	}
	
	public NoticeDTO getNoticeDTO(int no) {
		NoticeDTO dto = new NoticeDTO();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+NOTICE_TABLE_NAME+" where no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				dto.setmId(rs.getString("m_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setHit(rs.getInt("hit"));
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setWtime(rs.getString("wtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}		
		return dto;
	}
	public void increaseHit(int no) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="update "+NOTICE_TABLE_NAME+" set hit=hit+1 where no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			int result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
	}
	public int getCurrentNum() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select max(no) from "+NOTICE_TABLE_NAME;
		int curNum = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				curNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return curNum + 1;
	}
	
	public void writeOKDAO(NoticeDTO dto) {
		int curNum = getCurrentNum();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="insert into "+NOTICE_TABLE_NAME+" values (?,?,?,?,now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents());
			pstmt.setInt(4, curNum);
			int result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
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
	public int cntOfList() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select count(*) from "+NOTICE_TABLE_NAME;
		try {
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
	public ArrayList<NoticeDTO> noticeListDAO(int curPage){
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+NOTICE_TABLE_NAME+" order by no desc limit ?, ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setmId(rs.getString("m_id"));
				dto.setHit(rs.getInt("hit"));
				String wtime=rs.getString("wtime");
				wtime=replaceWtime(wtime);
				dto.setWtime(wtime);
				dto.setHit(rs.getInt("hit"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	public NoticeDTO viewNoticeDAO(int no) {
		increaseHit(no);
		NoticeDTO dto = new NoticeDTO();
		dto = getNoticeDTO(no);
		return dto;
	}
}
