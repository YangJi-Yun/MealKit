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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
</script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css">
   
  <title>로그인</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>

  <section>
    <div class="login">
      <h4>로그인</h4>
      	<form method="post" action="loginOK.do">
      		<c:if test="${cookieFlag eq true}">
		        <input type="text" name="id" placeholder="아이디를 입력해주세요." value="${cookieId}"><br>
	        </c:if>
	        <c:if test="${cookieFlag eq false || cookieFlag eq null}">
	        	<input type="text" name="id" placeholder="아이디를 입력해주세요." value=""><br>
        	</c:if>
	        <input type="password" name="pw" placeholder="비밀번호를 입력해주세요."><br>
	        
	        <div class="checkbox_save">
	        	<c:if test="${cookieFlag eq true}">
	          		<input type="checkbox" name="rememberID" value="chk" id="rememberID" onclick="rememberIdCheck('rememberID')" checked>
	          		<label for="rememberID"> 아이디 저장</label>
          		</c:if>
          		<c:if test="${cookieFlag eq false || cookieFlag eq null}">
          			<input type="checkbox" name="rememberID" value="" id="rememberID" onclick="rememberIdCheck('rememberID')">
          			<label for="rememberID"> 아이디 저장</label>
       			</c:if>
	          	<span><a href="find_id.do">아이디 찾기</a><a href="find_password.do">비밀번호 찾기</a></span><br>
	        </div>
	        
	        <input type="submit" value="로그인"><br><a href="membership_join.do"><input type="button" value="회원가입"></a>
      </form>
    </div>
   <c:if test="${loginFail eq 'fail'}">
   	<script>
		alert("아이디 또는 비밀번호 오류입니다.");
   	</script>
   </c:if>
  </section>


<jsp:include page="bottom.jsp" flush="false"/>
<script src="js/login.js"></script>
</body>
</html>