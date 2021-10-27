package com.shop.ex.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.shop.ex.command.Command;
import com.shop.ex.command.cart.cartAddCommand;
import com.shop.ex.command.cart.cartAllDeleteCommand;
import com.shop.ex.command.cart.cartDeleteCommand;
import com.shop.ex.command.cart.cartListCommand;
import com.shop.ex.command.manager.ProductViewCommand;
import com.shop.ex.command.manager.deleteNoticeCommand;
import com.shop.ex.command.manager.managerNoticeCommand;
import com.shop.ex.command.manager.managerUserCommand;
import com.shop.ex.command.manager.productRegisterCommand;
import com.shop.ex.command.manager.searchNoticeCommnad;
import com.shop.ex.command.manager.searchUserCommand;
import com.shop.ex.command.manager.selectUserCommand;
import com.shop.ex.command.manager.writeNoticeCommand;
import com.shop.ex.command.notice.noticeListCommand;
import com.shop.ex.command.notice.viewNoticeCommand;
import com.shop.ex.command.orders.ProductOrdersCommand;
import com.shop.ex.command.product.ProductDescCommand;
import com.shop.ex.command.product.ProductSearchCommand;
import com.shop.ex.command.product.ServeCommand;
import com.shop.ex.command.qna.qnaListCommand;
import com.shop.ex.command.qna.qnaSearchKeywordCommand;
import com.shop.ex.command.qna.viewQNACommand;
import com.shop.ex.command.user.FindIdCommand;
import com.shop.ex.command.user.FinePWCommand;
import com.shop.ex.command.user.IdCheckCommand;
import com.shop.ex.command.user.LoginCommand;
import com.shop.ex.command.user.LoginOKCommand;
import com.shop.ex.command.user.MemberModifyCommand;
import com.shop.ex.command.user.MemberModifyOKCommand;
import com.shop.ex.command.user.MembershipOKCommand;
import com.shop.ex.dto.QnADTO;
import com.shop.ex.command.qna.inquiryListCommand;
import com.shop.ex.command.qna.productQNACommand;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }
    
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//String requestURI = request.getRequestURI();
		//System.out.println("requestURI " + requestURI);
		
		
		String commandName = request.getServletPath();
		//System.out.println("servletPath " +  commandName);
		String viewPage = null;
		Command command = null;
		int flag = 0;  //파악하기
		
		if(commandName.equals("/main.do")) {
			viewPage = "main.jsp";
		} else if(commandName.equals("/login.do")) {
			command = new LoginCommand();
			command.excute(request, response);
			viewPage = "login.jsp";
			flag = 1;
		} else if(commandName.equals("/loginOK.do")) {
			command = new LoginOKCommand();
			command.excute(request, response);
			
			HttpSession session = request.getSession();
			if(session.getAttribute("userInfo")==null) {
				viewPage="login.do";
			}else			
				viewPage = "main.do";
		} else if(commandName.equals("/idCheckOK.do")) {
			command = new IdCheckCommand();
			command.excute(request, response);
			viewPage = "idCheckOK.jsp";
		} else if(commandName.equals("/find_id.do")) {
			viewPage = "find_id.jsp";
		} else if(commandName.equals("/find_idOK.do")) {
			command = new FindIdCommand();
			command.excute(request, response);
			viewPage = "find_idOK.jsp";
			flag=1;
		} else if(commandName.equals("/find_password.do")) {
			viewPage = "find_password.jsp";
		} else if(commandName.equals("/find_passwordOK.do")) {
			command = new FinePWCommand();
			command.excute(request, response);
			viewPage = "find_passwordOK.jsp";
			flag=1;
		} else if(commandName.equals("/membership_join.do")) {
			viewPage = "membership_join.jsp";
		} else if(commandName.equals("/membershipOK.do")) {
			request.getSession().invalidate();
			command = new MembershipOKCommand();
			command.excute(request, response);
			viewPage = "login.do";
		} else if(commandName.equals("/memberModify.do")) {
			command = new MemberModifyCommand();
			command.excute(request, response);
			viewPage = "memberModify.jsp";
			flag=1;
		} else if(commandName.equals("/memberModifyOK.do")) {
			command = new MemberModifyOKCommand();
			command.excute(request, response);
			viewPage = "main.do"; 
//		} else if(commandName.equals("/memberModifyOK.do")) {  주문내역
//			command = new MemberModifyOKCommand();
//			command.excute(request, response);
//			viewPage = "main.do";
		} else if(commandName.equals("/logout.do")) {
			request.getSession().invalidate();
			viewPage = "main.do";
		} else if(commandName.equals("/serve.do")) {  //main 메뉴
			command = new ServeCommand();
			command.excute(request, response);
			viewPage = "serve.jsp";
			flag=1;
		} else if(commandName.equals("/productDesc.do")) { 
			command = new ProductDescCommand();
			command.excute(request, response);
			viewPage = "productDesc.jsp";
			flag=1;
		} else if(commandName.equals("/searchOK.do")) { 
			command = new ProductSearchCommand();
			command.excute(request, response);
			viewPage = "search.jsp";
			flag=1;
		} else if(commandName.equals("/productQNA.do")) { 
			command = new productQNACommand();
			command.excute(request, response);
			viewPage = "productDesc.do";
			flag=1;
		} else if(commandName.equals("/cartList.do")) {
			
			if(!sessionIdCheck(request)) {
				viewPage = "login.do";
			} else {
				command = new cartListCommand();
				command.excute(request, response);
				viewPage = "cartPage.jsp";
			}
			flag=1;
		} else if(commandName.equals("/cartAdd.do")) { 
			command = new cartAddCommand();
			command.excute(request, response);
			viewPage = "cartList.do";
		} else if(commandName.equals("/cartDelete.do")) { 
			command = new cartDeleteCommand();
			command.excute(request, response);
			viewPage = "cartList.do";
		} else if(commandName.equals("/cartAllDelete.do")) { 
			command = new cartAllDeleteCommand();
			command.excute(request, response);
			viewPage = "cartList.do";	
		} else if(commandName.equals("/.do")) { //결제되고 나면 올라갈 orders 
				command = new ProductOrdersCommand();
				command.excute(request, response);
		//공지사항
		} else if(commandName.equals("/notice.do")) { 
			command = new noticeListCommand();
			command.excute(request, response);
			viewPage = "service_center.jsp";
			flag=1;
		} else if(commandName.equals("/viewNotice.do")) { 
			command = new viewNoticeCommand();
			command.excute(request, response);
			viewPage = "view_notice.jsp";
			flag=1;
		//자주하는 질문
		} else if(commandName.equals("/askedQna.do")) { 
			command = new qnaListCommand();
			command.excute(request, response);
			viewPage = "asked_questions.jsp";
			flag=1;
		} else if(commandName.equals("/searchKeyword.do")) { 
			command = new qnaSearchKeywordCommand();
			command.excute(request, response);
			viewPage = "asked_questions.jsp";
			flag=1;
		//1대1 문의
		} else if(commandName.equals("/inquiry.do")) { 
			HttpSession session = request.getSession();
			if(session.getAttribute("userInfo")==null) {
				viewPage = "login.do";
			}else {
				command = new inquiryListCommand();
				command.excute(request, response);
				viewPage = "inquiry.jsp";
				flag=1;
			}	
		//매니저 
		} else if(commandName.equals("/managerUser.do")) {  //회원관리
			command = new managerUserCommand();
			command.excute(request, response);
			viewPage = "manager_user.jsp";
			flag=1;
		} else if(commandName.equals("/searchUser.do")) {  
			command = new searchUserCommand();
			command.excute(request, response);
			viewPage = "manager_user.jsp";
			flag=1;
		} else if(commandName.equals("/selectUser.do")) { 
			command = new selectUserCommand();
			command.excute(request, response);
			viewPage = "manager_user.jsp";
			flag=1;
		} else if(commandName.equals("/managerProduct.do")) { //상품관리  
			command = new ProductViewCommand();
			command.excute(request, response);
			viewPage = "manager_product.jsp";
			flag=1;
		} else if(commandName.equals("/productRegister.do")) { 
			command = new productRegisterCommand();
			command.excute(request, response);
			viewPage = "managerProduct.do";
		} else if(commandName.equals("/productView.do")) { 
			command = new ProductViewCommand();
			command.excute(request, response);
			viewPage = "managerProduct.do";	
			flag=1;
		} else if(commandName.equals("/managerNotice.do")) { 
			command = new managerNoticeCommand();
			command.excute(request, response);
			viewPage = "manager_notice.jsp";
			flag=1;	
		} else if(commandName.equals("/searchNotice.do")) { 
			command = new searchNoticeCommnad();
			command.excute(request, response);
			viewPage = "manager_notice.jsp";
			flag=1;		
		} else if(commandName.equals("/writeNotice.do")) { 
			command = new writeNoticeCommand();
			command.excute(request, response);
			viewPage = "managerNotice.do";
		} else if(commandName.equals("/deleteNotice.do")) { 
			command = new deleteNoticeCommand();
			command.excute(request, response);
			viewPage = "managerNotice.do";
		}			
			
		
		
//		} else if(commandName.equals("/productRegister.do")) {  //상품등록
//			command = new 
//			command.excute(request, response);
//			viewPage = "inquiry.jsp";
//		}	
			
		
		
		
//		} else if(commandName.equals("/viewQNA.do")) { //;1대1문의 보는데 사용
//			command = new viewQNACommand();
//			command.excute(request, response);
//			viewPage = "asked_questions.jsp";
//			flag=1;
		
		
		if(flag==0) {
			response.sendRedirect(viewPage);
		} else if(flag==1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);			
		}
		
	}
	// session id check func.
	protected boolean sessionIdCheck(HttpServletRequest request) {
//			System.out.println("session check");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo") == null) return false;
		else return true;
	}
}
