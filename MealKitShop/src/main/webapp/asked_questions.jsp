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

<!-- cs -->
<link rel="stylesheet" href="css/asked_qeustions.css">
<title>자주하는 질문</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
  <div class="menu">
    <!-- aside -->
    <jsp:include page="noticeSnb.jsp" flush="flase"/>
  	<!-- board -->
  	<section>
	    <div class="board">
	      <div class="tit">
	        <h3>자주하는 질문</h3><span>고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
	      </div>
	      <div class="list">
	        <div class="list_tit">
	          <div class="no"><span>번호</span></div>
	          <div class="cate"><span>카테고리</span></div>
	          <div class="title"><span>제목</span></div>
	        </div>
       		<c:if test="${list.size() eq '0' }">
        		<div class="contents_none">
		          <span> 검색 결과가 없습니다. 다시 검색하여 주세요.</span>
		        </div>
        	</c:if>
        	<c:if test="${list ne null}">
        		<c:forEach var="dto" items="${list }" varStatus="i">
		        	<div class="questions" id="qShow" onclick="getShow(aShow_${i.index })">
		          		<div class="no"><span>${dto.no }</span></div>
		          		<div class="cate">
			          		<c:if test="${dto.categories eq '0'}"><span>기타</span></c:if>
			          		<c:if test="${dto.categories eq '1'}"><span>회원문의</span></c:if>
			          		<c:if test="${dto.categories eq '2'}"><span>주문/결제</span></c:if>
			          		<c:if test="${dto.categories eq '3'}"><span>취소/교환/반품</span></c:if>
			          		<c:if test="${dto.categories eq '4'}"><span>배송문의</span></c:if>
		          		</div>
		          		<div class="title"><span>${dto.title }</span></div>
		        	</div>
		        	<div class="answer" id="aShow_${i.index }">
		        		<span>${dto.contents }</span>
		        	</div>
		        </c:forEach>
        	</c:if>
	      </div>
	      <div class="pasing">
	     	<c:set var="curPage" value="${param.curPage }"/>
 			<c:if test="${curPage eq null }">
  				<c:set var="curPage" value="0"/>
  		 	</c:if>
  		 	<c:forEach var="i" begin="0" end="${totalPage }" step="1">
  				<c:if test="${i eq curPge }">${i+1 }</c:if>
  				<c:if test="${i ne curPage }"><a href="askedQna.do?curPage=${i }">${i+1 }</a></c:if>
  		 	</c:forEach>
	     </div>
	    </div>
    	 <div class="search">
    		<form method="post" name="form" action="searchKeyword.do">
	      		<input type="text" name="searchKeyword">
	      		<div class="icon" onClick="document.forms['form'].submit();"><i class="fas fa-search"></i></div>
    		</form>
  		 </div>
  		 
   	</section>
  </div>
 <jsp:include page="bottom.jsp" flush="false"/>
</body>
<!-- js  -->
<script src="js/asked_qeustion_show.js"></script>
</html>