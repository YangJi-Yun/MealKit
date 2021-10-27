function productQNAList(){
	console.log("2");

	let modal_tit =$('#modal_tit').val();
	let modal_contents=$('#modal_contents').val();
	let productId=$('#modal_productId').val();
	
	
	$.ajax({
    	type:'post',
		async:false, //false가 기본값임 - 비동기
        url:'productQNA.do',
        data:{
			modal_tit: modal_tit,
			modal_contents: modal_contents,
			productId: productId
		},
		dataType: "text",
        success:function(result) {
			console.log("1");
			/*let html=jQuery('<div>').html(result);
			let contents = html.find("div#hiddenList").html();
			//$('.products').load("productSort.jsp #hiddenList");
			console.log(contents);
			$('.products').html(contents);*/
			//console.log(result);
			
			let html = '';
			html += '<div class="list_tit">';
			html += '<div class="title"><span>제목</span></div>';
			html += '<div class="id"><span>작성자</span></div>';
			html += '<div class="wtime"><span>작성일</span></div>';
			html += '<div class="yOn"><span>답변상태</span></div>';
			html += '</div>';
	
			
			let str = result;
		    let strSplit = str.split('^%$#@!');
		    for ( let i in strSplit ) {
				let strSplit2 = strSplit[i].split('!@#$%^');
				
				//console.log("0: " + strSplit2[0]);
				html += '<div class="questions" onclick="getShow()">';
				
				html += '<div class="title"><span>'+strSplit2[1]+'</span></div>';
				html += '<div class="id"><span>'+strSplit2[2]+'</span></div>';
				html += '<div class="wtime"><span>'+strSplit2[3]+'</span></div>';
				
				html += '<div class="yOn">';
				if(strSplit2[4] == "n") {
					html += '<span>미완료</span>';
					html += '</div>';
					
				} else {
					html += '<span>답변 완료</span>';
					html += '</div>';
					html += '<div class="answer">';
					html += '<span>'+strSplit2[4]+'</span>';
					html += '</div>';
				}
				html += '</div>';
				
				html += '</div>';
		    }

			// 여기

			html += '<button type="button" id="qBtn" data-bs-toggle="modal" data-bs-target="#myModal">문의하기</button>';
			
			$(".btn-danger").trigger("click");
			$('.qna_list').html(html).html();
						
        },
        error:function (request,error) {
           alert("code:"+request+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });    //ajax
};

/*productQNACommand
ArrayList<QnADTO> list = dao.productQnaListDAO(curPageQ, request.getParameter("productId"));
String listString = "";
		for(QnADTO item:list) {
			System.out.println("인덱스1");
			listString += item.getNo();
			//listString += "!@#$%^";
			listString += "!@#$%^";
			listString += item.getTitle();
			listString += "!@#$%^";
			listString += item.getId();
			listString += "!@#$%^";
			listString += item.getWtime();
			listString += "!@#$%^";
			listString += item.getAnswer();
			listString += "!@#$%^";
			listString += item.getContents();
			listString += "!@#$%^";
			listString += "^%$#@!";
		}
		
		request.setAttribute("listString", listString);

컨트롤러
command = new productQNACommand();
			command.excute(request, response);
			
			String listString = (String) request.getAttribute("listString");
			
			response.setContentType("text/html;charset=utf-8");
			System.out.println("내용2: "+listString);
			PrintWriter out =response.getWriter();
			out.print(listString);
			out.close();
			// 여기
			flag=3;
			if(flag==0) {
			response.sendRedirect(viewPage);
		} else if(flag==1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);			
		} else {
			
		}
	}*/