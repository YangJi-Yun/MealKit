$( document ).ready(function() {
	$("input:checkbox[name=check]").prop("checked",true);
	setTotalPrice(1);
});


function itemQuantityCnt(type, id) {
	
	let el = null;
	let value = 0;
	
	if(type == 0) {
		el = id.nextElementSibling
		value = parseInt(el.value);
		value = value <= 1 ? value : (value - 1);
		
	} else {
		el = id.previousElementSibling;
		value = parseInt(el.value);
		value = value + 1;
	}
	
	console.log(value);
	el.value = value;

	// 각 상품 수량에 따른 가격
	setItemPrice(el, value);
	
	// 카트 결제 총 금액 계산
	setTotalPrice(2);
}


// 각 상품 수량에 따른 가격
function setItemPrice(el, cnt) {
	let data = el.getAttribute('data-card');
	console.log("data: " + data);
	
	const arrPrice = document.querySelectorAll('.arr_item_price');
	let price = arrPrice[data].getAttribute('data-price');  // 수량 1개에 대한 금액
	arrPrice[data].innerText = (price * cnt);
}


// 카트 결제 총 금액 계산
function setTotalPrice(type) {
	let arrPrice = document.querySelectorAll('.arr_item_price');	// 상품 배열
	let quantity = document.querySelectorAll('.quantity__cnt');		// 각 상품의 수량
	const checkboxes = document.querySelectorAll('.cart_buy');		// 체크박스 배열 - 체크된 상품만 금액 가져오기
	
	let sum = 0;		// 상품 합계
	let parcel = 2500;	// 택배비
	let total = 0;		// 상품 + 배송 합계
		
	if(arrPrice.length != quantity.length) {
		alert("페이지 오류");
		location.href = "main.do";	
	}
	//console.log(arrPrice.length);
	//console.log(quantity.length);
	
	//console.log("type: "+type);
	// type:1 모든 상품 금액, type:2 선택 상품 금액, type3: 상품없음.
	if(type == 1 || type == 2) {
		// Array.prototype.slice.call <- IE 브라우저 지원을 위한 것.
		Array.prototype.slice.call(arrPrice).forEach( function (el, i) {
			//console.log(el.innerText);
			
			if(type == 2) {
				// 체크된 상품만 금액 계산
				if(checkboxes[i].checked == true) {
					sum += new Number(el.innerText);   
				} else {
					sum += 0;
				}
			} else {
				if(checkboxes[i].checked == true) {
					// 모든 상품 금액 계산
					sum += new Number(el.innerText);   
				}
			}
		});
	}
	
	//console.log("total: "+total);
	//console.log("sum: "+sum);
	total = sum + parcel;
	
	document.querySelector('#pPrice').innerText = sum;
	document.querySelector('#pAmount').innerText = parcel;
	document.querySelector('#pTotalPrice').innerText = total;
	//console.log(11);
}





// 전체 삭제하기 버튼
document.querySelector('#all_del_btn').addEventListener('click', (el) => {
	setTotalPrice(3);
	location.href = "cartAllDelete.do";
})


// 삭제하기 버튼
const delBtn = document.querySelectorAll('.cart_item_delete-btn');
Array.prototype.slice.call(delBtn).forEach( function (element, i) {
	
	element.addEventListener("click", (e) => {
		
		hiddenProductId = document.querySelector('.hiddenProductId').value;
		hiddenCartTotalAmount = document.querySelector('.hiddenCartTotalAmount').value;
		//console.log(hiddenProductId);
		//console.log(hiddenCartTotalAmount);
		
		if(hiddenProductId != "" && hiddenCartTotalAmount > 0) {
			setTotalPrice(2);
			location.href = "cartDelete.do?productId="+ hiddenProductId +"&cartTotalAmount=" + hiddenCartTotalAmount;
			//location.href = "main.do";
		} else {
			alert("잘못된 경로입니다.");
			location.href = "main.do";
		}
	});
})



/*
 * nameCheck : 이벤트가 필요한 모든 체크박스 버튼의 name명
 * allCheckClass : 전체 체크박스 버튼의 class명
**/
function checkboxEvent(nameCheck, allCheckClass) {
	
	$("[type=checkbox][name="+nameCheck+"]").on("change", function() {
		
		// change() 이벤트가 발생한 체크박스의 checked 값을 받아온다.
		const check = $(this).prop("checked");
		
		// 전체 체크
	    if($(this).hasClass(allCheckClass)) {
			$("[type=checkbox][name="+nameCheck+"]").prop("checked", check);
			// 결제 총 금액
			setTotalPrice(1);
	
		// 단일 체크
		} else {
			const all = $("[type=checkbox][name="+nameCheck+"]." + allCheckClass);
	        let allcheck = all.prop("checked");
			
			
			// 현재 체크박스가 전체체크박스가 아닐 때 
	        if(check != allcheck){
				// 전체 체크박스 개수 (All 체크박스 제외) 
				let length = $("[type=checkbox][name="+ nameCheck +"]").not("." + allCheckClass).length;
				
				// 전체 체크박스 중 체크된 체크박스 개수 (All 체크박스 제외) 
	            let ckLength = $("[type=checkbox][name="+ nameCheck +"]:checked").not("." + allCheckClass).length;
				
	            if(length === ckLength){
	                all.prop("checked", true);
	            }else{
	                all.prop("checked", false);
	            }
	        }
			setTotalPrice(2);
		}	
	})
	//console.log(111);
	
}



/*
function selectAll(selectAll) {
	const checkboxes = document.getElementsByName('all_select');
	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}
*/



///////////////////////////////////////////////////////////////////////////////

/*
// 카트 결제 총 금액 계산
function setTotalPrice() {
	let arrPrice = document.querySelectorAll('.arr_item_price');
	let quantity = document.querySelectorAll('.quantity__cnt');
	
	let sum = 0;		// 상품 합계
	let parcel = 2500;	// 택배비
	let total = 0;		// 상품 + 배송 합계
		
	if(arrPrice.length != quantity.length) {
		alert("페이지 오류");
		location.href = "main.do";	
	}
	//console.log(arrPrice.length);
	//console.log(quantity.length);
	
	
	// Array.prototype.slice.call <- IE 브라우저 지원을 위한 것.
	Array.prototype.slice.call(arrPrice).forEach( function (el, i) {
		//console.log(el.innerText);
		
		let productPrice = el.innerText;
		let quantityCount = quantity[i].value;
		sum += (productPrice * quantityCount);   
	});
	
	total = sum + parcel;
	
	document.querySelector('#pPrice').innerText = sum;
	document.querySelector('#pAmount').innerText = parcel;
	document.querySelector('#pTotalPrice').innerText = total;
	console.log(11);
}*/