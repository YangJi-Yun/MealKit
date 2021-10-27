function pwCheck(){
	
	var pw = document.getElementById('pw').value;
	console.log(pw);
	var pwChk = document.getElementById('pwChk').value;
	
	if(pw.length<6 || pw.length>16){
			window.alert("비밀번호는 6자 이상 16자 이하여야 합니다.");
			document.getElementById('pw').value="";
			document.getElementById('pw').focus();
			console.log('1:'+pw);
	}
	
	if(document.getElementById('pw').value !="" && document.getElementById('pwChk').value!=""){
		if(pw!="" && pwChk !=""){
			if(document.getElementById('pw').value==document.getElementById('pwChk').value){
				document.getElementById('check').innerHTML="비밀번호 일치";
				document.getElementById('check').style.color="blue";
			}else if(pw !== pwChk){
				document.getElementById('check').innerHTML="비밀번호 불일치";
				document.getElementById('check').style.color="red";
				document.getElementById('pwChk').value="";
				document.getElementById('pwChk').focus();
			}
		}
	}
}

/*if(pw.length<6 || pw.length>16){
		window.alert("비밀번호는 6자 이상 16자 이하여야 합니다.");
		document.getElementById('pw').value="";
		document.getElementById('pw').focus();
	
	}else{
		for(let i =0; i<SC.length; i++){
			if(pw.indexOf(SC[i])!=-1){
				check_SC=1;
			}
			if(check_SC==0){
			window.alert("!,@,#,$,%,^,&의 특수문자가 포함되지 않았습니다.");
			document.getElementById('pw').value="";
			document.getElementById('pw').focus();
			check_SC=0;
			}
		}
	}*/
		
	/*if(document.getElementById('pw').value !="" && document.getElementById('pwChk').value!=""){
		if(pw!="" && pwChk !=""){
			if(document.getElementById('pw').value==document.getElementById('pwChk').value){
				document.getElementById('check').innerHTML="비밀번호가 일치합니다.";
				document.getElementById('check').style.color="blue";
			}else if(pw !== password){
				window.alert("비밀번호가 일치하지 않습니다.");
				document.getElementById('pwChk').value="";
				document.getElementById('pwChk').focus();
			}
		}
	}*/