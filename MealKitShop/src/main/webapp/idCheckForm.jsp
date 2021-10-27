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
<script src="js/idCheck.js"></script>
<title>아이디 중복체크</title>
</head>
<body>
	<h3> 아이디 중복체크 </h3>
	<form method="post" action="idCheckOK.do" onsubmit="return blankCheck(this)">
		아이디 : <input type="text" name="id" value="${param.id }" maxlength="10" autofocus>
		<input type="submit" value="중복확인">
	</form>
</body>
</html>