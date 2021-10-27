package com.shop.ex.command.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.QnADAO;
import com.shop.ex.dto.QnADTO;
import com.shop.ex.dto.UserDTO;

public class productQNACommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnADAO dao = QnADAO.getQnADAO();
		QnADTO dto = new QnADTO();
		HttpSession session = request.getSession();
		System.out.println("들어옴");
		String id = ((UserDTO)session.getAttribute("userInfo")).getId();
		dto.setId(id);
		String productId=request.getParameter("productId");
		dto.setProductId(productId);
		int categories=2;
		dto.setCategories(categories);
		dto.setTitle(request.getParameter("modal_tit"));
		dto.setContents(request.getParameter("modal_contents"));
		
		System.out.println("큐엔에이"+id);
		System.out.println(request.getParameter("productId"));
		System.out.println(request.getParameter("modal_tit"));
		System.out.println(request.getParameter("modal_contents"));
		dao.productQnaInsertDAO(dto, categories);

		request.setAttribute("productId", productId);
		
	}

}
