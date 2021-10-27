package com.shop.ex.command.qna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.QnADAO;
import com.shop.ex.dto.QnADTO;

public class qnaSearchKeywordCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnADAO dao = QnADAO.getQnADAO();
		String searchKeyword = request.getParameter("searchKeyword");
//		System.out.println(searchKeyword);
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<QnADTO> list = dao.searchKeyword(curPage, searchKeyword);
		int totalPage =dao.calTotalPage();
		
//		if(list==null) System.out.println("null");
//		else	System.out.println(list.size());
//		for(QnADTO item:list) {
//			System.out.println(item.getNo());
//			System.out.println(item.getCategories());
//			System.out.println(item.getTitle());
//			System.out.println(item.getContents());
//			System.out.println("-------------------------");
//		}	
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
