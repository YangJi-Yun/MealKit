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
<link rel="stylesheet" href="css/view_notice.css">
<title>공지사항 보기</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<div class="service_center">
<jsp:include page="noticeSnb.jsp" flush="flase"/>
	<div class="board">
		<div class="notice_tit">
	      <h3>공지사항</h3><span>새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
	    </div>
	    <table>
		    <tr>
		      <td class="tit">제목</td><td colspan="3">${dto.title}</td>
		    </tr>
		    <tr>
		      <td class="tit">작성자</td><td colspan="3">${dto.mId}</td>
		    </tr>
		    <tr>
		      <td class="tit">작성일</td><td>${dto.wtime}</td><td class="tit">조회수</td><td>${dto.hit}</td>
		    </tr>
		  </table>
		  <div class="contents">
		    <span>${dto.contents }</span>
		  </div>
		  <div class="listBtn">
		    <a href="notice.do"><input type="button" value="목록"></a>
		  </div>
	</div>
</div>
<jsp:include page="bottom.jsp" flush="false"/>
</body>
</html>