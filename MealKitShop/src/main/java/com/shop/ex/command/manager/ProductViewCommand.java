package com.shop.ex.command.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dto.ProductDTO;
import com.shop.ex.dto.ProductDetailDTO;

public class ProductViewCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
				
		int curPage=0;
		if(request.getParameter("curPage")!=null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage=dao.calTotalPage();
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list=dao.productListDAO(curPage);
		
		String productId=null;
		for(ProductDTO item:list) {
			productId=item.getProductId();
		}
		
		ArrayList<ProductDetailDTO> listD = new ArrayList<ProductDetailDTO>();
		listD=dao.productDetailListDAO(productId);
		
//		System.out.println(totalPage);
		request.setAttribute("list", list);
		request.setAttribute("listD", listD);
		request.setAttribute("totalPage", totalPage);
		
		
	}

}
