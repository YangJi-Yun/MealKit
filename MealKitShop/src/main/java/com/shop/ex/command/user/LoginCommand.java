package com.shop.ex.command.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex.command.Command;

public class LoginCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id가 쿠키로 저장되어 있다면 그것을 가져와 이 변수에 저장한다.
				String id = "";
				
				boolean flag = false;
				
				// 사용자 컴퓨터에 이 서버가 저장해 둔 쿠키 파일의 내용을 배열로 획득해 온다.
				// 데이터가 지금처럼 하나일 수도 있지만 여러 개 일수도 있다.
				// 각 cookie의 데이터는 키와 값 이 Map 처럼 쌍으로 존재한다.
				Cookie[] cookies = request.getCookies();
				
				// cookies에 넘어온 쿠키 정보가 null이 아니라면 for문을 수행하면서 id라는 키를 찾아야 한다.
				for(int i = 0; cookies != null && i < cookies.length; ++i) {
				
					String key = cookies[i].getName();
					
					// key가 memberId라는 글자라면 당연히 우리가 심어둔 id의 값을 가지고 있을 것이다.
					if(key.equals("memberId")) {
						
						// key가 id 이기 때문에 이 위치의 cookie가 해당 value를 가지고 있을 것이다.
						id = cookies[i].getValue();
						
						// id가 한글일때를 대비해 저장할 때 인코드 변환을 했으므로 
						// 이번에는 디코드 변환을 해야 한다.				
						id = java.net.URLDecoder.decode(id, "utf-8");

						flag = true;
					}
				}

				request.setAttribute("cookieFlag", flag);
				request.setAttribute("cookieId", id);
				System.out.println("쿠키 플래그: " + request.getAttribute("cookieFlag"));
	}

}
