<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/my/my_header.jsp"%>
<style>
/* tab css start */
nav > .nav.nav-tabs{

  border: none;
    color:#fff;
    background:#aa80ff;
    border-radius:0;

}
nav > div a.nav-item.nav-link,
nav > div a.nav-item.nav-link.active
{
  border: none;
    padding: 18px 25px;
    color:#fff;
    background:#aa80ff;
    border-radius:0;
}

nav > div a.nav-item.nav-link.active:after
 {
  content: "";
  position: relative;
  bottom: -60px;
  left: -10%;
  border: 15px solid transparent;
  border-top-color: #aa80ff ;
}

nav > div a.nav-item.nav-link:hover,
nav > div a.nav-item.nav-link:focus
{
  border: none;
    background: #5c5c8a;
    color:#fff;
    border-radius:0;
    transition:background 0.20s linear;
}
/* tab css end */
</style>
<script>
$(document).ready(function() {
	var frmPaging = $("#frmPaging");
	
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href")
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/my/pointHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("#perPage").change(function() {
		var perPage = $(this).val();
		
// 		console.log(perpage);
		frmPaging.find("input[name=perPage]").val(perPage);
		frmPaging.attr("action", "/my/pointHistory");
		frmPaging.attr("method", "get");
		frmPaging.submit();
		
	});
	
	
});
</script>

<%@ include file="/WEB-INF/views/include/frmPaging.jsp" %>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<nav style="margin: 20px;">
          <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
            <a class="nav-item nav-link" id="nav-home-tab" href="/my/boardedHistory" aria-controls="nav-home" aria-selected="false">탑승 내역</a>
            <a class="nav-item nav-link" id="nav-profile-tab" href="/my/driveHistory" aria-controls="nav-profile" aria-selected="false">운전 내역</a>
            <a class="nav-item nav-link active" id="nav-contact-tab" href="/my/pointHistory" aria-controls="nav-contact" aria-selected="true">포인트 내역</a>
          </div>
        </nav>
		<!-- table start -->
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th style="text-align: right;" colspan="4">
						현재 포인트 : ${loginVo.m_point}
						<select name="perPage" id="perPage">
							<c:forEach var="v" begin="5" end="15" step="5">
								<option value="${v}"
									<c:if test="${v == pagingDto.perPage}">
										selected
									</c:if>
								>최근 ${v}개 보기</option>
							</c:forEach>
							<option value="20"
							<c:if test="${20 == pagingDto.perPage}">
								selected
							</c:if>
							>전체보기</option>
						</select>
					</th>
				</tr>
				<tr>
					<th>#</th>
					<th style="width: 600px;">내용</th>
					<th>포인트</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pointVo" items="${pointList}" >
				<tr>
					<td>${pointVo.P_SEQ}</td>
					<td>${pointVo.PC_DESC}</td>
					<td><c:choose>
					<c:when test="${pointVo.PC_DESC.contains('동승자 등업')}">
					${benefitPoint }포인트
					</c:when>
					<c:when test="${pointVo.PC_DESC.contains('운전자 감사')}">
					${driverBenefitPoint }포인트
					</c:when>
					<c:otherwise>
					${pointVo.PC_POINT}
					</c:otherwise>
					</c:choose></td>
					<td>${pointVo.P_DATE}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- table end -->
		
		<!-- paging 처리 start -->
		<nav
			<c:if test="${pagingDto.perPage != 20}">
				style="display:none;"
			</c:if>
		>
			<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					<li class="page-item"
						<c:choose>
							<c:when test="${v == param.page}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>
					>
						<a class="page-link" href="${v}">${v}</a>
					</li>
				</c:forEach>
				<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<!-- paging 처리 end -->
		
	</div>
	<div class="col-md-2">
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>