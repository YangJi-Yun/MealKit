package com.shop.ex.command.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.NoticeDAO;
import com.shop.ex.dto.NoticeDTO;

public class viewNoticeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = NoticeDAO.getNoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		int no =Integer.parseInt(request.getParameter("no"));
		dto=dao.viewNoticeDAO(no);
		request.setAttribute("dto", dto);
		System.out.println(dto.getContents());
		System.out.println(dto.getTitle());
	}

}
