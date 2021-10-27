package com.shop.ex.command.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex.command.Command;
import com.shop.ex.dao.UserDAO;

public class IdCheckCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getUserDAO();
		String id=request.getParameter("id");
		int cnt=dao.idCheckDAO(id);
		HttpSession session = request.getSession();
		session.setAttribute("idCheckCnt", cnt);
		session.setAttribute("id", id);
	}

}
