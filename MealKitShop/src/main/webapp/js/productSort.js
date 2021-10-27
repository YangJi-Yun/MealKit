function productSort(param){
	console.log("2");
	console.log(param);

	let modal_tit =$('#modal_tit').val();
	let modal_contents=$('#modal_contents').val();
	let productId=$('#modal_productId').val();
	
	console.log(productCategory);
	$.ajax({
          type:'post',
            async:false, //false가 기본값임 - 비동기
            url:'productQNA.do',
            data:{
				modal_tit: modal_tit,
				modal_contents: modal_contents,
				productId: productId
				},
            success: function(result) {
				console.log("1");
				/*let html=jQuery('<div>').html(result);
				let contents = html.find("div#hiddenList").html();
				//$('.products').load("productSort.jsp #hiddenList");
				console.log(contents);
				$('.products').html(contents);*/
				let httpRequest;
				testRequest();
				function testRequest() {
				    httpRequest = new XMLHttpRequest();
			
			    	if(!httpRequest) {
			      alert('XMLHTTP 인스턴스생성 실패');
			      return false;
			    }
			    httpRequest.onreadystatechange = testAlert;
			    httpRequest.open('GET', 'productSort.jsp');
			    httpRequest.send();
			  }
			
			  function testAlert() {
			    if (httpRequest.readyState === XMLHttpRequest.DONE) {
			      if (httpRequest.status === 200) {
			        //alert(httpRequest.responseText);
					$('.products').html(httpRequest.responseText);
			      } else {
			        alert('실패');
			      }
			    }
			  }
							
            },
            error:function (request,error) {
               alert("code:"+request+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });    //ajax
};


