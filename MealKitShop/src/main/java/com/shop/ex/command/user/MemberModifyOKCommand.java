package com.shop.ex.command.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.UserDAO;
import com.shop.ex.dto.UserDTO;

public class MemberModifyOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getUserDAO();
		UserDTO dto = new UserDTO();
		HttpSession session = request.getSession();
		dto.setId( ((UserDTO)request.getSession().getAttribute("userInfo")).getId() );
		dto.setName(request.getParameter("name"));
		dto.setPw(request.getParameter("pw"));
		dto.setEmail(request.getParameter("email"));
		dto.setPostcode(request.getParameter("postcode"));
		dto.setRoadAddress(request.getParameter("roadAddress"));
		dto.setJibunAddress(request.getParameter("jibunAddress"));
		dto.setDetailAddress(request.getParameter("detailAddress"));
		dto.setExtraAddress(request.getParameter("extraAddress"));
		dto.setBirthYear( Integer.parseInt(request.getParameter("birthYear")) );
		dto.setBirthMonth( Integer.parseInt(request.getParameter("birthMonth")) );
		dto.setBirthDate( Integer.parseInt(request.getParameter("birthDate")) );
		dto.setCellphone(request.getParameter("cellphone"));
		dto.setGender(request.getParameter("gender"));
		dao.memberModifyOKDAO(dto);
		
		session.setAttribute("userInfo", dto);
		
	}

}
