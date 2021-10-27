function idCheck()
	{
		let id=document.getElementById('id').value;
		let url="idCheckForm.jsp?id="+id;
		window.open(url, "idCheckForm", "width=400, height=300");
	}
	
function blankCheck(f){
		var id=f.id.value;
		id=id.trim();
		if(id.length<5){
			alert("아이디는 5자 이상 입력해주십시오.");
			return false;
		}
		return true;
	}
function apply(param){
	console.log(param);
	opener.document.membership_join.id.value=param;
	window.close(); //창닫기
}
	



