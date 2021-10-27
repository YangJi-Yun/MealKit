package com.shop.ex.command.orders;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.OrdersDAO;
import com.shop.ex.dto.OrdersDTO;
import com.shop.ex.dto.UserDTO;

public class ProductOrdersCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrdersDAO dao = OrdersDAO.getOrdersDAO();
		OrdersDTO dto = new OrdersDTO();
		HttpSession session = request.getSession();
		
		String id = ((UserDTO)session.getAttribute("userInfo")).getId();
//		System.out.println(id);
		dto.setId(id);
		dto.setProductId(request.getParameter("productId"));
		int price=Integer.parseInt(request.getParameter("select_price"));
		int quantity = Integer.parseInt(request.getParameter("select_quantity"));
		int total=price*quantity;
//		System.out.println(price+" "+quantity+" "+total);
		dto.setProductPrice(price);
		dto.setOdQuantity(quantity);
		dto.setTotalAmount(total);
		dao.productOrdersDAO(dto);
	}

}
