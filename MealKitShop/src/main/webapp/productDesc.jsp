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


<!-- Main CSS -->
<link rel="stylesheet" href="css/productDesc.css">

<title>상품 페이지</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<section>
    <article>
      <!-- product_info -->
      <div class="info_wrap">
        <div class="thumnail"><img src="imageFolder/${dto.productImage}"></div>
        <div class="main_info">
          <p class="name"><strong>${dto.productName }</strong></p>
          <span class="price">${dto.price }원</span><span class="discount">${dto.discount }%</span>
          <form method="post" name="form">
            <table class="main_table">
              <tr>
                <td>판매단위</td><td>${dto.unit }</td>
              </tr>
              <tr>
                <td>중량/용량</td><td>${dto.weight }</td>
              </tr>
              <tr>
                <td>원산지</td><td>${dto.origin }</td>
              </tr>
              <tr>
                <td>유통기한</td><td>${dto.shelfLife }</td>
              </tr>
              <tr>
                <td>안내사항</td><td class="guide">${dto.guide }</td>
              </tr>
              <tr class="select_list">
                <td class="select_tit">상품선택</td>
                <td><span >${dto.price }</span>원</td>
                <%-- <td class="select_desc">
                  <select name="select_price" class="box_select" onchange="option_price(this)">
                    <option value="89900" class="option_price" selected>
                      <span>저탄소 GAP 스테비 사과&배 세트</span>
                      <span>${dto.price }</span>
                    </option>
                  </select>
                </td> --%>
              </tr>
              <tr class="purchase_quantity">
                <td class="quantity_tit">구매수량</td>
                <td class="quantity_desc">
                  <select name="select_quantity" class="box_quantity" onchange="option_quantity(this)">
                    <option value="1" class="option_quantity">1
                    </option>
                    <option value="2" class="option_quantity">2
                    </option>
                    <option value="3" class="option_quantity">3
                    </option>
                    <option value="4" class="option_quantity">4
                    </option>
                  </select>
                  <%-- <select name="" id="" class="box_quantity" onchange="option_quantity(this)">
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i }">${i }</option>	/
					</c:forEach>
				</select> --%>
                </td>
              </tr>
              <tr class="total_amount">
                <td colspan="2">
                <input type="hidden" name="price" id="price" value="${dto.price }">
                  <span class="tit">총 상품금액 :</span><span id="amount">${dto.price }</span><span>원</span>
                <td>
              </tr>
              <tr>
              	<c:if test="${userInfo eq null }">
              		<td colspan="2" class="group_btn">
              			<a href="login.do"><input type="button" id="loginbtn" value="로그인 후 구매 가능합니다."></a>
              		</td>
              	</c:if>
              	<c:if test="${userInfo ne null }">
	                <td colspan="2" class="group_btn">
	                  <input type="submit" value="장바구니 담기" onclick="javascript: form.action='cartAdd.do'">
	                  <input type="hidden" value="${dto.productId }" name="productId">
	                  <input type="hidden" value="${dto.productName}" name="productName">
	                  <input type="submit" id="buyBtn" value="구매하기" onclick="javascript: form.action='productOrders.do'">
	                <td>
              	</c:if>
              </tr>
            </table>
          </form>
        </div>
      </div>
    </article>
    <!--tab-->
    <article>
      <div class="product_tab" id="tab_bar">
        <ul class="tab_list">
          <li class="description">상품설명</li>
          <li class="information">상세정보</li>
          <li class="review">후기</li>
          <li class="qna">문의</li>
        </ul>
      </div>
    </article>
    <!--description-->
    <article>
      <div class="product_desc">
        <div class="image"><img src="imageFolder/${dto.descImage}" alt=""></div>
        <div class="why">
          <h1><strong>WHY KURLY</strong></h1>
          <div class="wrap1">
            <div class="col">
              <div class="icon"><i class="fas fa-clipboard-list"></i></div>
              <div class="info">
                <span class="tit">깐깐한 상품위원회</span><br/>
                <span class="desc">
                  나와 내 가족이 먹고 쓸 상품을 고르는 
                  마음으로 매주 상품을 직접 먹어보고, 
                  경험해보고, 성분, 맛, 안정성 등 다각도의 
                  기준을 통과한 상품만을 판매합니다.</span>
              </div>
            </div>
            <div class="col">
              <div class="icon"><i class="fas fa-boxes"></i></div>
              <div class="info">
                <span class="tit">차별화된 Only 상품</span><br/>
                <span class="desc">
                  전국 각지와 해외의 훌륭한 생산자가 
                  믿고 선택하는 파트너, 마켓컬리. 
                  3천여 개가 넘는 컬리 단독 브랜드, 스펙의 
                  only 상품을 믿고 만나보세요.</span>
              </div>
            </div>
            <div class="col">
              <div class="icon"><i class="fas fa-truck"></i></div>
              <div class="info">
                <span class="tit">신선한 풀콜드체인 배송</span><br/>
                <span class="desc">
                  올라인 업계 최초로 산지에서 문 앞까지 
                  상온, 냉장, 냉동 상품을 분리 포장 후 
                  최적의 온도를 유지하는 냉장 배송 시스템, 
                  풀콜드체인으로 상품을 신선하게 전해드립니다.</span>
              </div>
            </div>
          </div>
          <div class="wrap2">
            <div class="col">
              <div class="icon"><i class="fas fa-search-dollar"></i></div>
              <div class="info">
                <span class="tit">고객, 생산자를 위한 최선의 가격</span><br/>
                <span class="desc">
                  매주 대형 마트와 주요 온라인 마트의 가격 
                  변동 상황을 확인해 신선식품은 품질을 
                  타협하지 않는 선에서 최선의 가격으로, 
                  가공식품을 언제나 합리적인 가격으로 
                  정기 조정합니다.</span>
              </div>
            </div>
            <div class="col">
              <div class="icon"><i class="fas fa-recycle"></i></div>
              <div class="info">
                <span class="tit">환경을 생각하는 지속 가능한 유통</span><br/>
                <span class="desc">
                  친환경 포장재부터 생산자가 상품에만 
                  집중할 수 있는 직매입 유통구조까지, 
                  지속 가능한 유통을 고민하며 컬리를 있게 하는 
                  모든 환경(생산자, 커뮤니티, 직원)이 
                  더 나아질 수 있도록 노력합니다.</span>
              </div>
            </div>
          </div>
          <div class="center">
            <h4>고객상담센터</h4>
            <p>
              <strong>궁금하신 점이나 서비스 이용에 불편하신 점이 있으신가요?</strong><br/>
              문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해 주시면 빠르게 도와드리겠습니다.
            </p>
            <div class="wrap_center">
              <div class="phone">
                <span class="tit">전화문의 0000-0000</span>
                <span class="sub">오전 7시~오후 7시(연중무휴)</span>
              </div>
              <div class="kakao">
                <span class="tit">카카오톡 문의</span>
                <span class="sub">오전 7시~오후 7시(연중무휴)</span>
                <span class="expend">
                  카카오톡에서 '마켓컬리'를 검색 후
                  대화창에 문의 및 불편사항을
                  남겨주세요.
                </span>
              </div>
              <div class="homepage">
                <span class="tit">홈페이지 문의</span>
                <span class="sub">24시간 접수 가능
                  로그인>마이컬리>1:1 문의
                </span>
                <span class="expend">
                  고객센터 운영 시간에 순차적으로
                  답변해드리겠습니다.
                </span>
              </div>
            </div>
          </div>
          <div class="excahnge_refund">
            <div class="excahnge_refund_wrap">
              <span><strong>교환 및 환불 안내</strong></span>
              <span>교환 및 환불이 필요하신 경우 고객상담센터로 문의주세요.</span>
            </div>
            <div class="faq">
              <div class="qeustion">
                <p><strong>01.상품에 문제가 있는 경우</strong></p>
              </div>
              <div class="answer">
                <p>받으신 상품이 표시·광고 내용 또는 계약 내용과 다른 경우에는 상품을 받은 날로부터 3개월 이내,
                  그 사실을 아게 된 날부터 30일 이내에 교환 및 환불을 요청하실 수 있습니다.
                  상품의 정확한 상태를 확인할 수 있도록 사진을 함께 보내주시면 더 빠른 상담이 가능합니다.<br/>
                  ※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가 부담합니다.
              </div>
            </div>
            <div class="faq">
              <div class="qeustion">
                <p><strong>02.단순 변심, 주문 착오의 경우</strong></p>
              </div>
              <div class="answer">
                <p><strong>신선/냉장/냉동 식품</strong>
                  재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다.
                  상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.<br/>
                  <strong>유통기한 30일 이상 식품 (신선/냉장/냉동 제외) & 기타 상품</strong>
                  상품을 받은 날부터 7일 이내에 고객상담센터로 문의해주세요.<br/>
                  ※ 단순 변심으로 인한 교환 또는 환불의 경우 고객님께서 배송비 6,000원을 부담하셔야 합니다.
                  (주문 건 배송비를 결제하셨을 경우 3,000원)
                </p>
              </div>
            </div>
            <div class="faq">
              <div class="qeustion">
                <p><strong>03.교환·반품이 불가한 경우</strong></p>
              </div>
              <div class="answer">
                <p>다음에 해당하는 교환·환불 신청을 처리가 어려울 수 있으니 양해 부탁드립니다.<br/>
                  ·고객님의 책임 있는 사유로 상품을 멸실되거나 훼손된 경우
                  (단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)
                  ·고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우
                  ·시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우
                  ·복제가 가능한 상품의 포장이 훼손된 경우
                  ·고객님의 주문에 따라 개별적으로 생산되는 상품의 제작이 이미 진행된 경우
                </p>
              </div>
            </div>
            <div class="shipping_wrap">
              <span><strong>배송관련 안내</strong></span>
              <span>배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.</span>
            </div>
          </div>
        </div>
      </div>
    </article>
    <!-- review -->
    <article>
      <div class="product_review">
        <p><strong>PRODUCT REVIEW</strong></p>
        <div class="title_text">
          <span>· 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
          · 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 내 <strong>1:1문의</strong>에 남겨주세요.</span>
          <select name="review" id="">
            <option value="wtime">최근등록순</option>
            <option value="rcnt">조회순</option>
          </select>
        </div>
        <table class="review_table">
          <tr>
            <th>번호</th><th id="rTit">제목</th><th>작성자</th><th>작성일</th><th>도움</th><th>조회</th>
          </tr>
          <tr>
            <td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td>
          </tr>
          <tr>
            <td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td>
          </tr>
          <tr>
            <td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td>
          </tr>
          <tr>
            <td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td><td>번호</td>
          </tr>
          <tr>
            <td colspan="6"><input type="button" id ="rBtn" value="후기쓰기"></td>
          </tr>
        </table>
        <div class="pasing">
          페이징할 자리
        </div>
      </div>
    </article>
    <!-- qna -->
    <article>
      <div class="product_qna">
        <p><strong>PRODUCT Q&A</strong></p>
        <div class="title_text">
          <span>· 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
          · 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 내 <strong>1:1문의</strong>에 남겨주세요.</span>
        </div>
        <div class="qna_list">
            <div class="list_tit">
            	<div class="title"><span>제목</span></div>
            	<div class="id"><span>작성자</span></div>
              	<div class="wtime"><span>작성일</span></div>
              	<div class="yOn"><span>답변상태</span></div>
            </div>
            <c:if test="${listQ ne null }">
	            <c:forEach var="dto" items="${listQ }">
	            	<div class="questions" onclick="getShow()">
		              <div class="title"><span>${dto.title }</span></div>
		              <div class="id"><span>${dto.id }</span></div>
		              <div class="wtime"><span>${dto.wtime }</span></div>
		              <div class="yOn">
		              	<c:if test="${dto.answer eq 'n'}"><span>미완료</span></c:if>
		              	<c:if test="${dto.answer ne 'n'}"><span>답변 완료</span></c:if>
		              </div>
		            </div>
		            <c:if test="${dto.answer ne 'n'}">
			            <div class="answer">
			              <span>${dto.contents }</span>
			            </div>
		            </c:if>
	            </c:forEach>
            </c:if>
            <div class="pasing">
            	<c:set var="curPageQ" value="${param.curPageQ }"/>
				<c:if test="${curPageQ eq null }">
			    	<c:set var="curPageQ" value="0"/>
			  	</c:if>
			 	<c:forEach var="i" begin="0" end="${totalPageQ }" step="1">
			  		<c:if test="${i eq curPageQ }">${i+1 }</c:if>
			  		<c:if test="${i ne curPageQ }"><a href="productDesc.do?curPageQ=${i }&productId=${dto.productId }">${i+1 }</a></c:if>	
			  	</c:forEach>
            </div>
            <c:if test="${userInfo eq null }">
            	<a href="login.do"><input type="button" id="noQBtn" value="로그인"></a>
            </c:if>
            <c:if test="${userInfo ne null }">
           		<button type="button" id="qBtn" data-bs-toggle="modal" data-bs-target="#myModal">문의하기</button>
            </c:if>
          </div>
          <div class="modal" id="myModal">
              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">상품 문의하기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <!-- Modal body -->
                  <div class="modal-body">
                    <form name="modal_form" method="post" action="productQNA.do">
                      <label for="modal_tit">제목</label>
                      <input type="text" name="modal_tit" id="modal_tit" placeholder="제목을 입력해주세요."><br/>
                      <label for="modal_contents">내용</label>
                      <textarea name="modal_contents" id="modal_contents" placeholder="  내용을 입력해주세요."></textarea>
                      <input type="hidden" value="${dto.productId }" id="modal_productId" name="productId">
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" onClick="document.forms['modal_form'].submit();">등록</button>
                  </div>
                </div>
              </div>
            </div>
      </div>
    </article>
  </section>
<jsp:include page="bottom.jsp" flush="false"/>
<!-- js -->
<script src="js/total_amount.js"></script>
<script src="js/scroll_nav.js" defer></script>
<script src="js/asked_qeustion_show.js"></script>
<script src="js/modalQNA.js"></script>
</body>
</html>