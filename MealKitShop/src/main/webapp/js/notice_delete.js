let chk_arr=[];
function deleteValue(){
  $("input[name=all_select]:checked").each(function(index){
    if($(this).is(":checked")){
      let chk=$(this).val();
      console.log(chk);
      chk_arr.push(chk);
    }
    console.log(chk_arr);
	$.ajax({
		
    	type:'post',
		async:false, //false가 기본값임 - 비동기
        url:'deleteNotice.do',
        data:{
			chk_arr:chk_arr
		},
		dataType: "text",
        success:function(result) {
			console.log("성공" + result);
		 },
        error:function (request,error) {
           alert("code:"+request+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});   //ajax
  });
}