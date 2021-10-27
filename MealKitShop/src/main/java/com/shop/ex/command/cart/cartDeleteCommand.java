package com.shop.ex.command.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.CartDAO;
import com.shop.ex.dto.CartDTO;
import com.shop.ex.dto.UserDTO;

public class cartDeleteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO dao = CartDAO.getCartDAO();
		CartDTO dto = new CartDTO();
		HttpSession session = request.getSession();
		
		String id=((UserDTO)session.getAttribute("userInfo")).getId();
		String productId=request.getParameter("productId");
		int cartTotalAmount =Integer.parseInt(request.getParameter("cartTotalAmount"));
//		System.out.println(id+" "+productId+" "+cartTotalAmount);
		dto.setId(id);
		dto.setProductId(productId);
		dto.setCartTotalAmount(cartTotalAmount);
		dao.cartDeleteDAO(dto);
	}

}
