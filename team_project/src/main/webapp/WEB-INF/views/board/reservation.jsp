<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function() {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 비동기로 데이터 가져오기
	var url = "/board/reservationList";
	$.get(url, function(rData) {
		$.each(rData, function() {
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(this.m_address, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:2px 0;">' + this.m_name + '</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		});
	});
	
	/* 카카오 Api 예시 : 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발 위치</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	 */
});
</script>
<!-- 카카오 지도 api -->
<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="map" style="height: 700px; width: 1400px;"></div>
		
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 카카오 지도 api -->

<!-- 탑승자 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form role="form">
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startLocation"> 탑승 위치 </label> 
				<input type="text" class="form-control" id="boardLoct" name="startLocation"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="startTime"> 탑승 시간 </label> 
				<select name="startHour">
					<option value="6">06:00
					<option value="7">07:00
					<option value="8">08:00
				</select>
				<select name="startMin">
					<option value="00">00
					<option value="10">10
					<option value="20">20
					<option value="30">30
					<option value="40">40
					<option value="50">50
				</select>
			</div>
			<button id="btnCheck" type="button" class="btn btn-primary">확인</button>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 탑승자 -->

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>운전자</th>
						<th>부서</th>
						<th>주소</th>
						<th>탑승신청</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${driverList}" var="memberVo" varStatus="status"> 
						<tr>
							<td>${status.count}</td>
							<td>${memberVo.m_name}</td>
							<td>${memberVo.m_dept}</td>
							<td>${memberVo.m_address}</td>
							<td><button class="btn btn-success btn-sm">탑승신청</button></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>