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

<!-- googlefont -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- googleicon -->
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/serve.css">

<title>상품소개</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
  <!--Main-->
  
  <input type="hidden" id="pc" value="${productCategory}" />
  <input type="hidden" id="pk" value="${productkind}" />
  <input type="hidden" id="type" value="${type}" />
  <input type="hidden" id="curPage" value="${curPage}" />
  <input type="hidden" id="sizeOfPage" value="${sizeOfPage}" />
  <section>
    <div class="serve_event">
      <a href=""><img src="images/serve_main.png"></a>
    </div>
    <article>
      <div class="serve_lnb">
        <div class="tit">
        	<h3>
        		<c:if test="${categoryOrKind eq 'kind' }">
        			<c:if test="${productKind == 1 }">한끼식사</c:if>
        			<c:if test="${productKind == 2 }">반찬</c:if>
        			<c:if test="${productKind == 3 }">국·전골</c:if>
        			<c:if test="${productKind == 4 }">간식·디저트</c:if>
        		</c:if>
        		<c:if test="${categoryOrKind eq 'category' }">
	        		<c:if test="${productCategory eq 'n'}">신상품</c:if>
	        		<c:if test="${productCategory eq 'b'}">베스트 상품</c:if>
	        		<c:if test="${productCategory eq 'd'}">알뜰상품</c:if>
        		</c:if>
        	</h3>
        </div>
      </div>
      <div class="serve_product">
        <div class="list_ability">
          <p class="list_result">총<span class="list_result_total">${totalResult}</span>건</p>
		  <input type="hidden" class="lsit_size_of_page" value="${sizeOfPage}" />
          <ul class="list">
            <li><a href="serve.do?data=none&categoryOrKind=${categoryOrKind }">추천순</a></li> <!-- 기본 -->
            <li><a href="serve.do?data=product_reg&categoryOrKind=${categoryOrKind }">신상품순</a></li><!-- reg순 --> 
            <li><a href="serve.do?data=normal&categoryOrKind=${categoryOrKind }">인기상품순</a></li><!-- 많이 팔린순 -->
            <li><a href="serve.do?data=discount&categoryOrKind=${categoryOrKind }">혜택순</a></li><!-- discount순 -->
            <li><a href="serve.do?data=lowPrice&categoryOrKind=${categoryOrKind }">낮은가격순</a></li><!-- price순 -->
            <li><a href="serve.do?data=highPrice&categoryOrKind=${categoryOrKind }">높은가격순</a></li><!-- price순 -->
          </ul>
        </div>
        <div class="products">
          <ul class="product_list">
            <c:forEach var="dto" items="${list}">
        	  <li>
		    	<div class="item" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=${dto.productId}'">
                  <div class="thumbs">
		            <img src="imageFolder/${dto.productImage}">
   			      </div>
				  <div class="info">
                	<a>${dto.productName }</a>
		            <span class="cost">
		            	<c:if test="${dto.discount == 0}">${dto.price }원</c:if>
		            	<c:if test="${dto.discount != 0}"><span>${dto.discount}% </span>${dto.price }원</c:if>
            		</span>
			        <span class="desc">${dto.productDesc }</span>
            	  </div>
		        </div>
        	  </li>
		   	</c:forEach> 
          </ul>
        </div>
      </div>
    </article>
    <div class="list_paging">
		<div class="paging">
			<div id="pagingGroupBox"></div>
		</div>
	</div>
  </section>
 <jsp:include page="bottom.jsp" flush="false"/>
 <script>
	
