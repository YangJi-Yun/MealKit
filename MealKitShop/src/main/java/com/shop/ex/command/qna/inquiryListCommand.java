package com.shop.ex.command.qna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.QnADAO;
import com.shop.ex.dto.QnADTO;
import com.shop.ex.dto.UserDTO;

public class inquiryListCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnADAO dao = QnADAO.getQnADAO();
		HttpSession session = request.getSession();
		String id=((UserDTO)session.getAttribute("userInfo")).getId();
//		System.out.println(id);
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<QnADTO> list = dao.inquiryListDAO(curPage, id);
		int totalPage =dao.calTotalPage();
//		System.out.println("totalPage " + totalPage);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
