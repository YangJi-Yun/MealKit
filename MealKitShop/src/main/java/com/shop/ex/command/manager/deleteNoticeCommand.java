package com.shop.ex.command.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dao.NoticeDAO;
import com.shop.ex.dto.NoticeDTO;

public class deleteNoticeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao= ManagerDAO.getManagerDAO();
		
		String noStr= request.getParameter("chk_arr");
		System.out.println(noStr);
		dao.deleteNoticeDAO(noStr);
		
	}

}
