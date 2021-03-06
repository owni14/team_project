<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<script>
	$(document).ready(function (e) {
		var frmApproveNotify = $("#frmApproveNotify");
		var frmPaging = $("#frmPaging"); 
		$(".check").click(function (e) {
			e.preventDefault();
			var blacklist_seqValue = $(this).attr("data-blacklistSeq");
			var admin_checkValue = $(this).attr("data-value");
			var blackScoreValue = $("#spanBlackPoint").attr("data-blackpoint");
			var black_m_id = $(this).attr("data-blackid");
			console.log(admin_checkValue); // 반려 : C, 반려 취소 : N, 승인 : Y
// 			console.log("벌점 : " + blackScoreValue);
// 			frmApproveNotify.find("input[name=refresh]").val(1);
			frmApproveNotify.find("input[name=blacklist_seq]").val(blacklist_seqValue);
			frmApproveNotify.find("input[name=admin_check]").val(admin_checkValue);
			if (admin_checkValue == "N" || admin_checkValue == "C") {
				frmApproveNotify.find("input[name=black_score]").val(0);
				
			} else if (admin_checkValue == "Y") {
				frmApproveNotify.find("input[name=black_m_id]").val(black_m_id);
				frmApproveNotify.find("input[name=black_score]").val(blackScoreValue);
			}
				frmApproveNotify.attr("action","/admin/modifyBlackPoint");
				frmApproveNotify.attr("method","post");
				frmApproveNotify.submit();
		});
		
		$(".c-complete").click(function () {
			$("#modal-97340").trigger("click");
			var blacklist_seq = $(this).attr("data-blacklistseq");
			var reporter = $(this).attr("data-notifying");
			var black_content = $(this).attr("data-content");
			$("#thReporter").text(reporter);
			$("#btnModalSend").attr("data-blacklistseq",blacklist_seq);
			$("#txtReportContent").val("신고 내용 : " + black_content + "<br>신고 내용이 부적절하여 신고 반려 처리 되었습니다.");
			var str = $("#txtReportContent").val();
			str = str.split("<br>").join("\r\n");
			$("#txtReportContent").val(str);
		});
		
		$("#btnModalSend").click(function () {
			var content = $("#txtReportContent").val();
			var receiver_m_id = $("#thReporter").text();
			var sender_admin_code = "${admin_code}";
			var blacklist_seq = $("#btnModalSend").attr("data-blacklistseq");
			$("#frmData").find("input[name=content]").val(content);
			$("#frmData").find("input[name=receiver_m_id]").val(receiver_m_id);
			$("#frmData").find("input[name=sender_admin_code]").val(sender_admin_code);
			$("#frmData").find("input[name=blacklist_seq]").val(blacklist_seq);
			$("#frmData").submit();
			
			
		});
		
		$("#btnSearch").click(function () {
			var searchTypeValue = $("#searchTypeSelector").val();
			var keywordValue = $("#adminKeyword").val();
			
			var searchType = frmPaging.find("input[name=searchType]");
			searchType.val(searchTypeValue);
			var keyword = frmPaging.find("input[name=keyword]");
			keyword.val(keywordValue);
// 			frmPaging.find("input[name=page]").val(1);
			frmPaging.attr("action","/admin/report_management");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$(".blackPointImg").click(function () {
			var blackPoint = $(this).attr("data-blackpoint");
			if (blackPoint == 5) {
				$("#spanBlackPoint").text(blackPoint).css("color","#2A0A0A");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else if (blackPoint == 4) {
				$("#spanBlackPoint").text(blackPoint).css("color","red");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else if (blackPoint == 3) {
				$("#spanBlackPoint").text(blackPoint).css("color","#D7DF01");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else if (blackPoint == 2) {
				$("#spanBlackPoint").text(blackPoint).css("color","green");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			} else {
				$("#spanBlackPoint").text(blackPoint).css("color","blue");
				$("#spanBlackPoint").attr("data-blackpoint",blackPoint);
			}
		});
		
	});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmApproveNotify.jsp" %>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<form id=frmData method=post action="/message/notifyReject">
	<input type="hidden" name="content">
	<input type="hidden" name="receiver_m_id">
	<input type="hidden" name="sender_admin_code">
	<input type="hidden" name="blacklist_seq">
</form>
<!-- modal start -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-97340" href="#modal-container-97340" role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-97340" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								신고 반려 알림 메세지
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<textarea id="txtReportContent" class="form-control" style="height: 100px"></textarea>
							<table style="margin-top: 20px; float: right;">
								<thead>
								<tr>
									<th>받는 사람(신고자)</th>
									<th id="thReporter" style="padding-left:10px"></th>
								</tr>
								</thead>
							</table>
						
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnModalSend" data-dismiss="modal">
								전송
							</button> 
							<button type="button" class="btn btn-secondary" id="btnCancel" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
<!-- modal end -->
<!-- start inner header -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-header start -->
				<div class="page-header card">
					<div class="row align-items-end">
						<div class="col-lg-8">
							<div class="page-header-title">
								<i class="icofont icofont-warning bg-c-pink"></i>
								<div class="d-inline">
									<h4>신고 회원 테이블</h4>
									<span></span>
								</div>
							</div>
						</div>
					<div class="col-lg-4">
						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item">
								<a href="/admin/home"><i class="icofont icofont-home"></i></a>
								</li>
								<li class="breadcrumb-item"><a href="#!">신고 회원 관리</a></li>
								<li class="breadcrumb-item"><a href="#!">신고 회원 테이블</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Page-header end -->
			
			<!-- Page-body start -->
			<div class="page-body">
				<!-- Basic table card start -->
				<div class="card">
					<div class="card-header">
						<i class="icofont icofont-sand-clock"></i>
						<h5>날짜 별 신고 현황</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive"> 
						<div class="row">
						<div class="col-md-12 col-xl-3" style="margin-left:20px">
							<!-- chart Start -->
							<canvas id="canvas" height="300"></canvas>
							<script>
							new Chart(document.getElementById("canvas"), {
							    type: 'bar',
							    data: {
							        labels: [''],
							        datasets: [{
							            label: '완료',
							            data: [
							                "${totalNotifyCount - (nNotifyCount + cNotifyCount)}"
							            ],
							            backgroundColor: [
							            	"rgba(54, 162, 235, 0.2)",
							            	],
							            borderColor: [
							            	"rgba(54, 162, 235, 1)",
							            	],
							            fill: true,
							        }, {
							        	label: '미완료',
							            data: [
							                "${nNotifyCount}"
							            ],
							            backgroundColor: [
							            	"rgba(255, 205, 86, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(255, 205, 86, 1)"
							            	]
							        }, {
							        	label: '10일 경과',
							            data: [
							            	"${dayNotifyCount}"
							            ],
							            backgroundColor: [
							            	"rgba(255, 99, 132, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(255, 99, 132, 1)"
							            	]
							        }, {
							        	label: '신고 반려',
							            data: [
							            	"${cNotifyCount}"
							            ],
							            backgroundColor: [
							            	"rgba(201, 203, 207, 0.2)"
							            	],
							            borderColor: [
							            	"rgba(201, 203, 207, 1)"
							            	]
							        }]
							    },
							    options: {
							        responsive: true,
							        title: {
							            display: true,
							            text: 
							            	'신고 리스트 관리 현황'
							        },
							        tooltips: {
							            mode: 'index',
							            intersect: false,
							            callbacks: {
							                title: function(tooltipItems, data) {
							                    return data.labels[tooltipItems[0].datasetIndex];
							                }
							            }
							        },
							        hover: {
							            mode: 'nearest',
							            intersect: true
							        },
							        scales: {
							            xAxes: [{
							                display: true,
							                scaleLabel: {
							                    display: true,
							                    labelString: '총 신고 리스트 갯수 : ${totalNotifyCount}건' 
							                },
							                ticks: {
							                    autoSkip: false
							                }
							            }],
							            yAxes: [{
							                display: true,
							                ticks: {
							                    suggestedMin: 0,
							                },
							                scaleLabel: {
							                    display: false,
							                    labelString: 'y축'
							                }
							            }]
							        }
							    }
							});
							</script>
							<!-- chart Ends -->
						</div>
						<div class="col-md-12 col-xl-8" style="margin-top:10px">
						<!-- search start -->
						<h6>
							<select id="searchTypeSelector" name="searchTypeSelector" style="height:25px">
		<!-- notifying id -->	<option value="ni" 
									<c:if test="${pagingDto.searchType == 'ni'}">
										selected
									</c:if>
								>신고자 아이디</option>
		<!-- notifyed id -->	<option value="ndi"
									<c:if test="${pagingDto.searchType == 'ndi'}">
										selected
									</c:if>
								>신고 받은 회원 아이디</option>
								<option value="c"
									<c:if test="${pagingDto.searchType == 'c'}">
										selected
									</c:if>
								>신고 내용</option>
							</select>
						
							<input type="text" id="adminKeyword" name="adminKeyword" style="height:25px">
							<button id="btnSearch" style="background-color:white; border-color: #d2d2d2">검색&nbsp;&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						


						<!-- dropdown start -->
						<button class="btn dropdown-toggle" type="button"
							style="background-color: white; padding-top: 20px; color: red; margin-left:400px"
							id="dropdownMenuButton1" data-toggle="dropdown">
							벌점</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/anger.jpg" height="80px" data-blackpoint="5"><b style="color:#2A0A0A; float:right;">5점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/littleanger.jpg" height="80px" data-blackpoint="4"><b style="color:red; float:right;">4점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/disgust.jpg" height="80px" data-blackpoint="3"><b style="color:#D7DF01; float:right;">3점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/fear.jpg" height="80px" data-blackpoint="2"><b style="color:green; float:right;">2점</b>
								<img class="dropdown-item blackPointImg" src="/resources/images/blacklist/sadness.jpg" height="80px" data-blackpoint="1"><b style="color:blue; float:right;">1점</b>
							</div>
							<div>
								<b style="margin-left:820px"><span>벌점 : </span><span id="spanBlackPoint" style="color:black" data-blackpoint="5">5</span><span>점</span></b>
							</div>
						<!-- dropdown end -->
						</h6>
						
						<!-- search end -->
						<!-- Basic table card start -->
<!-- 					<div class="card"> -->
<!-- 					<div class="card-block table-border-style"> -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr style="background-color:rgba(255, 205, 86, 0.2)">
										<th>#</th>
										<th>신고자 아이디</th>
										<th>신고 받은 회원 아이디</th>
										<th>신고 내용</th>
										<th>처리 결과</th>
										<th>등록 일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="blackListVo" items="${nNotifyList}" varStatus="status"> 
								<tr>	 
										<th scope="row">${status.count}</th>
										<td>${blackListVo.m_id}</td>
										<td>${blackListVo.black_m_id}</td>
										<td>${blackListVo.black_content}</td>
										<td>
											<!-- dropdown start -->
											<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:red"
												id="dropdownMenuButton1" data-toggle="dropdown">
												${blackListVo.black_is_processed}</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item check" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="Y" data-blackid="${blackListVo.black_m_id}">승인</a> 
												<a class="dropdown-item check" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="C">반려</a>
											</div> 
											<!-- dropdown end -->
										</td>
										<td>${blackListVo.black_regdate}</td>
										
							</tr>
 									</c:forEach> 
								</tbody>
							</table>
						</div>
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- start pagination -->

				<!-- end pagination  -->
				<!-- Basic table card end -->
						</div>
						</div>
				<!-- 10일 경과 table start -->
						<div class="row" style="padding-top:35px">
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 140px">
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr style="background-color:rgba(255, 99, 132, 0.2)">
											<th>#</th>
											<th style="width:10%">신고자 아이디</th>
											<th style="width:10%">신고 받은 회원 아이디</th>
											<th style="width:55%">신고 내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:15%">등록 일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="blackListVo" items="${dayNotifyList}" varStatus="status"> 
									<tr>	 
											<th scope="row">${status.count}</th>
											<td>${blackListVo.m_id}</td>
											<td>${blackListVo.black_m_id}</td>
											<td>${blackListVo.black_content}</td>
											<td>
											<!-- dropdown start -->
											<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:red"
												id="dropdownMenuButton2" data-toggle="dropdown">
												${blackListVo.black_is_processed}</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item check" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="Y" data-bScore="${blackListVo.black_score}">승인</a> 
												<a class="dropdown-item check" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="C">반려</a> 
											</div> 
											<!-- dropdown end -->
											</td>
											<td><span style="color:red">${blackListVo.black_regdate}</span></td>
											
								</tr>
	 									</c:forEach> 
									</tbody>
								</table>
							</div>
							</div>
						</div>
				<!-- 10일 경과 table end -->
				<!-- 반려 table start -->
						<div class="row" style="padding-top:35px">
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 140px">
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr style="background-color:rgba(201, 203, 207, 0.2)">
											<th>#</th>
											<th style="width:10%">신고자 아이디</th>
											<th style="width:10%">신고 받은 회원 아이디</th>
											<th style="width:55%">신고 내용</th>
											<th style="width:10%">처리 결과</th>
											<th style="width:15%">등록 일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="blackListVo" items="${cNotifyList}" varStatus="status"> 
									<tr>	 
											<th scope="row">${status.count}</th>
											<td>${blackListVo.m_id}</td>
											<td>${blackListVo.black_m_id}</td>
											<td>${blackListVo.black_content}</td>
											<td>
											<c:choose>
												<c:when test="${blackListVo.black_is_processed == 'C'}">
												<!-- dropdown start -->
												<button class="btn dropdown-toggle" type="button" style="background-color:white; padding-top:0px; color:rgba(201, 203, 207,10)"
													id="dropdownMenuButton3" data-toggle="dropdown">
													${blackListVo.black_is_processed}</button>
												<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item check" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" data-value="N">반려 취소</a> 
													<a class="dropdown-item c-complete" href="#" data-blacklistSeq="${blackListVo.blacklist_seq}" 
													data-notifying="${blackListVo.m_id}" data-content="${blackListVo.black_content}">반려 완료</a> 
												</div> 
												<!-- dropdown end -->
												</c:when>
												<c:otherwise>
													<img src="/resources/images/blacklist/reject.png" height="50px">
												</c:otherwise>
											</c:choose>
											</td>
											<td>${blackListVo.black_regdate}</td>
											
								</tr>
	 									</c:forEach> 
									</tbody>
								</table>
							</div>
							</div>
						</div>
				<!-- 반려 table end -->
						</div>
					</div>
				</div>
				<!-- Basic table card end -->
			</div>
		</div>
	</div>
</div>
<!-- end inner header -->
