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

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="false"/>
	
	
	<div class="search_content">
		<div class="tit_page">
			<h2 class="tit">상품검색</h2>
		</div>
		
		<form id="formList" action="searchOK.do" method="post" onsubmit="return doActionSearch()">
			<div class="search_box">
				<div class="tit">
					<label for="sword">검색조건</label>
				</div>
				<div class="desc">
					<!-- <input type="hidden" name="curPage" value="${curPage}" /> -->
					<input type="text" name="sword" id="sword2" class="inp" value="${sword }">
					<input type="submit" class="btn_search" id="search_btn" value="검색하기">
				</div>
			</div>
		</form>
		
		<div class="searchList">
			<p class="list_result">총<span class="list_result_total">${totalResult}</span>건</p>
			<input type="hidden" class="lsit_size_of_page" value="${sizeOfPage}" />
			<div class="list_products">
				<div class="list_inner">
					<ul class="list">
						<c:forEach var="dto" items="${list}">
							<li class="list_item">
								<a href="productDesc.do?productId=${dto.productId }">
									<div class="item_box">
										<div class="item_image">
										<!-- <img src="imageFolder/product2.png" class="item_img"> -->
											<img src="imageFolder/${dto.productImage }" class="item_img">
										</div>
										<div class="item_info">
											<span class="item_name">${dto.productName }</span>
											<span class="item_price">
												<c:if test="${dto.discount ne '0' }"><span class="item_dc">${dto.discount }%</span></c:if>
												${dto.price }원
											</span>
											<c:if test="${dto.discount eq '0' }">
												<span class="item_desc">${dto.productDesc }</span>
											</c:if>
											<c:if test="${dto.discount ne '0' }">
												<span class="item_cost">${dto.cost }원</span>
											</c:if>
										</div>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="list_paging">
				<div class="paging">
					<!-- <a href="#!" class="paging_first"><i class="fas fa-angle-double-left"></i></a> -->
					<!-- <a href="#!" class="paging_before"><i class="fas fa-angle-left"></i></a> -->
					<!-- <input type="hidden" id="totalPage" value="${totalPage}"/> -->
					<div id="pagingGroupBox"></div>
					<!-- <a href="#!" class="paging_after"><i class="fas fa-angle-right"></i></a> -->
					<!-- <a href="#!" class="paging_last"><i class="fas fa-angle-double-right"></i></a> -->
				</div>
			</div>
		</div>
	</div>
	
	
	
	<jsp:include page="bottom.jsp" flush="false"/>
	
	<script>
	
		// 검색어 submit 전 유효성 검사
		function doActionSearch() {
			//console.log("search 유효성 검사");
			const value = document.querySelector('#sword2').value;
			if(value == "" || value == null) return false;
			else return true;
		}
	
	
		////////////////////////////////////////////////////////////////////////
		// 페이징
		// 총 데이터 수
		let totalResult = document.querySelector('.list_result_total').innerText;
		// 한 페이지에 나타낼 데이터 수
		let sizeOfpage = document.querySelector('.lsit_size_of_page').value;
		// 현재 페이지
		let curPage = ${curPage};
		curPage += 1;
		// 한 페이지에 나타낼 페이지 수
		let pageGroup = ${sizeOfPage};
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
			    
			    let sword = document.querySelector('#sword2').value;
			    if(sword != null && sword != "")
			    	location.href= "searchOK.do?sword="+ sword +"&curPage=" + (selectedPage - 1);
			});
		}
		
		
		$("document").ready(function(){
		    paging(totalResult, sizeOfpage, curPage);
		});
		
	</script>
</body>
</html>

<!-- 
<li class="list_item">
	<div class="item_box">
		<div class="item_image">
			<a href="#!" class="item_link">
				<img src="images/add_product7.png" class="item_img">
			</a>
		</div>
		<div class="item_info">
			<span class="item_name">[해올림] 무항생제 돼지 등심 다짐육 300g(냉동)</span>
			<span class="item_price"><span class="item_dc">20%</span>6,720원</span>
			<span class="item_original">8,400원</span>
			<span class="item_desc">네 가지 특수부위를 고루 담은!</span>
		</div>
	</div>
</li>
 -->