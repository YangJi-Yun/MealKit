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
</head>
<body>
<h3>아이디 중복 확인 결과</h3>
<c:if test="${idCheckCnt == 0}">
입력 ID : <strong>${id }</strong><br/>
<a href="javascript:apply('${id }')">[적용]</a>

</c:if>
<c:if test="${idCheckCnt != 0 }">
<p style="color: red">해당 아이디는 사용하실 수 없습니다.</p>
</c:if>
<hr>
<a href="javascript:history.back()">[다시시도]</a>
&nbsp; &nbsp;
<a href="javascript:window.close()">[창닫기]</a>
<script src="js/idCheckOK.js"></script>
</body>
</html>