<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<style>
	tbody > tr:hover {background-color: aliceblue;}
</style>
<script>
	$(document).ready(function () {
		var frmPaging = $("#frmPaging"); 
		$("#perPageSelector").change(function () {
			var perPageValue = $(this).val();
			var perPage = frmPaging.find("input[name=perPage]");
			perPage.val(perPageValue);
			frmPaging.attr("action","/admin/member_management");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$("a.page-link").click(function (e) {
			e.preventDefault();
			var pageValue = $(this).attr("href");
			var page = frmPaging.find("input[name=page]");
			page.val(pageValue);
			frmPaging.attr("action","/admin/member_management");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$("#btnSearch").click(function () {
			var searchTypeValue = $("#searchTypeSelector").val();
			var keywordValue = $("#adminKeyword").val();
			
			var searchType = frmPaging.find("input[name=searchType]");
			searchType.val(searchTypeValue);
			var keyword = frmPaging.find("input[name=keyword]");
			keyword.val(keywordValue);
			frmPaging.find("input[name=page]").val(1);
			frmPaging.attr("action","/admin/member_management");
			frmPaging.attr("method","get");
			frmPaging.submit();
		});
		
		$.get("/admin/getMemberUpdateList",function (rData) {
			console.log(rData);
			$.each(rData, function () {
				var tr = $("#table_clone tr").clone();
				var tds = tr.find("td");
				tds.eq(0).text(this.m_id);
				tds.eq(1).text(this.update_reason);
				tds.eq(2).text(this.admin_code);
				tds.eq(3).text(this.update_date);
				$("#table_memberUpdate_list tbody").append(tr);
			});
		}); 
		
		var trs = $("#memberTable tbody").find("tr");
		$(trs).click(function () {
			$("#modal-113407").trigger("click");
			var m_id = $(this).attr("data-mid");
			var m_address = $(this).attr("data-mAddress");
			var m_cellphone = $(this).attr("data-mCellphone");
			var m_is_drop = $(this).attr("data-mIsDrop");
			$("#tdMid").text(m_id);
			$("#inputAddress").val(m_address);
			$("#inputCellphone").val(m_cellphone);
			$("#inputMisDrop").val(m_is_drop);
			
		});
		
		$("#btnModifyMember").click(function () {
			var m_id = $("#tdMid").text();
			var m_address = $("#inputAddress").val();
			var m_cellphone = $("#inputCellphone").val();
			var m_is_drop = $("#inputMisDrop").val();
			var update_reason = $("#inputReason").val();
			var admin_code = "${sessionScope.admin_code}";
// 			console.log(m_id);
// 			console.log(m_address);
// 			console.log(m_cellphone);
// 			console.log(m_is_drop);
// 			console.log(update_reason);
// 			console.log(admin_code);
			var url = "/admin/memberInfoUpdate";
			var sData = {
				"m_id" : m_id,
				"m_address" : m_address,
				"m_cellphone" : m_cellphone,
				"m_is_drop" : m_is_drop,
				"update_reason" : update_reason,
				"admin_code" : admin_code
			};
			$.post(url, sData, function (rData) {
				console.log(rData);
				if (rData == "true") {
					frmPaging.attr("action","/admin/member_management");
					frmPaging.attr("method","get");
					frmPaging.submit();
				}
			});
		});
		
	});
</script>
<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<!-- modal start -->
<div class="row" >
	<div class="col-md-12">
		<a id="modal-113407" href="#modal-container-113407" role="button"
			class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>

		<div class="modal fade" id="modal-container-113407" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">회원 정보 수정</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<table style="width:100%">
							<tr>
								<td colspan="2" align="center">
								<img height="200px" alt="user_folder_icon" src="/resources/images/memberimage/user_icon.jpg">
								</td>	
							</tr>
							<tr>
								<td colspan="2" align="center" id="tdMid"></td>
							</tr>
						</table>
						<!-- multiple open accordion start -->

							<div class="card-block accordion-block" style="margin-top:10px">
								<div id="accordion" role="tablist" aria-multiselectable="true">
									<div class="accordion-panel">
										<div class="accordion-heading" role="tab" id="headingOne">
											<h3 class="card-title accordion-title">
												<a class="accordion-msg" data-toggle="collapse"
													data-parent="#accordion" href="#collapseOne"
													aria-expanded="true" aria-controls="collapseOne">회원 주소</a>
											</h3>
										</div>
										<div id="collapseOne" class="panel-collapse collapse in"
											role="tabpanel" aria-labelledby="headingOne">
											<div class="accordion-content accordion-desc">
											<input type="text" class="form-control" id="inputAddress"/>
										</div>
										</div>
									</div>
									<div class="accordion-panel">
										<div class="accordion-heading" role="tab" id="headingTwo">
											<h3 class="card-title accordion-title">
												<a class="accordion-msg" data-toggle="collapse"
													data-parent="#accordion" href="#collapseTwo"
													aria-expanded="false" aria-controls="collapseTwo">휴대폰 번호</a>
											</h3>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingTwo">
											<div class="accordion-content accordion-desc">
												<input type="text" class="form-control" id="inputCellphone"/>
											</div>
										</div>
									</div>
									<div class="accordion-panel">
										<div class=" accordion-heading" role="tab" id="headingThree">
											<h3 class="card-title accordion-title">
												<a class="accordion-msg" data-toggle="collapse"
													data-parent="#accordion" href="#collapseThree"
													aria-expanded="false" aria-controls="collapseThree">회원 탈퇴 여부</a>
											</h3>
										</div>
										<div id="collapseThree" class="panel-collapse collapse show"
											role="tabpanel" aria-labelledby="headingThree">
											<div class="accordion-content accordion-desc">
												<input type="text" class="form-control" id="inputMisDrop"/>
											</div>
										</div>
									</div>
									<div class="accordion-panel">
										<div class="accordion-heading" role="tab" id="headingFour">
											<h3 class="card-title accordion-title">
												<a class="accordion-msg" data-toggle="collapse"
													data-parent="#accordion" href="#collapseFour"
													aria-expanded="false" aria-controls="collapseFour">수정 사유</a>
											</h3>
										</div>
										<div id="collapseFour" class="panel-collapse collapse in"
											role="tabpanel" aria-labelledby="headingFour">
											<div class="accordion-content accordion-desc">
											<input type="text" class="form-control" id="inputReason" 
											placeholder="수정 사유를 작성해 주세요"/>
										</div>
										</div>
									</div>
								</div>
							</div>
						
						<!-- multiple open accordion end -->
					</div>
					<div class="modal-footer">

						<button id="btnModifyMember" type="button" class="btn btn-primary">수정 완료</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
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
								<i class="icofont icofont-address-book bg-c-blue"></i>
								<div class="d-inline">
									<h4>회원 관리</h4>
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
								<li class="breadcrumb-item"><a href="#!">회원 관리</a></li>
								<li class="breadcrumb-item"><a href="#!">회원 정보 수정 테이블</a></li>
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
						<i class="icofont icofont-pencil-alt-2"></i>
						<h5>회원 정보 수정 내역</h5>

					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table style="display:none" id="table_clone">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</table>
							<table class="table" id="table_memberUpdate_list">
								<thead>
									<tr>
										<th style="width:20%">회원 아이디</th>
										<th style="width:20%">수정 사유</th>
										<th style="width:20%">승인 관리자 코드</th>
										<th style="width:20%">수정 일자</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- Basic table card end -->
				
			</div>
			<!-- Page-body end -->
		</div>
	</div>
</div>
<!-- end inner header -->
				
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>