package com.shop.ex.command.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dto.NoticeDTO;

public class managerNoticeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		list=dao.managerNoticeDAO(curPage);
		int totalPage=dao.calTotalPage();
		
//		for(NoticeDTO item:list) {
//			System.out.println(item.getNo());
//			System.out.println("-------------------------");
//		}
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
