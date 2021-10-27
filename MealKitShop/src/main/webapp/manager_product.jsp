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
<link rel="stylesheet" href="css/manager_product.css">
<title>상품 관리</title>
</head>
<body>
  <jsp:include page="top.jsp" flush="false"/>
    <div class="manager_page">
      <jsp:include page="managerPage_snb.jsp" flush="false"/>
      <!-- board -->
      <div class="board">
      <div class="product_tit"><h3>상품등록</h3></div>
      <div class="product_info">
        <form method="post" action="productRegister.do" enctype="multipart/form-data">
          <table class="register_table">
            <tr>
              <td><label for="productId">상품코드</label></td><td><input type="text" name="productId" id="productId" class="info"></td>
              <td><label for="productName">상품이름</label></td><td colspan="3"><input type="text" name="productName" id="productName" class="info"></td>
            </tr>
            <tr>
              <td><label for="productDesc">상품소개</label></td><td colspan="5"><textarea name="productDesc" id="productDesc" cols="130"></textarea></td>
            </tr>
            <tr>
              <td><label for="cost">원가</label></td><td><input type="text" name="cost" id="cost" class="info">원</td>
              <td><label for="discount">할인가</label></td><td><input type="text" name="discount" id="discount" class="info" placeholder="없을 시 '0' 입력">%</td>
              <td><label for="price">판매가</label></td><td><input type="text" name="price" id="price" class="info">원</td>
            </tr>
            <tr>
              <td>종류</td>
              <td>
                <select name="productKind">
                  <option value="1">한끼식사</option>
                  <option value="2">반찬</option>
                  <option value="3">국/전골</option>
                  <option value="4">간식/디저트 </option>
                </select>
              </td>
              <td>카테고리</td>
              <td>
                <select name="productCategory">
                  <option value="n" selected>신상품</option>
                  <option value="b">베스트상품</option>
                  <option value="d">알뜰쇼핑</option>
                </select>
              </td>
              <td><label for="unit">판매단위</label></td><td><input type="text" name="unit" id="unit" class="info"></td>
            </tr>
            <tr>
              <td><label for="shelfLife">유통기한</label></td><td><input type="text" name="shelfLife" id="shelfLife" class="info"></td>
              <td><label for="weight">중량/용량</label></td><td><input type="text" name="weight" id="weight" class="info"></td>
              <td><label for="origin">원산지</label></td><td><input type="text" name="origin"id="origin" class="info" ></td>
            </tr>
            <tr>
              <td><label for="productImage">상품 이미지</label></td><td><input type="file" name="productImage"></td>
              <td><label for="descImage">설명 이미지</label></td><td><input type="file" name="descImage"></td>
            </tr>
            <tr>
              <td><label for="guide">안내사항</label></td><td colspan="5"><textarea name="guide" id="guide" cols="130"></textarea></td>
            </tr>
            <tr>
              <td colspan="6"><input type="submit" value="등록"></td>
            </tr>
          </table>
        </form>
      </div>
      <div class="search">
        <form method="post" action="">
            <input type="text" name="searchProduct" placeholder="상품코드, 이름">
            <div class="icon" onClick="document.forms['form'].submit();"><i class="fas fa-search"></i></div>
        </form>
      </div>
      <div class="product_list">
        <c:if test="${list.size() == 0 }">
          <div class="contents">
            <span>찾으시는 상품이 없습니다.</span>
          </div>
        </c:if>
        <c:if test="${list ne null }">
          <c:forEach var="dto" items="${list }">
            <div class="list">
              <div class="product_wrap">
                <div class="product_img">
                  <img src="imageFolder/${dto.productImage}">
                  <div class="btn">
                    <input type="button" value="삭제하기" onclick="">
                  </div>
                </div>
                <div class="product_table">
                  <table style="width: 1050px">
                    <tr>
                      <td class="tit">코드</td><td>${dto.productId}</td><td>이름</td><td>${dto.productName}</td><td>원가</td><td>${dto.cost}</td>
                      <td>할인</td>
                      <td>
                        <c:if test="${dto.discount == 0}">-</c:if>
                        <c:if test="${dto.discount != 0}">${dto.discount} %</c:if>
                      </td>
                      <td>판매가</td><td>${dto.price}</td>
                    </tr>
                    <tr>
                      <td class="tit">소제목</td><td colspan="8">${dto.productDesc}</td>
                    </tr>
                    <c:forEach var="dto" items="${listD }">
	                    <tr>
	                      <td class="tit">판매단위</td><td>${dto.unit}</td><td>중량/용량</td><td>${dto.weight}</td><td>원산지</td><td>${dto.origin}</td><td>유통기한</td><td colspan="3">${dto.shelfLife}</td>
	                    </tr>
	                    <tr>
	                      <td class="tit">안내사항</td>
	                      <td class="guide" colspan="7">
	                        <span>${dto.guide}</span>
	                      </td>
	                    </tr>
                    </c:forEach>
                  </table>
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
            <c:if test="${i ne curPage }"><a href="managerProduct.do?curPage=${i }">${i+1 }</a></c:if>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="bottom.jsp" flush="false"/>
</body>
</html>