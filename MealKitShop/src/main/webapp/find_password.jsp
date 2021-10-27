<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!-- css -->
<link rel="stylesheet" href="css/find_password.css">
  <title>비밀번호 찾기</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
  <section>
    <div class="find_password">
      <h2>비밀번호 찾기</h2>
      <form method="post" action="find_passwordOK.do">
        <span>이름</span><br>
        <input type="text" name="name"><br>
        <span>아이디</span><br>
        <input type="text" name="id"><br>
        <span>이메일</span><br>
        <input type="email" name="email"><br>
        <input type="submit" value="확인">
      </form>
    </div>
  </section>
<jsp:include page="bottom.jsp" flush="false"/>
</body>
</html>