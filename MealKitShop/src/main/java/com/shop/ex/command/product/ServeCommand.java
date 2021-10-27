package com.shop.ex.command.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;
import com.shop.ex.dao.ProductDAO;
import com.shop.ex.dto.ProductDTO;

public class ServeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getProductDAO();
		String categoryOrKind=request.getParameter("categoryOrKind");
		System.out.println(categoryOrKind);
		
		String data = request.getParameter("data");
		if(data==null) data="none";
		System.out.println("data: "+data);
		
		int curPage=0;
		if(request.getParameter("curPage")!=null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		if(categoryOrKind.equals("category")) {
			String productCategory = request.getParameter("productCategory");
			System.out.println(productCategory);
			String sql=dao.makeQuery(data, categoryOrKind);
//			System.out.println(sql);
			
			ArrayList<ProductDTO> list = dao.listDAO(curPage, productCategory, sql, categoryOrKind);
			int totalPage=dao.calTotalPage();
			int count=dao.countProduct(curPage, productCategory, sql,categoryOrKind);

			System.out.println("list.size: " + list.size());
			for(ProductDTO item:list) {
				System.out.println(item.getProductId());
			}
			System.out.println(totalPage);
			request.setAttribute("productCategory", productCategory);
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("count", count);
		}else if(categoryOrKind.equals("kind")){
			String productkind=request.getParameter("productKind");
			String sql=dao.makeQuery(data, categoryOrKind);
//			System.out.println(sql);
			
			ArrayList<ProductDTO> list = dao.listDAO(curPage, productkind, sql, categoryOrKind);
			int totalPage=dao.calTotalPage();
			int count=dao.countProduct(curPage, productkind, sql, categoryOrKind);
			
			
//			System.out.println("list.size: " + list.size());
//			for(ProductDTO item:list) {
//				System.out.println(item.getProductId());
//			}
			System.out.println(totalPage);
			
			request.setAttribute("productkind", productkind);
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("count", count);
		}
		
		
		
		String productCategory = request.getParameter("productCategory");
		String result = "";
		
		if(categoryOrKind.equals("category")) {
			result = request.getParameter("productCategory");
			request.setAttribute("type", categoryOrKind);
		}else if(categoryOrKind.equals("kind")){
			result = request.getParameter("productKind");
			request.setAttribute("type", categoryOrKind);
		}
		
		int totalResult = dao.cntOfListPaging(categoryOrKind, result);
		int sizeOfPage = dao.getSizeOfPage();
		
		
		System.out.println("총 개수: " + totalResult);
		System.out.println("한 페이지당 개수: " + sizeOfPage);
		System.out.println("현재 페이지: " + curPage);
		
		request.setAttribute("totalResult", totalResult);
		request.setAttribute("curPage", curPage);
		request.setAttribute("sizeOfPage", sizeOfPage);
		//request.setAttribute("categoryOrKind", categoryOrKind);
	}
}
