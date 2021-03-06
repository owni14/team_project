<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include_admin/header.jsp"%>
<%@ include file="/WEB-INF/views/include_admin/alert.jsp" %>
<style>
.trList:hover{
cursor: pointer;
}
.trCollapse:hover{
cursor: pointer;
}
</style>
<script>
	
	
	$(document).ready(function () {
		var frm=$("#frmComplainPaging");
		$(".trList").click(function(){
			$(this).next("tr").toggle();
			$(this).next("tr").siblings(".trCollapse").hide();
// 			var str = $(".tareContent").val();
// 			str = str.replaceAll("<br>", "\r\n");
// 			$(".tareContent").val(str);
		});
		
		$(".trCollapse").click(function(){
			$(this).toggle();
		});	
		
		$("#sel_adminCode").change(function(){
			var admin_code=$(this).val();
			var complain_classification=$("#sel_classify").val();
			
			if(complain_classification == null){
				frm.find("[name=searchType]").val("ac");
			}
			else{
				frm.find("[name=searchType]").val("cls");
			}
			
			frm.find("[name=admin_code]").val(admin_code);
			frm.find("[name=complain_classification]").val(complain_classification);
			frm.submit();
			
		});
		
		$("#sel_classify").change(function(){
			var complain_classification=$(this).val();
			var admin_code=$("#sel_adminCode").val();
			if(admin_code ==null){
				frm.find("[name=searchType]").val("clsnoac");
			}
			else{
				frm.find("[name=searchType]").val("cls");
			}
			frm.find("[name=admin_code]").val(admin_code);
			frm.find("[name=complain_classification]").val(complain_classification);
			frm.submit();
		});
		
		$("#btnSearch").click(function(){
			var admin_code=$("#sel_adminCode").val();
			var complain_classification=$("#sel_classify").val();
			var keyword=$("#txtkeyword").val();
			if(admin_code ==null && complain_classification==null){
				frm.find("[name=searchType]").val("i");
			}
			else if(admin_code !=null && complain_classification ==null ){
				frm.find("[name=searchType]").val("iac");
			}
			else if(admin_code ==null && complain_classification !=null ){
				frm.find("[name=searchType]").val("icls");
			}
			else{
				frm.find("[name=searchType]").val("all");
			}
			frm.find("[name=admin_code]").val(admin_code);
			frm.find("[name=complain_classification]").val(complain_classification);
			frm.find("[name=keyword]").val(keyword);
			frm.submit();
			
		});
		
		
	
	});
