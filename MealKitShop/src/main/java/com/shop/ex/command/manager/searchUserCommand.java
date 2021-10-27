package com.shop.ex.command.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dto.UserDTO;

public class searchUserCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		String searchKeyword=request.getParameter("searchKeyword");
//		System.out.println(searchKeyword);
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		list = dao.searchKeyword(curPage, searchKeyword);
		
		int totalPage =dao.calTotalPage();
//		System.out.println("totalPage" + totalPage);
//		
//		for(UserDTO item:list) {
//			System.out.println(item.getName());
//			System.out.println("-------------------------");
//		}
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
