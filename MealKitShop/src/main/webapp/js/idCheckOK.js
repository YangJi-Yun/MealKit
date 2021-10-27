function apply(param){
	console.log(param);
	opener.document.membership_join.id.value=param;
	window.close(); //창닫기
}
	