<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop eCommerce HTML CSS Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/resources/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">

    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="/resources/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.min.css">
    
    <!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba11103bc3fedcece5c96fbe33782be3&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba11103bc3fedcece5c96fbe33782be3"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba11103bc3fedcece5c96fbe33782be3&libraries=services,clusterer,drawing"></script>
    <!-- bootstrap 참조 시작 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">													
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													
    <!-- bootstrap 참조 끝 -->
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->

<!-- Start Script -->
    <script src="/resources/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/assets/js/templatemo.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <!-- End Script -->
    <script>
    $(function() {
    	var header = $("#header");
    	
    	 $(".nav-item").mouseenter(function() {
    		$(".smenu").hide();
    		var a = $(this).attr("id");
    		header.stop().animate({height:'150px'}, 300);
    		$("#s"+a).show();
    	});
    	
    	 header.mouseleave(function() {
    		 $(".smenu").hide();
    		header.stop().animate({height:'90px'}, 300);
    	});
    });
    </script>
    <style>
   #header{
 	height:90px; 
  	overflow:hidden;
   }
   
   .smenu {
    position : absolute;
    display:none;
   }
   
   .smenu_a {
   text-decoration: none;
   color: black;
   margin-right: 30px;
   
   }
    </style>
</head>

<body>
    <script>

    $(document).ready(function(){
//     	마우스 커서 위치에 따른 좌표 start
    	$(document).on("mousemove",function(e) {
    	   $("#log").text(e.pageX+", "+e.pageY);
    	});
//     	마우스 커서 위치에 따른 좌표 end

//      서브 메뉴 위치 선정 start
    	for (var v = 1; v < 4; v++) {
    		 var left = $("#a_" + v).offset().left;
    		 $("#smenu_"+v).offset({left: left});
    	}
    	     
   	   	$(window).resize(function(e){
   	   		for (var v = 1; v < 4; v++) {
   	   			var left = $("#a_" + v).offset().left;
	    		$("#smenu_"+v).offset({left: left});
   	   		}
   	   	});	
//      서브 메뉴 위치 선정 end
   	   	
	   	 
    });
    </script>

    <!-- Header -->
    <header id="header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="/">
                Zay
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
              <div class="flex-fill">
                <div>
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto clearfix"  id="navul">
                        <li class="nav-item" id="menu_1">
                            <a class="nav-link" id="a_1" href="#">마이 카풀</a>
                        </li>
                        <li class="nav-item" id="menu_2">
                            <a class="nav-link" id="a_2"  href="#">서비스 안내</a>
                        </li>
                        <li class="nav-item"  id="menu_3">
                            <a class="nav-link" id="a_3" href="/event/now">이벤트 & 혜택</a>
                        </li>
                    </ul>
                   
                </div>
                
<!--                 <div> -->
<!--                 	<ul class="nav navbar-nav d-flex "> -->
<!-- 						<li class="nav-item"><a class="nav-link">아이템</a></li> -->
<!-- 						<li class="nav-item"><a class="nav-link">아이템</a></li> -->
<!-- 					</ul> -->
<!--                 </div> -->
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                    <c:choose>
                    	<c:when test="${not empty loginVo}">
                    		<p>${loginVo.m_name}님 환영합니다.</p>
                    	</c:when>
	                    <c:otherwise>
	                    	<a href="/member/loginForm">로그인</a>
		                    <a href="/member/joinForm">회원가입</a>
	                    </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>
    </nav>
    <nav>
	    <div class="smenu" id="smenu_1">
	    	<a class="smenu_a" href="/my/boardedHistory">탑승 내역</a>
	    	<a class="smenu_a" href="/my/pointHistory">포인트 내역</a>
	    	<a class="smenu_a" href="/my/purchasePoint">충전하기</a>
	    	<a class="smenu_a" href="/my/registerDriver">운전자 등록</a>
	    </div>
	    <div class="smenu" id="smenu_2">
	    	<a class="smenu_a" href="/serviceInfo/method">예약 방법</a>
	    	<a class="smenu_a" href="/serviceInfo/describe">포인트</a>
	    </div>
	    <div class="smenu" id="smenu_3">
	   		<a class="smenu_a" href="/event/now">진행중인 이벤트</a>
	    	<a class="smenu_a" href="/event/winner">당첨자 발표</a>
	    	<a class="smenu_a" href="/event/info">등급별 혜택</a>
	    </div>
	</nav>
    </header>
    <!-- Close Header -->
    
<!-- 좌표 -->
<!-- <div id="log"></div> -->
<!-- /좌표 -->
    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



   