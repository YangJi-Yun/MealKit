<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- googlefont -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<!-- Main CSS -->
<link rel="stylesheet" href="css/top_bottom.css">

<title>상단</title>
</head>
<body>
    <!--Header-->
    <header id="header">
        <div class="header_menu_top">
            <ul class="link_menu">
            	<c:if test="${userInfo eq null }">
                	<li><a href="membership_join.do">회원가입</a></li>
                	<li><a href="login.do">로그인</a></li>
               	</c:if>	
               	<c:if test="${userInfo ne null }">
                	<li class="login_dropdown"><a href="javascript:void(0)" class="login">${userInfo.id }</a><i class="fas fa-sort-down"></i>
                		<div class="loginDrop">
                			<a href="">주문내역</a>
                  			<a href="memberModify.do">개인 정보 수정</a>
                  			<a href="logout.do">로그아웃</a>
                		</div>
                    </li>    
                </c:if>
                <li class="center_dropdown"><a href="javascript:voic(0)">고객센터</a><i class="fas fa-sort-down"></i>
                    <div class="header_dropdown">
                        <a href="notice.do">공지사항</a>
                        <a href="askedQna.do">자주하는 질문</a>
                        <a href="inquiry.do">1:1 문의</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="header_logo">
        	<a href="main.do"><img src="images/logo.png" alt="logo" /></a>
        </div>
        <div class="main_wrap">
            
            <div class="header_gnb">
                <ul class="gnb">
                    <li class="menu1">
                    	<div class="dropdown_box">
	                        <a href="main.do" class="text" id="hover"><i class="fas fa-bars"></i>전체 카테고리</a>
	                        <div class="menu1_dropdown">
				                <a href="serve.do?productKind=1&categoryOrKind=kind"><i class="fas fa-carrot"></i>한끼식사</a>
				                <a href="serve.do?productKind=2&categoryOrKind=kind"><i class="fas fa-carrot"></i>반찬</a>
				                <a href="serve.do?productKind=3&categoryOrKind=kind"><i class="fas fa-carrot"></i>국·전골</a>
				                <a href="serve.do?productKind=4&categoryOrKind=kind"><i class="fas fa-carrot"></i>간식·디저트</a>
				              <!--   <a href=""><i class="fas fa-carrot"></i>샐러드·간편식</a>
				                <a href=""><i class="fas fa-carrot"></i>면·양념·오일</a>
				                <a href=""><i class="fas fa-carrot"></i>생수·음료·우유·커피</a>
				                <a href=""><i class="fas fa-carrot"></i>간식·과자·떡</a>
				                <a href=""><i class="fas fa-carrot"></i>베이커리·치즈·델리</a> -->
				            </div>
			            </div>
                    </li>
                    <li class="menu2">
                        <a href="serve.do?productCategory=n&categoryOrKind=category">신상품</a>
                    </li>
                    <li class="menu3">
                        <a href="serve.do?productCategory=b&categoryOrKind=category">베스트</a>
                    </li>
                    <li class="menu4">
                        <a href="serve.do?productCategory=d&categoryOrKind=category">알뜰쇼핑</a>
                    </li>
                    <c:if test="${userInfo.verify == 1}">
	                	<li class="menu5">
	                        <a href="managerUser.do">관리자 메뉴</a>
	                    </li>
               		</c:if>	
                </ul>
                <div class="left_gnb">
                    <div class="gnb_sid">
                    	<form action="searchOK.do" method="post">
                    		<input type="text" placeholder="검색어를 입력해주세요" name="sword" id="sword" value="${sword }">
                        	<button class="icon"><i class="fas fa-search"></i></button>
                    	</form>
                    </div>
                    <div class="cart_count" onclick="location.href='cartList.do'">
                       	<i class="fas fa-shopping-cart"></i>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- <script src="js/hover.js"></script> -->
</body>
</html>