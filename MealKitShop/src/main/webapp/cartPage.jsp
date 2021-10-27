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
<!-- googlefont -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- google material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<!-- <!-- Main JS -->

<!-- Main CSS -->
<link rel="stylesheet" href="css/cartPage.css" >
<title>장바구니</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>

<div class="cart_container">
  <h2>장바구니</h2>
  
  <div class="box">
	  <form action="" method="">
	    <div class="choice">
	    	<div class="choice_box">
	      		<input type="checkbox" name="check" id="all" class="all_check" onclick="checkboxEvent('check', 'all_check')"><label for="all">전체선택</label>
	    	</div>
	    	<input type="button" id="all_del_btn" value="전체 삭제하기">
	  	</div>
	    <ul class="list">
	    <c:forEach var="dto" items="${cartList }" varStatus="card">
	      <li class="cart_list">
	        <div class="cart_items">
	          <input type="checkbox" name="check" class="cart_buy" onclick="checkboxEvent('check', 'all_check')">
	          <a><img src="imageFolder/${dto.productImage}" alt="logo" /></a><%-- ${dto.productImage } --%>
	          <span class="item_tit">${dto.productName }</span>
	        </div>
	        <div class="wrap_quantity">
	          <div class="item__quantity">
	              <button type="button" class="quantity__btn-down" onclick="itemQuantityCnt(0, this)"><span class="material-icons-outlined">remove</span></button>
	              <input type="text" class="quantity__cnt" value="${dto.cartQuantity }" data-card="${card.index}" readonly>
	              <button type="button" class="quantity__btn-up" onclick="itemQuantityCnt(1, this)"><span class="material-icons-outlined">add</span></button>
	          </div>
	          <div class="item_price"><span class="arr_item_price" data-card="${card.index}" data-price="${dto.cartTotalAmount}">${dto.cartTotalAmount}</span> 원</div>
	          <div class="delBtn">
	            <!-- <input type="button" value="삭제하기" onclick="javascript: location.href='cartDelete.do?productId=${dto.productId}&cartTotalAmount=${dto.cartTotalAmount}'"> -->
	            <input type="button" class="cart_item_delete-btn" value="삭제하기">
	            <input type="hidden" class="hiddenProductId" value="${dto.productId}">
	            <input type="hidden" class="hiddenCartTotalAmount" value="${dto.cartTotalAmount}">
	          </div>
	        </div>
	      </li>
	    </c:forEach>
	    </ul>
	  </form>
  
	 <div class="cart_result">
	     <div class="add">
	       <div class="add_left">
	         <span class="material-icons-outlined">location_on</span><span>배송지</span><br/>
	         <span>${dtoU.postcode }</span><br/>
	         <span>${dtoU.roadAddress }</span>
	         <span>${dtoU.jibunAddress }</span>
	         <span>${dtoU.detailAddress }</span>
	         <span>${dtoU.extraAddress }</span>
	       </div>
	       <input type="button" id="addBtn" value="배송지변경">
	     </div>
	     <div class="order_info">
	     	<div>
	     		<span>상품금액</span>
	     		<div><span id="pPrice">0</span>원</div>
	   	</div>
	   	<div>
	     		<span>배송비</span>
	     		<div><span id="pAmount">0</span>원</div>
	   	</div>
	   	<div>
	     		<span>결제예정금액</span>
	     		<div><span id="pTotalPrice">0</span>원</div>
	   	</div>
	     </div>
	     <div id="orderBtn">
		     <input type="button" value="주문하기" onclick="setTotalPrice()">
		     <div class="caution">
	         <p>'입금확인'상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</p>
	         <p>'입금확인'이후 상태에는 고객센터로 문의해주세요.</p>
	       </div>
	     </div>
	   </div>
	</div>
</div>

<jsp:include page="bottom.jsp" flush="false"/>
<script src="js/cartPage.js" defer></script>
</body>
</html>