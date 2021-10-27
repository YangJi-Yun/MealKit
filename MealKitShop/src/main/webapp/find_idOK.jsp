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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- fontawesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<!-- googlefont -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- cs -->
  <link rel="stylesheet" href="css/find_userInfo.css">
  <title>아이디 찾기 완료</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<section>
    <div class="wrap">
      <h3>아이디 찾기</h3>
     <c:if test="${id ne null }"> 
    	<div class="icon">
        	<i class="far fa-id-badge"></i>
      	</div>
      	<p>
        	고객님의<br/>
        	아이디 찾기가 완료되었습니다!
      	</p>
      	<div class="fine_id"><span>아이디 : ${id}</span></div>
      	<div class="btn">
        	<a href="login.do"><input type="button" value="로그인 하기"></a>
      	</div>
  	 </c:if>
  	  <c:if test="${id eq null }">
      	<div class="icon">
        	<i class="far fa-id-badge"></i>
      	</div>
      	<p>
        	고객님께서 입력하신 정보가<br/>
        	정확한지 확인 후 다시 시도해주세요.
      	</p>
      	<div class="btn">
        	<a href="find_id.do"><input type="button" value="아이디 다시 찾기"></a>
      	</div>
  	  </c:if>
    </div>
  </section>
  <jsp:include page="bottom.jsp" flush="false"/>
</body>
</html>