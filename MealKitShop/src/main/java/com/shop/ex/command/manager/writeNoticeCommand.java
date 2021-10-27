package com.shop.ex.command.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dto.ManagerDTO;
import com.shop.ex.dto.NoticeDTO;

public class writeNoticeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao =ManagerDAO.getManagerDAO();
		
		HttpSession session = request.getSession();
		String mId=((ManagerDTO)session.getAttribute("userInfo")).getId();
		
		NoticeDTO dto = new NoticeDTO();
		dto.setmId(mId);
		dto.setTitle(request.getParameter("title"));
		dto.setContents(request.getParameter("contents"));
		dao.writeNoticeDAO(dto);
		
	}

}