</script>
<%@ include file="/WEB-INF/views/include_admin/frmComplainPaging.jsp" %>
<!-- start inner header -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-header start -->
				<div class="page-header card">
					<div class="row align-items-end">
						<div class="col-lg-5">
							<div class="page-header-title">
								<i class="ti-face-smile" style="background-color:#54BD54"></i>
								<div class="d-inline">
									<h4>?????? ?????? ?????? ?????? ?????????</h4>
									<a href="/admin/complainAnswerComplete"><span>????????????</span></a>
								</div>
							</div>
						<c:if test="${admin_code eq '1004' }">
						<select style="height:26px; float: right; align-items: flex-end; margin: 50px 0px 0px" id="sel_adminCode">
			<option selected="selected" value="" disabled="disabled">????????? ????????? ???????????? ?????????</option>
					<c:forEach items="${amdinCodes}" var="adminVo">
					<option value="${adminVo}"
					<c:if test="${adminVo eq param.admin_code}">
					selected
					</c:if>
					>????????? ?????? &nbsp;${adminVo}</option>
					</c:forEach>
					</select>
					</c:if>
						</div>
						<!-- ?????? ????????? div -->
							<div class="col-lg-4" style="text-align: right;">
					
					<select style="height:26px; float:left;" id="sel_classify">
			<option selected="selected" value="" disabled="disabled">=====?????? ??????=====</option>
					
					<option value="?????????????????????"
					<c:if test="${'?????????????????????' eq param.complain_classification}">
					selected
					</c:if>
					>?????????????????????</option>
					<option value="?????????"
					<c:if test="${'?????????' eq param.complain_classification}">
					selected
					</c:if>
					>?????????</option>
					<option value="?????????"
					<c:if test="${'?????????' eq param.complain_classification}">
					selected
					</c:if>
					>?????????</option>
					<option value="??????"
					<c:if test="${'??????' eq param.complain_classification}">
					selected
					</c:if>
					>??????</option>
					<option value="??????"
					<c:if test="${'??????' eq param.complain_classification}">
					selected
					</c:if>
					>??????</option>
					
					</select>
					&nbsp;
					<input type="text" id="txtkeyword" style="background-color:white; border-color: #d2d2d2; " placeholder="?????????????????? ???????????????">
					<button type="button" id="btnSearch" style="background-color:white; border-color: #d2d2d2;">??????&nbsp;<i class="icofont icofont-search-alt-2"></i></button>
						</div>
					<div class="col-lg-3">
						<div class="page-header-breadcrumb">
							<ul class="breadcrumb-title">
								<li class="breadcrumb-item">
								<a href="/admin/home"><i class="icofont icofont-home"></i></a>
								</li>
								<li class="breadcrumb-item">???????????? ?????? ??????</li>
								
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
						<i class="icofont  icofont-listing-number"></i>
						<h5>?????? ?????? ?????????</h5>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive"> 
						<div class="row">
						
							<!-- ?????? ?????? Y table start -->
						
							<div class="col-md-12 col-xl-12" style="margin-left: 20px; padding-right : 40px">
								<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr style="background-color:rgba(54, 162, 235, 0.2)">
											<th>#</th>
											<th style="width:10%">
											??????
											
											</th>
											<th style="width:10%">????????? ??????(?????????)</th>
											<th style="width:10%">??????ID</th>
											<th style="width:50%">????????????</th>
											<th style="width:10%">?????? ??????</th>
											<th style="width:5%">?????? ??????</th>
											<th style="width:5%">?????? ??????</th>
											
										</tr>
									</thead>
									<tbody>
							
									<c:forEach items="${complainList}" var="complainVo" varStatus="i">	 
									
									<tr class="trList" style="font-size:15px">
									
											<th scope="row" data-seq="${complainVo.complain_seq}">${i.count}</th>
											<th scope="row" data-classification="${complainVo.complain_classification}">${complainVo.complain_classification}	
											</th>
											<td data-admin_code="${complainVo.admin_code }">${complainVo.admin_code }</td>
											<td data-mid="${complainVo.m_id}">${complainVo.m_id }</td>
											
											
											
											<td class="tdContent" data-content="${complainVo.complain_content}">
											<c:choose>
											<c:when test="${complainVo.complain_content.length() >20 }">
											${complainVo.complain_content.substring(0,20)}...</c:when>
											<c:otherwise>${complainVo.complain_content }</c:otherwise>
											 
											</c:choose> 
											</td>
											
											
											<td style="font-size: 40px;color: red"><i class="icofont icofont-check"></i></td>
											<td>${complainVo.complain_regdate}</td>
											<td><button class="btn btn-info">
											?????? ?????? ??????
											</button></td>
											
										
								</tr>
								<tr class="trCollapse" style="display:none" data-display="N">
								<td colspan="8">
											<div>
											  <div class="Answer">
											  <h5></h5>
											  <br><br>
											  <h4 style="text-align: center;">??????(${complainVo.m_id})?????? ?????? ?????? &nbsp;&nbsp; ?????????&nbsp;:&nbsp;${complainVo.complain_answer_date}</h4>
											  <p>${complainVo.complain_answer }</p>
									   <br>
											  
											   <br>
											   <button class="btn btn-info btnAnswer" type="button">??????</button>
											  </div>
												</div>
								</td>
								</tr>
	 							</c:forEach>		
									</tbody>
								</table>
							
							
							</div>
							</div>
						
				
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				<!-- Basic table card end -->
						
						
					</div>
					
				
				
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
<!-- end inner header -->

 
<%@ include file="/WEB-INF/views/include_admin/footer.jsp"%>