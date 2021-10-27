<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- googlefont -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<!-- js -->
<script src="js/main.js"></script>

<!-- Main CSS -->
<link rel="stylesheet" href="css/main.css">

<title>메인</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
    <!--Main-->
    <section>
         <!-- event slide -->
         <article class="main_event">
            <div id="carouselMain" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>  
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/main_event1.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="images/main_event2.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="images/main_event3.png" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselMain" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselMain" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </article>
        <!-- product_introduction -->
        <article class="main_procut_introduction">
            <div class="product_tit">
                <h3>이 상품 어때요?</h3>
            </div>
            <ul class="product_introduction">
                <li class="product_list">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0001'">
	                    <img class="thumbs" src="images/product1.png" >
	                    <div class="list_info">
	                        <span class="name"><a>[Everyday] 잡채 (냉동)</a></span>
	                        <span class="desc"><a>좋은날 꼭 필요한 반찬 (100g당 가격:1625원)</a></span>
	                    </div>
                	</div>
           		</li>
                <li class="product_list">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0002'">
	                    <img class="thumbs" src="images/product2_detail.png" >
	                    <div class="list_info">
	                        <span class="name"><a>[Everyday]군산갑오징어 삼겹살볶음(냉동)</a></span>
	                        <span class="desc"><a>매콤한 온가족 밥도둑</a></span>
	                    </div>
                	</div>
           		</li>
                <li class="product_list">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0003'">
	                    <img class="thumbs" src="images/product3.png" >
	                    <div class="list_info">
	                        <span class="name"><a>[콜린스 다이닝] 뿌리채소 비건만두</a></span>
	                        <span class="desc"><a>식감이 살아 있는 만두</a></span>
	                    </div>
                	</div>
           		</li>
                <li class="product_list">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0004'">
	                    <img class="thumbs" src="images/product4.png" >
	                    <div class="list_info">
	                        <span class="name"><a>대게장 새우 먹물 파스타</a></span>
	                        <span class="desc"><a>집에서 만나는 파스타 요리</a></span>
	                    </div>
                	</div>
           		</li>
                
            </ul>
        </article>
        <!-- product_sale -->
        <article class="product_sale">
            <div class="sale_tit">
                <h3>특가/혜택></h3>
            </div>
            <ul class="sale_list">
                <li class="sale_thumbs">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0005'">
	                    <img src="images/product5.png">
	                    <div class="sale_info">
	                        <span class="name">두부 버섯 쇠고기 전골</span>
	                        <span class="price">
	                                <span>8%</span>
	                        14628원</span>
	                        <span class="cost">15900</span>
	                    </div>
                    </div>
                </li>
                <li class="sale_thumbs">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0006'">
	                    <img src="images/product6.png">
	                    <div class="sale_info">
	                        <span class="name">우삼겹 순두부찌개</span>
	                        <span class="price">
	                                <span>8%</span>
	                        7314</span>
	                        <span class="cost">7950</span>
	                    </div>
                    </div>
                </li>
                <li class="sale_thumbs">
                	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0008'">
	                    <img src="images/product8.png">
	                    <div class="sale_info">
	                        <span class="name">불고기 얌운센</span>
	                        <span class="price">
	                                <span>15%</span>
	                        5780원</span>
	                        <span class="cost">6800</span>
	                    </div>
                    </div>
                </li>
                
            </ul>
        </article>
        <article class="product_hot">
            <div class="hot_tit">
                <h3>지금 가장 핫한 상품 ></h3>
            </div>
            <ul class="hot_list">
                <li class="hot_thumbs">
	            	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0009'">
	                    <img src="images/product9.png">
	                    <div class="hot_info">
	                        <span class="name"><a>닭가슴살 얌운</a></span>
	                        <span class="desc"><a>가볍게 즐기는 닭가슴살 누들 샐러드</a></span>
	                    </div>
                	</div>
                </li>
                <li class="hot_thumbs">
	            	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0010'">
	                    <img src="images/product10.png">
	                    <div class="hot_info">
	                        <span class="name"><a>차돌 마라탕면</a></span>
	                        <span class="desc"><a>마라와 차돌의 매콤한 만남</a></span>
	                    </div>
                	</div>
                </li>
                <li class="hot_thumbs">
	            	<div class="list" style="cursor: pointer;" onclick="location.href='productDesc.do?productId=P0011'">
	                    <img src="images/product11.png">
	                    <div class="hot_info">
	                        <span class="name"><a>미니어린이 불고기 떡볶이</a></span>
	                        <span class="desc"><a>달콤한 불고기와 쫄깃한 떡</a></span>
	                    </div>
                	</div>
                </li>
                
            </ul>
        </article>
    </section>
<jsp:include page="bottom.jsp" flush="false"/>
</body>
</html>