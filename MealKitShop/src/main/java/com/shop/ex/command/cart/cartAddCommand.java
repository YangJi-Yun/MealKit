package com.shop.ex.command.cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.CartDAO;
import com.shop.ex.dto.CartDTO;
import com.shop.ex.dto.UserDTO;

public class cartAddCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO dao = CartDAO.getCartDAO();
		CartDTO dto = new CartDTO();
		HttpSession session = request.getSession();
		
		String id=((UserDTO)session.getAttribute("userInfo")).getId();
		String productId=request.getParameter("productId");
		String productName=request.getParameter("productName");
		int price=Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("select_quantity"));
		int total=price*quantity;
		System.out.println(productId);
		System.out.println(productName+" "+price+" "+quantity+" "+total);

		dto.setId(id);
		dto.setProductId(productId);
		dto.setProductName(productName);
		dto.setProductPrice(price);
		dto.setCartQuantity(quantity);
		dto.setCartTotalAmount(total);
		dao.cartAddDAO(dto);
		
	}

}
