package com.shop.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop.ex.dto.ManagerDTO;
import com.shop.ex.dto.UserDTO;

public class UserDAO {
	private static UserDAO userDAO = new UserDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/shop";
	private final String TABLE_NAME = "user";
	private final String MANAGER_TABLE_NAME = "manager";
	private DataSource dataSource;
	private String sql;

	public UserDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/"+CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static UserDAO getUserDAO() {
		return userDAO;
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
	public UserDTO getUserDTO(UserDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+TABLE_NAME+" where id=? and pw=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddress(rs.getString("roadAddress"));
				dto.setJibunAddress(rs.getString("jibunAddress"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				dto.setBirthYear(rs.getInt("birthYear"));
				dto.setBirthMonth(rs.getInt("birthMonth"));
				dto.setBirthDate(rs.getInt("birthDate"));
				dto.setCellphone(rs.getString("cellphone"));
				dto.setGender(rs.getString("gender"));
				dto.setVerify(rs.getInt("verify"));
			}else {
				dto=null;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);;
		}		
		return dto;
	}
	
	public int idCheckDAO(String id) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		sql="select count(*) from "+TABLE_NAME+" where id=?";
		int cnt=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
				System.out.println(cnt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);;
		}	
		return cnt;
	}
	public String replaceString(String str) {
		char[] Arr=str.toCharArray();
		char c ='*';
		for(int i =str.length()-3; i<str.length();i++) {
			Arr[i]=c;
		}
//		for(int j=0; j<Arr.length; j++) {
//			System.out.println(idArr[j]);
//		}
		str=String.valueOf(Arr);
		return str;
	}
	public String findIDDAO(UserDTO dto) {
		String id=null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select id from "+TABLE_NAME+" where name=? and email=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getEmail());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}		
		if(id==null) return id;
		else {
			id=replaceString(id);
			return id;
		}
	}
	public String findPWDAO(UserDTO dto) {
		String pw=null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select pw from "+TABLE_NAME+" where id=? and name=? and email=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2,dto.getName());
			pstmt.setString(3,dto.getEmail());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pw=rs.getString("pw");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}
		if(pw==null) return pw;
		else {
			pw=replaceString(pw);
			return pw;
		}
	}
	public void membershipOKDAO(UserDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="insert into "+TABLE_NAME+" (name, id, pw, email, postcode, roadAddress, jibunAddress, detailAddress, extraAddress, birthYear, birthMonth, birthDate, cellphone, gender, wtime) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
		System.out.println(sql);
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPostcode());
			pstmt.setString(6, dto.getRoadAddress());
			pstmt.setString(7, dto.getJibunAddress());
			pstmt.setString(8, dto.getDetailAddress());
			pstmt.setString(9, dto.getExtraAddress());
			pstmt.setInt(10, dto.getBirthYear());
			pstmt.setInt(11, dto.getBirthMonth());
			pstmt.setInt(12, dto.getBirthDate());
			pstmt.setString(13, dto.getCellphone());
			pstmt.setString(14, dto.getGender());
			int result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}		
	}
	public UserDTO memberModifyDAO(UserDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = dto.getId();
		System.out.println(id);
		sql="select * from "+TABLE_NAME+" where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddress(rs.getString("roadAddress"));
				dto.setJibunAddress(rs.getString("jibunAddress"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				dto.setBirthYear(rs.getInt("birthYear"));
				dto.setBirthMonth(rs.getInt("birthMonth"));
				dto.setBirthDate(rs.getInt("birthDate"));
				dto.setCellphone(rs.getString("cellphone"));
				dto.setGender(rs.getString("gender"));
			}else dto=null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);;
		}		
		return dto;
	}
	public void memberModifyOKDAO(UserDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		sql="update "+TABLE_NAME+" set pw=?, name=?, email=?, cellphone=?, postcode=?, roadAddress=?, jibunAddress=?, detailAddress=?, extraAddress=?, gender=?, birthYear=?, birthMonth=?, birthDate=? where id=?";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getCellphone());
			pstmt.setString(5, dto.getPostcode());
			pstmt.setString(6, dto.getRoadAddress());
			pstmt.setString(7, dto.getJibunAddress());
			pstmt.setString(8, dto.getDetailAddress());
			pstmt.setString(9, dto.getExtraAddress());
			pstmt.setString(10, dto.getGender());
			pstmt.setInt(11, dto.getBirthYear());
			pstmt.setInt(12, dto.getBirthMonth());
			pstmt.setInt(13, dto.getBirthDate());
			pstmt.setString(14, dto.getId());
			int result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}	
	}
	public UserDTO loginOKDAO(UserDTO dto) {
		dto = getUserDTO(dto);
		return dto;
	}
	public ManagerDTO managerLoginOKD(ManagerDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql="select * from "+MANAGER_TABLE_NAME+" where m_id=? and m_pw=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("m_id"));
				dto.setVerify(rs.getInt("verify"));
			}else {
				dto=null;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);;
		}		
		return dto;
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
