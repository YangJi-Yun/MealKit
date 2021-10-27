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
<title>Insert title here</title>
</head>
<body>
<div id="#hiddenList" >
	<ul class="product_list">
        <c:forEach var="dto" items="${list}">
        	<li>
		    	<div class="item">
                  <div class="thumbs">
		            <a><img src="images/serve_product1.png" ></a>
        		    <div class="shopping_cart"><span class="material-icons-outlined">shopping_cart</span>
			        </div>
   			      </div>
				  <div class="info">
                	<a>${dto.productName }</a>
		            <span class="cost">
            		<span>${dto.discount }</span>
        	          ${dto.price }</span>
			        <span class="desc">${dto.productDesc }</span>
            	  </div>
		        </div>
        	  </li>
		   	</c:forEach> 
	</ul>
</div>
</body>
</html>