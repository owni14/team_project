<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>관리자 접속</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <[endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <!-- Favicon icon -->
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="/resources/admin/assets/css/bootstrap/css/bootstrap.min.css">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="/resources/admin/assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="/resources/admin/assets/icon/icofont/css/icofont.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="/resources/admin/assets/css/style.css">
      <link rel="stylesheet" type="text/css" href="/resources/admin/assets/css/jquery.mCustomScrollbar.css">
  		<script type="text/javascript" src="/resources/admin/assets/js/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="/resources/admin/assets/js/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/resources/admin/assets/js/popper.js/popper.min.js"></script>
		<script type="text/javascript" src="/resources/admin/assets/js/bootstrap/js/bootstrap.min.js"></script>
		<!-- jquery slimscroll js -->
		<script type="text/javascript" src="/resources/admin/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
		<!-- modernizr js -->
		<script type="text/javascript" src="/resources/admin/assets/js/modernizr/modernizr.js"></script>
		<script type="text/javascript" src="/resources/admin/assets/js/modernizr/css-scrollbars.js"></script>
		<!-- classie js -->
		<script type="text/javascript" src="/resources/admin/assets/js/classie/classie.js"></script>
		<!-- Morris Chart js -->
		<script src="/resources/admin/assets/js/raphael/raphael.min.js"></script>
		<script src="/resources/admin/assets/js/morris.js/morris.js"></script>
		<!-- am chart -->
		<script src="/resources/admin/assets/pages/widget/amchart/amcharts.min.js"></script>
		<script src="/resources/admin/assets/pages/widget/amchart/serial.min.js"></script>
		<!-- Todo js -->
		<script type="text/javascript " src="/resources/admin/assets/pages/todo/todo.js "></script>
		<!-- Custom js -->
		<script src="/resources/admin/assets/pages/chart/morris/morris-custom-chart.js"></script>
		<script type="text/javascript" src="/resources/admin/assets/pages/dashboard/custom-dashboard.js"></script>
		<script type="text/javascript" src="/resources/admin/assets/js/script.js"></script>
		<script type="text/javascript " src="/resources/admin/assets/js/SmoothScroll.js"></script>
		<script src="/resources/admin/assets/js/pcoded.min.js"></script>
		<script src="/resources/admin/assets/js/demo-12.js"></script>
		
		<script src="/resources/admin/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<!-- add fontawesome CDN -->
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<!-- chartjs -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.esm.js" integrity="sha512-YM18yiANXJFpbiOZjLzUrK/lNfTiBcwtTLeAntG4B8dJY+NdUDjxfPNGPEMuOdXlT7U/uT+zbIvbQYAEFog+MA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.esm.min.js" integrity="sha512-yPOQ2pPoQ9JtP0/jDKpXiKyWNCJWT5OI+6r1EqZmTg+afKQOBpy08VYboeq+Tt9kl9/FOCueEhH6cmHN3nAdJA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.js" integrity="sha512-5m2r+g00HDHnhXQDbRLAfZBwPpPCaK+wPLV6lm8VQ+09ilGdHfXV7IVyKPkLOTfi4vTTUVJnz7ELs7cA87/GMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/helpers.esm.js" integrity="sha512-dSutS1n8KEMUnQMa9YGa6CxAmoUfaZdxL2+s2xBgEq7WHaWdtjna/rzGsjqkT27GxKBDLT0Fr3C/TzzHvBRaAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/helpers.esm.min.js" integrity="sha512-vxCPccgWacJoW2HlxhlKKtczdzvcg0r1UuB9LfNGt6vsDbgLfSFxKlolUS2mqKNXrOK5b93S45309T+V5BhueA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

		<!-- CDN chart.js -->
<!-- naver smartEditor -->
<script type="text/javascript" src="/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 	<!-- bootstrap -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1">													 -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													 -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													 -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													 -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													 -->
<!--     bootstrap 참조 끝 -->
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
	$(document).ready(function () {
// 		$("#notifyList").click(function (e) {
// 			e.preventDefault();
// 			$("#frmReport").submit();
// 		});
// 		$("#notifyCompleteList").click(function (e) {
// 			e.preventDefault();
// 			$("#frmReportComplete").submit();
// 		});
	
	});
</script>
  
  </head>

  <body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">

                    <div class="navbar-logo" style="background-color:white">
                    <a href="/admin/home">
                        <img src="/resources/images/companyLogo/logo.jpg" width="120" height="47.65" alt="로고이미지">
                        </a>
                        <a class="mobile-menu" id="mobile-collapse" >
                            <i class="ti-menu" style="color:black"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" >
                            <i class="ti-search"></i>
                        </a>
                        <a href="/admin/home">
                         
                        </a>
                        
                        <a class="mobile-options" >
                            <i class="ti-more"></i>
                        </a>
                    </div>

                    <div class="navbar-container container-fluid">
                        <ul class="nav-left" style="width:50%;">
                         

                            <li>
                            
                               
                            </li>
                        </ul>
                        <ul class="nav-right">
                          
                            <li class="user-profile header-notification">
                                <a>
                                    <img class="img-radius" alt="프로필"
                                    	<c:choose>
                                    		<c:when test="${admin_code == '1001'}">
                                    			src="/resources/images/managerimage/gm1.png" 
                                    		</c:when>
                                    		<c:when test="${admin_code == '1002'}">
                                    			src="/resources/images/managerimage/cs11.png" 
                                    		</c:when>
                                    		<c:when test="${admin_code == '1003'}">
                                    			src="/resources/images/managerimage/cs21.png" 
                                    		</c:when>
                                    		<c:when test="${admin_code == '1004'}">
                                    			src="/resources/images/managerimage/cm1.png" 
                                    		</c:when>
                                    	</c:choose>
                                    >
                                    <span>관리자 ${admin_code}</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
<!--                                     <li> -->
<!--                                         <a href="#!"> -->
<!--                                             <i class="ti-settings"></i> Settings -->
<!--                                         </a> -->
<!--                                     </li> -->
                                   
                                    <li>
                                        <a href="/admin/checkMyMessage">
                                            <i class="ti-email"></i>
                                            My Messages
                                        </a>
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="#"> -->
<!--                                             <i class="ti-lock"></i> Lock Screen -->
<!--                                         </a> -->
<!--                                     </li> -->
                                    <li>
                                        <a href="/admin/logout">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        
                    </div>
                </div>
            </nav>
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="">
                                <div class="main-menu-header">
                                    <img class="img-40 img-radius" 
                                    	<c:choose>
                                    		<c:when test="${admin_code == '1001'}">
                                    			src="/resources/images/managerimage/gm1.png" 
                                    		</c:when>
                                    		<c:when test="${admin_code == '1002'}">
                                    			src="/resources/images/managerimage/cs11.png" 
                                    		</c:when>
                                    		<c:when test="${admin_code == '1003'}">
                                    			src="/resources/images/managerimage/cs21.png" 
                                    		</c:when>
                                    		<c:when test="${admin_code == '1004'}">
                                    			src="/resources/images/managerimage/cm1.png" 
                                    		</c:when>
                                    	</c:choose>
                                    	alt="관리자 이미지"
                                    	>
                                    <div class="user-details">
                                        <span>관리자 코드
                                        </span>
                                        <span id="more-details">${admin_code}
<!--                                      	   <i class="ti-angle-down"></i> -->
                                        </span>
                                	
                                    </div>
                                </div>

<!--                                 <div class="main-menu-content"> -->
<!--                                     <ul> -->
<!--                                         <li class="more-details"> -->
<!--                                             <a href="#"><i class="ti-user"></i>View Profile</a> -->
<!--                                             <a href="#!"><i class="ti-settings"></i>Settings</a> -->
<!--                                             <a href="auth-normal-sign-in.html"><i class="ti-layout-sidebar-left"></i>Logout</a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
                            </div>
                            <!-- 검색 영역 -->
                            
<!--                             <div class="pcoded-search"> -->
<!--                             <select class="form-control" style="height:26px;margin-bottom: 5px"> -->
<!--                             <option> -->
<!--                             </option></select> -->
<!--                                 <span class="searchbar-toggle">  </span> -->
<!--                                 <div class="pcoded-search-box "> -->
<!--                                     <input type="text" placeholder="검색"> -->
<!--                                     <span class="search-icon"><a> -->
<!--                                     <i class="ti-search" aria-hidden="true"></i> -->
<!--                                     </a></span> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <!-- 검색영역 끝 -->
<!--                             <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">회원</div> -->
<!--                             <ul class="pcoded-item pcoded-left-item"> -->
<!--                                 <li class="active"> -->
<!--                                     <a href="#"> -->
<!--                                         <span class="pcoded-micon"><i></i><b>D</b></span> -->
<!--                                         <span class="pcoded-mtext">회원관리</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li class="pcoded-hasmenu"> -->
<!--                                     <a href="javascript:void(0)"> -->
<!--                                         <span class="pcoded-micon"><i></i></span> -->
<!--                                         <span class="pcoded-mtext" >신고회원관리</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                     <ul class="pcoded-submenu"> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="accordion.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Accordion</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="breadcrumb.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Breadcrumbs</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="button.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Button</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="tabs.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Tabs</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="color.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Color</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="label-badge.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Label Badge</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="tooltip.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tooltip</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="typography.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Typography</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="notification.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Notification</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="icon-themify.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Icon</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->

<!--                                     </ul> -->
<!--                                 </li> -->
<!--                             </ul> -->
<div class="to-do-list"></div>
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.forms" style="padding-top:0px">회원</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
<!--                                     <a href="/admin/member_management"> -->
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon" style="background-color:#148CFF"><i class="ti-user"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">회원 관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <!-- 아이콘 추가 0615 -->
                                     <ul class="pcoded-submenu">
                                         
                                        <li class="more-details">                                       
                                        		<a href="/admin/member_management?page=1"><i class="icofont icofont-listing-box"></i> &nbsp; 회원 테이블</a>
                                        </li>
                                        <li class="more-details">
                                        		<a href="/admin/member_update_management"><i class="icofont icofont-tasks"></i> &nbsp; 회원 정보 수정 내역</a>
                                        </li>
                                        <li class="more-details">
                                        		<a href="/admin/approveDriver_management"><i class="icofont icofont-ui-v-card"></i> &nbsp; 운전자 미승인 테이블</a>
                                        </li>
                                     </ul>
                                	<!-- 아이콘 추가 0615  끝-->
                                </li>
                             </ul> 
                             

							<ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon" style="background-color:#FF5A5A"><i class="ti-alert"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">신고 회원 관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <!-- 아이콘 추가 0609 -->
                                     <ul class="pcoded-submenu">
                                         
                                        <li class="more-details">
<!--                                             <a id="notifyList" href="/admin/report_management"><i class="icofont icofont-not-allowed"></i> &nbsp; 신고 리스트 현황</a> -->
                                        		<form id="frmReport" action="/admin/report_management" method="post"></form>
                                        		<a href="/admin/report_management"><i class="icofont icofont-not-allowed"></i> &nbsp; 신고 리스트 현황</a>
                                        </li>
                                        <li class="more-details">
<!--                                             <a id="notifyCompleteList" href="/admin/report_complete_management"><i class="icofont icofont-checked"></i> &nbsp; 신고 완료 리스트 현황</a> -->
                                      			<form id="frmReportComplete" action="/admin/report_complete_management" method="post"></form>
                                        		<a href="/admin/report_complete_management"><i class="icofont icofont-checked"></i> &nbsp; 신고 완료 리스트 현황</a>
                                        </li>
                                     </ul>
                                	<!-- 아이콘 추가 0609  끝-->
                                </li>
                                
                            </ul>

                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.forms">이벤트</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon" style="background-color:#FF9696"><i class="ti-gift"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">이벤트</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                   <!-- 아이콘 추가 0609 -->
                                        <ul class="pcoded-submenu">
                                         
                                        <li class="more-details">
                                            <a href="/admin/event"><i class="icofont icofont-list"></i> &nbsp; 이벤트 목록</a>
                                        </li>
                                         <li class="more-details">
                                            <a href="/admin/event_insertForm"><i class="icofont icofont-plus-square"></i> &nbsp; 이벤트 추가하기</a>
                                        </li>
                                         <li class="more-details">
                                            <a href="/admin/event_participation"><i class="icofont icofont-win-trophy"></i> &nbsp; 이벤트 참가자 관리</a>
                                        </li>
                                  
                                      
                                            </ul>
                                            <!-- 아이콘 추가 0609  끝-->
                                    </li>
                               
                                
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="map-google.html"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.form-components.main">Maps</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li class="pcoded-hasmenu"> -->
<!--                                     <a href="javascript:void(0)"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span> -->
<!--                                         <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Pages</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                     <ul class="pcoded-submenu"> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="auth-normal-sign-in.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Login</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="auth-sign-up.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Register</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="sample-page.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Sample Page</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
                                
                            </ul>

<!--                             <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">Other</div> -->
<!--                             <ul class="pcoded-item pcoded-left-item"> -->
<!--                                 <li class="pcoded-hasmenu "> -->
<!--                                     <a href="javascript:void(0)"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">Menu Levels</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                     <ul class="pcoded-submenu"> -->
<!--                                         <li class=""> -->
<!--                                             <a href="javascript:void(0)"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">Menu Level 2.1</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class="pcoded-hasmenu "> -->
<!--                                             <a href="javascript:void(0)"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-direction-alt"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Menu Level 2.2</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                             <ul class="pcoded-submenu"> -->
<!--                                                 <li class=""> -->
<!--                                                     <a href="javascript:void(0)"> -->
<!--                                                         <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                         <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu Level 3.1</span> -->
<!--                                                         <span class="pcoded-mcaret"></span> -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
<!--                                         <li class=""> -->
<!--                                             <a href="javascript:void(0)"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">Menu Level 2.3</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->

<!--                                     </ul> -->
<!--                                 </li> -->
<!--                             </ul> -->
 <div class="pcoded-navigatio-lavel" data-i18n="nav.category.forms">서비스</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu" >
                                    <a href="javascript:void(0)" id="aService">
                                        <span class="pcoded-micon" style="background-color:#54BD54"><i class="ti-help-alt"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">문의관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                     <!-- 아이콘 추가 0609 -->
                                        <ul class="pcoded-submenu service">
                                         
                                        <li class="more-details">
                                            <a href="/admin/complainForm"><i class="icofont icofont-hour-glass"></i> &nbsp; 대기중 답변 목록</a>
                                        </li>
                                         <li class="more-details">
                                            <a href="/admin/complainAnswerComplete"><i class="icofont icofont-check-circled"></i> &nbsp; 처리 완료 문의</a>
                                        </li>
                                         
                                  
                                      
                                            </ul>
                                            <!-- 아이콘 추가 0609  끝-->
                                    </li>
                                     
                                    </ul>
                                    <!-- add menu -->
                            
                        <!-- end menu -->
                        </div>
                    </nav>
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">