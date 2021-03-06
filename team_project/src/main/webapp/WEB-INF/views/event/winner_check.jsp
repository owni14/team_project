<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/event/event_header.jsp" %>

<script>
$(document).ready(function() {
	$("#btn_winner_check").click(function() {
		var m_id = "${loginVo.m_id}";
		var event_seq = "${event_seq}";
		var url = "/event/checkWinner";
		var sData = {
				"m_id" : m_id,
				"event_seq" : event_seq
		};
		$.get(url, sData, function(rData) {
			if ("${loginVo}" == "") {
				$("#check_comment").text("로그인이 필요한 서비스 입니다. 로그인을 해주세요.");
			} else if (rData == "true") {
				$("#check_comment").text("당첨되었습니다. 당첨 상품은 쪽지를 통해 확인 해주세요.");
				var url = "/event/winnerMessage"
				$.post(url, sData);
			} else if (rData == "already") {
				$("#check_comment").text("이미 상품을 수령하였습니다.");
			} else {
				$("#check_comment").text("당첨되지 못했습니다. 다음 기회에...");
			}
		});
	});
});
</script>
	
<div class="container-fluid" style="display: inline-block; text-align: center;">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<div class="border rounded" style="height: 80px; margin: 15px;">
				<button class="btn btn-primary" id="btn_winner_check" style="float: left; width: 21%; height: 80px; font-size: 30px;">당첨자 확인</button>
				<span id="check_comment" style="font-size: 25px; vertical-align: middle; line-height: 79px;">이벤트 당첨여부를 확인 해주세요</span>
			</div>
			${content}
		</div>
		<div class="col-md-3">
		</div>
	</div>
	
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>