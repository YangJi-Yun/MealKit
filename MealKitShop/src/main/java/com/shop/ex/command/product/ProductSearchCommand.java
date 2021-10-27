package com.shop.ex.command.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ProductDAO;
import com.shop.ex.dto.ProductDTO;

public class ProductSearchCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getProductDAO();
		String sword = request.getParameter("sword");
		
		// 페이징
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		ArrayList<ProductDTO> list = dao.searchListDAO(curPage, sword);
		int totalResult = dao.cntOfListSearch(sword);
		int sizeOfPage = dao.getSizeOfPage();
		
		System.out.println("총 개수: " + totalResult);
		System.out.println("한 페이지당 개수: " + sizeOfPage);
		System.out.println("현재 페이지: " + curPage);
		System.out.println("리스트 사이즈: " + list.size());
		
		request.setAttribute("totalResult", totalResult);
		request.setAttribute("curPage", curPage);
		request.setAttribute("sizeOfPage", sizeOfPage);
		request.setAttribute("sword", sword);
		request.setAttribute("list", list);
		

//		for(ProductDTO item:list) {
//			System.out.println(item.getProductId());
//			System.out.println(item.getProductImage());
//			System.out.println(item.getProductName());
//			System.out.println(item.getPrice());
//			System.out.println(item.getDiscount());
//			System.out.println(item.getProductCategory());
//			System.out.println("-------------------------");
//		}
	}

}
