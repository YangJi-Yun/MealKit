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

<!-- js -->
<script src="js/pwCheck.js"></script>

<!-- css -->
<link rel="stylesheet" href="css/memberModify.css">

<title>회원정보수정</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<section>
  <div class="modify">
    <h2>회원 정보 수정</h2>
      <form method="post" action="memberModifyOK.do">
        <table >
          <tr>
            <td><label for="id">아이디<span class="icon">*</span></label></td>
            <td><input type="text" name="id" id="id" value="${dto.id }" readonly></td>
          </tr>
          <tr>
            <td><label for="pw">비밀번호<span class="icon">*</span></label></td>
            <td><input type="password" name="pw" id="pw" placeholder="6~16자리 비밀번호를 입력해주세요" onchange="pwCheck()"></td>
          </tr>
          <tr>
            <td><label for="pwChk">비밀번호확인<span class="icon">*</span></label></td>
            <td><input type="password" name="pwChk" id="pwChk" placeholder="비밀번호를 한 번 더 입력해주세요" onchange="pwCheck()"></td>
            <td><span id="check"></span></td>
          </tr>
          <tr>
            <td><label for="name">이름<span class="icon">*</span></label></td>
            <td><input type="text" name="name" id="name" value="${dto.name }" ></td>
          </tr>
          <tr>
            <td><label for="email">이메일<span class="icon">*</span></label></td>
            <td><input type="text" name="email" id="email" value="${dto.email }" ></td>
          </tr>
          <tr>
            <td><label for="cellphone">휴대폰<span class="icon">*</span></label></td>
            <td><input type="text" name="cellphone" id="cellphone" value="${dto.cellphone }" ></td>
            <td><input type="button" value="인증번호 받기" onclick=""></td>
          </tr>
          <tr>
            <td id="addressTit"><label for="address">주소<span class="icon">*</span></label></td>
            <td id="address">        
              <input type="text" id="sample4_postcode" placeholder="우편번호" name="postcode" value="${dto.postcode }" >
              <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddress" value="${dto.roadAddress }" ><br/>
              <input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddress" value="${dto.jibunAddress }" ><br/>
              <span id="guide" style="color:#999;display:none"></span>  
              <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddress" value="${dto.detailAddress }" ><br/>
              <input type="text" id="sample4_extraAddress" placeholder="참고항목" name="extraAddress" value="${dto.extraAddress }" ><br/>
            </td>
            <td id="addressBtn"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br /></td>
          </tr>
          <tr>
            <td></td>
            <td><p class="text_guid"><span>배송지에 따라 상품 정보가 달라질 수 있습니다.</span></p></td>
          </tr>
          <tr>
            <td>성별</td>
            <td>
              <input type="radio" name="gender" value="male" id="male" ${dto.gender eq 'male' ? 'checked' : ''} ><label for="male">남자</label>
              <input type="radio" name="gender" value="femail" id="female" ${dto.gender eq 'female' ? 'checked' : ''}><label for="female">여자</label>
              <input type="radio" name="gender" value="none" id="none" ${dto.gender eq 'none' ? 'checked' : ''}><label for="none">선택안함</label>
            </td>
          </tr>
          <tr>
            <td>생년월일</td>
            <td id="birth">
              <input type="text" name="birthYear" max="4" value="${dto.birthYear }">
              <select name="birthMonth">
                <c:forEach var="i" begin="1" end="12" step="1">
                  <option value="${i }" <c:if test="${dto.birthMonth eq i }">selected</c:if> >${i }</option>
                </c:forEach>
              </select>
              <input type="text" name="birthDate" value="${dto.birthDate }">
            </td>
            <td></td>
          </tr>
          <tr id="submitBtn">
            <td colspan="3">
              <input type="submit" value="회원정보수정">
              <a href="main.do"><input type="button" value="취소"></a>
              <a href="passwordCheck.html"><input type="button" id="delete" value="탈퇴하기"></a>
            </td>
          </tr>
      </table>
    </form>
  </div>
</section>
<jsp:include page="bottom.jsp" flush="false"/>
</body>
</html>
