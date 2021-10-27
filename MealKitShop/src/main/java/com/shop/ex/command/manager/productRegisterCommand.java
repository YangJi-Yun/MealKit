package com.shop.ex.command.manager;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.ex.command.Command;
import com.shop.ex.dao.ManagerDAO;
import com.shop.ex.dto.ProductDTO;
import com.shop.ex.dto.ProductDetailDTO;

public class productRegisterCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		String path = request.getSession().getServletContext().getRealPath("/imageFolder");
		int size = 1024 * 1024 * 10; 
		
		try{
			MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
			
			
			String productId = multi.getParameter("productId");
			String productName = multi.getParameter("productName");
			String productDesc = multi.getParameter("productDesc");
			int cost = Integer.parseInt(multi.getParameter("cost"));
			int price =Integer.parseInt(multi.getParameter("price"));
			int discount = Integer.parseInt(multi.getParameter("discount"));
			String productImage=multi.getFilesystemName("productImage");
			int productKind = Integer.parseInt(multi.getParameter("productKind"));
			String productCategory = multi.getParameter("productCategory");
			String unit = multi.getParameter("unit");
			String weight = multi.getParameter("weight");
			String origin = multi.getParameter("origin");
			String shelfLife = multi.getParameter("shelfLife");
			String guide = multi.getParameter("guide");
			String descImage=multi.getFilesystemName("descImage");
			
//			System.out.println(productId);
//			System.out.println(productName);
//			System.out.println(productDesc);
//			System.out.println(cost);
//			System.out.println(price);
//			System.out.println(discount);
//			System.out.println(productImage);
//			System.out.println(productKind);
//			System.out.println(productCategory);
//			System.out.println(unit);
//			System.out.println(weight);
//			System.out.println(origin);
//			System.out.println(shelfLife);
//			System.out.println(guide);
//			System.out.println(descImage);
			
			ProductDTO dto = new ProductDTO();
			dto.setProductId(productId);
			dto.setProductName(productName);
			dto.setProductDesc(productDesc);
			dto.setCost(cost);
			dto.setPrice(price);
			dto.setDiscount(discount);
			dto.setProductImage(productImage);
			dto.setProductKind(productKind);
			dto.setProductCategory(productCategory);
			dao.productRegisterDAO(dto);
			
			ProductDetailDTO detail = new ProductDetailDTO();
			detail.setProductId(productId);
			detail.setProductName(productName);
			detail.setCost(cost);
			detail.setPrice(price);
			detail.setDiscount(discount);
			detail.setProductImage(productImage);
			detail.setUnit(unit);
			detail.setWeight(weight);
			detail.setOrigin(origin);
			detail.setShelfLife(shelfLife);
			detail.setGuide(guide);
			detail.setDescImage(descImage);
			dao.productDetailRegisterDAO(detail);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
