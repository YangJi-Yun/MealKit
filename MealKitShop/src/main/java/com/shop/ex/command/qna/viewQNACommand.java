package com.shop.ex.command.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.QnADAO;
import com.shop.ex.dto.QnADTO;

public class viewQNACommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnADAO dao = QnADAO.getQnADAO();
		QnADTO dto = new QnADTO();
		int no = Integer.parseInt(request.getParameter("no"));
		dto=dao.viewQNADAO(no);
		request.setAttribute("dto", dto);
		System.out.println(dto.getContents());
	}

}
