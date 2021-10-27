package com.shop.ex.command.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.UserDAO;
import com.shop.ex.dto.ManagerDTO;
import com.shop.ex.dto.UserDTO;

public class LoginOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getUserDAO();
		UserDTO dto = new UserDTO();
		String id =request.getParameter("id");
		String pw=request.getParameter("pw");
		String rememberID = request.getParameter("rememberID"); // 쿠키 저장 여부 - chk or null
		dto.setId(id);
		dto.setPw(pw);
		
		HttpSession session = request.getSession();
		dto=dao.loginOKDAO(dto);
		if(dto==null) {
			ManagerDTO dtoM = new ManagerDTO();
			dtoM.setmId(id);
			dtoM.setmPw(pw);
			dtoM=dao.managerLoginOKD(dtoM);
			if(dtoM==null) {
				session.setAttribute("loginFail", "fail");
			}else {
				session.setAttribute("userInfo", dtoM);
				session.setAttribute("loginFail", "succ");
			}
		}else {
			session.setAttribute("userInfo", dto);
			session.setAttribute("loginFail", "succ");
	
			// Cookie 추가
			System.out.println("id " + id + " pw " + pw + " rememberID " + rememberID );
			
			if(rememberID != null && rememberID.equals("chk")) {
				System.out.println("쿠키추가");
				
				Cookie id_cookie = new Cookie("memberId", java.net.URLEncoder.encode(id, "utf-8"));
				id_cookie.setComment("아이디 저장");
				id_cookie.setPath("/");				
				id_cookie.setMaxAge(60 * 60 * 24 * 365);
				response.addCookie(id_cookie);
				
			} else {
				System.out.println("쿠키삭제");
				
				Cookie[] cookies = request.getCookies();
				
				if(cookies != null)
				{
					for(int i=0; i<cookies.length; i++)
					{
						String cookieName = cookies[i].getName();
						if(cookieName.equals("memberId"))
						{
							cookies[i].setPath("/");
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}				
				}
			}
		}
	}
}
