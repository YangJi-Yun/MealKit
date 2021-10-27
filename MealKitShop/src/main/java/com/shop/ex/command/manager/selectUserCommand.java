package com.shop.ex.command.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dto.UserDTO;

public class selectUserCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		String selectUser=request.getParameter("user");
		System.out.println("selectUser: "+selectUser);
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		if(selectUser.equals("n")) {
			list=dao.managerUserDAO(curPage);
		}else {
			list=dao.selectUser(curPage, selectUser);
		}
		
		
		int totalResult = dao.cntOfListPaging();
		int sizeOfPage = dao.getSizeOfPage();
		
		
		System.out.println("총 개수: " + totalResult);
		System.out.println("한 페이지당 개수: " + sizeOfPage);
		System.out.println("현재 페이지: " + curPage);
		System.out.println("리스트 사이즈: " + list.size());
//		for(UserDTO item:list) {
//			System.out.println(item.getName());
//			System.out.println("-------------------------");
//		}
		
		request.setAttribute("list", list);
		request.setAttribute("selectUser", selectUser);
		request.setAttribute("totalResult", totalResult);
		request.setAttribute("curPage", curPage);
		request.setAttribute("sizeOfPage", sizeOfPage);
	}

}
