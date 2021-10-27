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
<script src="js/idCheck.js"></script>
<script src="js/pwCheck.js"></script>

<!--css  -->
<link rel="stylesheet" href="css/membership_join.css">
<title>회원가입</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<section>
  <div class="membership">
    <h2>회원가입</h2>
    <p><span class="icon">*</span>필수입력사항</p>
    <form name="membership_join" method="post" action="membershipOK.do">
      <table >
        <tr>
        	<td><label for="id">아이디<span class="icon">*</span></label></td>
         	<td>
         	<c:if test="${idCheckCnt eq null}">
         		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
         	</c:if>
        	<c:if test="${idCheckCnt ne null}">
        		<input type="text" name="id" id="id">
        	</c:if>
         	</td>
          	<td><input type="button" value="중복확인" onclick="idCheck()"></td>
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
          <td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"></td>
        </tr>
        <tr>
          <td><label for="email">이메일<span class="icon">*</span></label></td>
          <td><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요"></td>
          <td><input type="button" value="중복확인" onclick=""></td>
        </tr>
        <tr>
          <td><label for="cellphone">휴대폰<span class="icon">*</span></label></td>
          <td><input type="text" name="cellphone" id="cellphone" placeholder="숫자만 입력해주세요"></td>
          <td><input type="button" value="인증번호 받기" onclick=""></td>
        </tr>
        <tr>
          <td id="addressTit"><label for="address">주소<span class="icon">*</span></label></td>
          <td id="address">        
            <input type="text" id="sample4_postcode" placeholder="우편번호" name="postcode">
		        <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddress"><br/>
		        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddress"><br/>
		        <span id="guide" style="color:#999;display:none"></span>  
		        <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddress"><br/>
		        <input type="text" id="sample4_extraAddress" placeholder="참고항목" name="extraAddress"><br/>
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
            <input type="radio" name="gender" value="male" id="male"><label for="male">남자</label>
            <input type="radio" name="gender" value="female" id="female"><label for="female">여자</label>
            <input type="radio" name="gender" value="none" id="none"><label for="none">선택안함</label>
          </td>
        </tr>
        <tr>
          <td>생년월일</td>
          <td id="birth">
            <input type="text" name="birthYear" max="4" placeholder="YYYY">
        		<select name="birthMonth">
		          <c:forEach var="i" begin="1" end="12" step="1">
			          <option value="${i }">${i }</option>
		          </c:forEach>
		        </select>
		        <input type="text" name="birthDate" placeholder="DD">
          </td>
          <td></td>
        </tr>
        <!-- <tr>
          <td>이용약관동의<span class="icon">*</span></td>
          <td>
            <input type="checkbox" id="agree"><label for="agree">전체 동의합니다.</label>
         </td>
        </tr>
        <tr>
          <td></td>
          <td><input type="checkbox" id="info1"><label for="info1">이용약관 동의</label><span class="sub">(필수)</span></td>
          <td><span class="agreement">약관보기></span></td>
        </tr> 
        <tr>
          <td></td>
          <td><input type="checkbox" id="info2"><label for="info2">개인정보 수집·이용 동의</label><span class="sub">(필수)</span></td>
          <td><span class="agreement">약관보기></span></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="checkbox" id="info3"><label for="info3">개인정보 수집·이용 동의</label><span class="sub">(선택)</span></td>
          <td> <span class="agreement">약관보기></span></td>
        </tr>            
        <tr>
          <td></td>
          <td colspan="2"><input type="checkbox" id="event"><label for="event">무료배송, 할인쿠폰 등 혜택/정보 수신 동의</label><span class="sub">(선택)</span></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="checkbox" id="sms"><label for="sms">SMS</label><input type="checkbox" id="mail"><label for="mail">이메일</label></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="checkbox" id="age"><label for="age">본인은 만 14세 이상입니다.</label><span class="sub">(필수)</span></td>
          <td></td>
        </tr> -->
        <tr id="submitBtn">
          <td colspan="3"><input type="submit" value="가입하기"></td>
        </tr>
      </table>
    </form>
  </div>
</section>
<jsp:include page="bottom.jsp" flush="false"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/address.js"></script>
</body>
</html>
