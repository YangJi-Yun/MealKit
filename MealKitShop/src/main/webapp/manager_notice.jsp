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
<link rel="stylesheet" 
href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" 
integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- googlefont -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<!-- Main CSS -->
<link rel="stylesheet" href="css/manager_notice.css">
<title>공지사항</title>
</head>
<body>
  <jsp:include page="top.jsp" flush="false"/>
    <div class="manager_page">
    <jsp:include page="managerPage_snb.jsp" flush="false"/>
      <!-- board -->
      <div class="board">
      	<div class="tit"><h3>공지사항</h3></div>
        <div class="notice_write">
          <form method="post" action="writeNotice.do">
            <div class="notice_tit">
              <span>제목</span><input type="text" name="title">
            </div>
            <div class="notice_contents">
              <span id="contents_tit">내용</span><textarea name="contents" cols="105" rows="10"></textarea><br/>
            </div>
            <div class="noticeBtn">
            	<input type="submit" value="등록">
            </div>
          </form>
        </div>
        <div class="noticeList"><h3>공지사항 리스트</h3></div>
        <div class="search">
              <form method="post" action="searchNotice.do">
                  <input type="text" name="searchKeyword" placeholder="작성자, 제목, 내용">
                  <div class="icon" onClick="document.forms['form'].submit();"><i class="fas fa-search"></i></div>
              </form>
          </div>
        <c:if test="${list.size() == 0 }">
          <div class="contents">
            <span>공지사항이 없습니다.</span>
          </div>
        </c:if>
        <c:if test="${list.size() != 0 }">
          <div class="allBtn">
            <div class="btn_box">
              <input type="checkbox" name="all_select" id="all" onclick='selectAll(this)'>
              <label for="all">전체선택</label>
            </div>
            <input type="button" name="delete_all" id="delete_all" value="삭제" onclick='deleteValue()'>
          </div>
          <c:forEach var="dto" items="${list }">
            <div class="list">
              <div class="listBtn">
                <input type="checkbox" name="all_select" value="${dto.no}">
              </div>
              <div id="list_table">
                <table style="width: 1150px">
                  <tr>
                    <td>번호</td><td>${dto.no}</td><td>작성자</td><td>${dto.mId }</td><td>조회수</td><td>${dto.hit}</td><td>작성한 날짜</td><td>${dto.wtime}</td>
                  </tr>
                  <tr>
                    <td>제목</td><td colspan="7">${dto.title}</td>
                  </tr>
                </table>
                <div class="show_contents">
                  <span>${dto.contents}</span>
                </div>
              </div>
            </div>
          </c:forEach>
        </c:if>
        <div class="pasing">
          <c:set var="curPage" value="${param.curPage }"/>
            <c:if test="${curPage eq null }">
              <c:set var="curPage" value="0"/>
            </c:if>
            <c:forEach var="i" begin="0" end="${totalPage }" step="1">
              <c:if test="${i eq curPage }">${i+1 }</c:if>
              <c:if test="${i ne curPage }"><a href="managerUser.do?curPage=${i }">${i+1 }</a></c:if>
            </c:forEach>
        </div>
        
      </div>
    </div>
  <jsp:include page="bottom.jsp" flush="false"/> 
  <script src="js/notice_delete.js" defer></script>
</body>
</html>