////////////////////////////////////////////////////////////////////////
	// 페이징
	// 총 데이터 수
	let totalResult = document.querySelector('.list_result_total').innerText;
	// 한 페이지에 나타낼 데이터 수
	let sizeOfpage = document.querySelector('.lsit_size_of_page').value;
	// 현재 페이지
	let curPage = document.querySelector('#curPage').value;
	curPage += 1;
	// 한 페이지에 나타낼 페이지 수
	let pageGroup = document.querySelector('#sizeOfPage').value;
	if(pageGroup == null || pageGroup != "" || pageGroup == 0 || pageGroup == undefined)
		pageGroup = 9;
	
	//console.log("curPage"+curPage);
	//console.log("totalResult: " + totalResult);
	//console.log("sizeOfpage: " + sizeOfpage);
	  
	function paging(totalResult, sizeOfpage, currentPage){
		// 한 화면에 나타낼 페이지 수
		let pageGroup = 9;
		
		//console.log("currentPage : " + currentPage);
		
		let totalPage = Math.ceil(totalResult/sizeOfpage);    // 총 페이지 수
		let pageGroupNum = Math.ceil(currentPage/pageGroup);    // 페이지 그룹
	  	//console.log("pageGroupNum : " + pageGroupNum);
	  
		let end = pageGroupNum * pageGroup;    // 화면에 보여질 페이지그룹의 마지막 페이지 번호
		if(end > totalPage)
		      end = totalPage;
		//let start = end - (pageGroup-1);    // 화면에 보여질 페이지그룹의 첫번째 페이지 번호
		let start = (pageGroupNum * pageGroup) - (pageGroup - 1)
		let next = end+1;
		let prev = start-1;
		  
		/*
		// Debug
		console.log("end: " + end);
		console.log("start: " + start);
		console.log("next : " + next);
		console.log("prev : " + prev);
		*/
		
	
		const pagingBox = document.querySelector('#pagingGroupBox');
		let html = "";
		  
		// 맨 처음으로 이동 버튼
		html += '<a href="#!" class="paging_num paging_first" id="pagingFirst"><i class="fas fa-angle-double-left"></i></a>';
	
		
		// 이전 버튼
		if(prev > 0)
			html += '<a href="#!" class="paging_num paging_before" id="pagingPrev"><i class="fas fa-angle-left"></i></a>';
		else
			html += '<a style="pointer-events: none;" href="#!" class="paging_num paging_before" id="pagingPrev"><i class="fas fa-angle-left"></i></a>';
	
		// 페이지 버튼
		for(let i=start; i<=end; i++){
		    html += '<span class="paging_num" id="pagingNum_'+i+'">' + i + '</span>';
		}
		  
		// 다음버튼
		if(end < totalPage)
		 	html += '<a href="#!" class="paging_num paging_after" id="pagingNext"><i class="fas fa-angle-right"></i></a>';
		else
			html += '<a style="pointer-events: none;" href="#!" class="paging_num paging_after" id="pagingNext"><i class="fas fa-angle-right"></i></a>';
		
			
		// 맨 처음/마지막으로 이동 버튼
	  	html += '<a href="#!" class="paging_num paging_last" id="pagingLast"><i class="fas fa-angle-double-right"></i></a>';
	  	
	  	// 페이지 목록 생성
	  	pagingBox.innerHTML = html;  
	  	
	  	//$(".paging_num").css("color", "red");
	  	// 현재 페이지 표시
	  	$("#pagingNum_" + currentPage).css({"text-decoration":"none", "color":"red", "font-weight":"bold"});
	  	
	  	$(".paging_num").click(function(){
	      
		  	let $item = $(this);
		  	let $id = $item.attr("id");
		  	let selectedPage = $item.text();
		  	
		  	let first = 1;
		  	let last = Math.ceil(totalResult / pageGroup); 
			if($id == "pagingFirst") selectedPage = first;
		    if($id == "pagingLast") selectedPage = last;
		    
		    if($id == "pagingNext") selectedPage = next;
		    if($id == "pagingPrev") selectedPage = prev;
		    
		    paging(totalResult, sizeOfpage, selectedPage);
		    
		    
		    
	  		
	  		const type = document.querySelector("#type").value;
	  		const pc = document.querySelector("#pc").value;
	  		const pk = document.querySelector("#pk").value;
	  		
			let move = null;
			if(type === "category") {
				// serve.do?productCategory=d&categoryOrKind=category
				move = "serve.do?productCategory="+pc+"&categoryOrKind=category";
			} else {
				// serve.do?productKind=2&categoryOrKind=kind
				move = "serve.do?productKind="+pk+"&categoryOrKind=kind";
			}
	    	location.href= move + "&curPage=" + (selectedPage - 1);
		});
	}
	
	
	$("document").ready(function(){
	    paging(totalResult, sizeOfpage, curPage);
	});
	
</script>
</body>
</html>