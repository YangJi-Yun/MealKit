package com.shop.ex.command.user;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.UserDAO;
import com.shop.ex.dto.UserDTO;

public class MemberModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getUserDAO();
		UserDTO dto = new UserDTO();
		dto.setId( ((UserDTO)request.getSession().getAttribute("userInfo")).getId() );
		request.setAttribute("dto", dao.memberModifyDAO(dto));
	}

}
