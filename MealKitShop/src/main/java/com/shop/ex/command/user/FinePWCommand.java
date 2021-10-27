package com.shop.ex.command.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.UserDAO;
import com.shop.ex.dto.UserDTO;

public class FinePWCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getUserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setName(request.getParameter("name"));
		dto.setId(request.getParameter("id"));
		dto.setEmail(request.getParameter("email"));
		
		String pw = dao.findPWDAO(dto);
//		System.out.println(pw);
		request.setAttribute("pw", pw);
	}

}
