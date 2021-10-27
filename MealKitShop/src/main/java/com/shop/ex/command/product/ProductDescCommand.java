package com.shop.ex.command.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ProductDAO;
import com.shop.ex.dao.QnADAO;
import com.shop.ex.dto.ProductDetailDTO;
import com.shop.ex.dto.QnADTO;

public class ProductDescCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getProductDAO();
		String productId = request.getParameter("productId");
		ProductDetailDTO dto = new ProductDetailDTO();
		dto=dao.productDescDAO(productId);
		System.out.println("1"+dto.getProductImage());
		System.out.println("2"+dto.getDescImage());
		
		QnADAO daoQ = QnADAO.getQnADAO();
		int curPageQ = 0;
		if(request.getParameter("curPageQ") != null)
			curPageQ = Integer.parseInt(request.getParameter("curPageQ"));
		ArrayList<QnADTO> listQ = new ArrayList<QnADTO>();
		listQ = daoQ.productQnaListDAO(curPageQ, productId);
		int totalPageQ =daoQ.calTotalPage();
//		System.out.println("totalPageQ" + totalPageQ);
//		
//		for(QnADTO item:listQ) {
//			System.out.println(item.getNo());
//			System.out.println("-------------------------");
//		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("listQ", listQ);
		request.setAttribute("totalPageQ", totalPageQ);
	}

}
