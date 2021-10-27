package com.shop.ex.command.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dao.NoticeDAO;
import com.shop.ex.dto.ManagerDTO;
import com.shop.ex.dto.NoticeDTO;

public class noticeListCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = NoticeDAO.getNoticeDAO();
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<NoticeDTO> list = dao.noticeListDAO(curPage);
		System.out.println("시작");
//		for(NoticeDTO item:list) {
//			System.out.println(item.getNo());
//			System.out.println(item.getTitle());
//			System.out.println(item.getmId());
//			System.out.println(item.getWtime());
//			System.out.println(item.getHit());
//			System.out.println("-------------------------");
//		}
		int totalPage = dao.calTotalPage();
		
//		System.out.println("totalPage " + totalPage);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
		
	}

}
