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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- fontawesome -->
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<!-- googlefont -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<!-- Main CSS -->
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/manager_user.css">
<title>회원관리</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
  <div class="manager_page">
    <jsp:include page="managerPage_snb.jsp" flush="false"/>
    <!-- board -->
    <div class="board">
      <div class="user_tit"><h3>회원관리</h3></div>
      <div class="search">
        <form method="post" action="searchUser.do">
            <input type="text" name="searchKeyword" placeholder="이름, 아이디, 휴대폰, 이메일">
            <div class="icon" onClick="document.forms['form'].submit();"><i class="fas fa-search"></i></div>
        </form>
      </div>
      <input type="hidden" value="${selectUser}" id="selectboxType">
      <form action="selectUser.do" method="get" id="formUserSelect">
	      <select name="user" id="user" onchange="selectChange()">
	        <option value="n">회원</option>
	        <option value="y">탈퇴</option>
	        <option value="0">전체 회원</option>
	      </select>
      </form>
      <input type="hidden" id="curPage" value="${curPage}" />
      <input type="hidden" id="sizeOfPage" value="${sizeOfPage}" />
      <div class="selectList">
	  	<p class="list_result" style="float:right;">총<span class="list_result_total">${totalResult}</span>건</p>
	  	<input type="hidden" class="lsit_size_of_page" value="${sizeOfPage}" />
		<div class="list_products">
			<div class="list_inner">
				<c:if test="${list.size() == 0 }">
			        <div class="contents">
			          <span>회원 리스트를 찾을 수 없습니다.</span>
			        </div>
		      	</c:if>
	     	  	<c:if test="${list.size() != 0 }">
			        <c:forEach var="dto" items="${list }">
			          <table>
			            <tr>
			              <td>이름</td><td>${dto.name }</td><td>아이디</td><td>${dto.id }</td><td>가입한 날짜</td><td>${dto.wTime}</td>
			              <td>탈퇴여부</td>
			              <td>
			              	<c:if test="${dto.withdrawal eq 'n'}">회원</c:if>
			              	<c:if test="${dto.withdrawal ne 'n'}">탈퇴</c:if>
			              </td>
			            </tr>
			            <tr>
			              <td>전화번호</td><td>${dto.cellphone}</td><td>이메일</td><td>${dto.email}</td><td>성별</td><td>${dto.gender }</td><td>생일</td><td>${dto.birthYear}년 ${dto.birthMonth}월 ${dto.birthDate}일</td>
			            </tr>
			            <tr>
			              <td>주소</td><td colspan="7">${dto.postcode} ${dto.roadAddress} ${dto.jibunAddress} ${dto.detailAddress} ${dto.extraAddress}</td>
			            </tr>
			          </table>
			        </c:forEach>
		     	 </c:if>
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
  </div>
  <script>
  	let selectboxType = document.querySelector('#selectboxType').value;
  	if(selectboxType == "") selectboxType = "n";
  	$("#user > option[value="+selectboxType+"]").attr("selected", "true");
  
  	function selectChange(){
  		const select = document.getElementById('user');
  		const selectUser=select.options[select.selectedIndex].value;
  		console.log("selectUser: "+selectUser);
  		
  		//location.href = "";
  		document.querySelector('#formUserSelect').submit();
  	}
  	
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
		    
		    
		    const select = document.getElementById('user');
	  		const selectUser=select.options[select.selectedIndex].value;
	  		//console.log("selectUser: "+selectUser);
	    	location.href= "selectUser.do?user="+selectUser+"&curPage=" + (selectedPage - 1);
		});
	}
	
	
	$("document").ready(function(){
	    paging(totalResult, sizeOfpage, curPage);
	});
  </script>
<jsp:include page="bottom.jsp" flush="false"/>
</body>

</html>