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
<!-- js  -->
<script src="js/asked_qeustion_show.js"></script>
<!-- cs -->
<link rel="stylesheet" href="css/asked_qeustions.css">
<title>1:1 문의</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
  <div class="menu">
    <!-- aside -->
  	<jsp:include page="noticeSnb.jsp" flush="flase"/>
  	<!-- board -->
  	<section>
      <div class="board">
      	<div class="tit"><h3>1:1 문의</h3></div>
      	<div class="list">	
        	<div class="list_tit">
          		<div class="no"><span>번호</span></div>
          		<div class="cate"><span>카테고리</span></div>
          		<div class="title"><span>제목</span></div>
          		<div class="writer"><span>작성자</span></div>
          		<div class="wtime"><span>작성일</span></div>
          		<div class="yOn"><span>답변여부</span></div>
        	</div>
        	<c:if test="${list.size() eq '0' }">
        		<div class="contents_none">
		          <span>1:1 문의 내역이 존재하지 않습니다.</span>
		        </div>
		        <div class="inquiryBtn">
		          <a href=""><input type="button" value="문의하기"></a>
		        </div>
        	</c:if>
        	<c:if test="${list ne null }">
        		<c:forEach var="dto" items="${list }" varStatus="i">
	        		<div class="questions" onclick="getShow(aShow_${i.index })">
		          		<div class="no"><span>${dto.no }</span></div>
		          		<div class="cate">
			          	<c:if test="${dto.categories eq '0'}"><span>기타</span></c:if>
			        	<c:if test="${dto.categories eq '1'}"><span>회원문의</span></c:if>
			          	<c:if test="${dto.categories eq '2'}"><span>주문/결제</span></c:if>
			          	<c:if test="${dto.categories eq '3'}"><span>취소/교환/반품</span></c:if>
			          	<c:if test="${dto.categories eq '4'}"><span>배송문의</span></c:if>
		         		</div>
		         		<div class="title"><span>${dto.title }</span></div>
		          		<div class="writer"><span>${dto.id }</span></div>
		          		<div class="wtime"><span>${dto.wtime }</span></div>
		          		<div class="yOn">
			          		<c:if test="${dto.answer eq 'n'}">
			          			<span>미완료</span>
		          			</c:if>
		          			<c:if test="${dto.answer ne 'n'}">
			          			<span>답변 완료</span>
			          		</c:if>
		    	      	</div>
	        		</div>
	        		<div class="answer" id="aShow_${i.index }">
	        			<c:if test="${dto.answer eq 'n'}">
		          			<span>답변을 준비 중입니다.</span>
	    	      		</c:if>
	        	  		<c:if test="${dto.answer ne 'n'}">
	          				<span>${dto.contents }</span>
	          			</c:if>
	        		</div>
   	    		</c:forEach>
   	    		<c:set var="curPage" value="${param.curPage }"/>
				<c:if test="${curPage eq null }">
			    	<c:set var="curPage" value="0"/>
			  	</c:if>
			 	<c:forEach var="i" begin="0" end="${totalPage }" step="1">
			  		<c:if test="${i eq curPge }">${i+1 }</c:if>
			  		<c:if test="${i ne curPage }"><a href="inquiry.do?curPage=${i }">${i+1 }</a></c:if>	
			  	</c:forEach>
        	</c:if>
      	</div>
    </div>
  </section>
  </div>
<jsp:include page="bottom.jsp" flush="false"/>
</body>
<!-- js  -->
<script src="js/asked_qeustion_show.js"></script>
</html>