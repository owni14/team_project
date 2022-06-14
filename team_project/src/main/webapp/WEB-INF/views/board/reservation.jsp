<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(document).ready(function() {
	var count = 1;
	var m_id = "${loginVo.m_id}";
	
	// 회원이 탑승신청한 운전자 아이디
	var driverId = "${driverId}";
	
	// 운전자목록을 얻어낼 url
	var url_list = "/board/driverList";
	
	// 회원 주소를 얻어낼 url
	var url_member = "/board/member?m_id=" + m_id;
	
	var mapContainer = document.getElementById('map') // 지도를 표시할 div
	
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 비동기로 데이터 가져오기
	$.get(url_list, function(rData) {
		$.each(rData, function() {
			var that = this;
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(this.DRIVER_DEPART_LOCATION, function(result, status) {
			
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
		            content: "<div style='width:150px;text-align:center;padding:2px 0;'>" + that.M_NAME + "</div>"
		        });
		        infowindow.open(map, marker);
	
		    } // if (status === kakao.maps.services.Status.OK)
		    	
		}); // geocoder.addressSearch(this.m_address, function(result, status){})
				
		// 차량 최대 탑승인원 및 현재 차량 탑승인원 얻어낼 url
		var m_id = this.M_ID;
		var url_count = "/board/count?m_id=" + m_id;
		$.get(url_count, function(rData_count) {
			var maxCount = rData_count.maxCount;
			var currentCount = rData_count.currentCount;
			var tr = $("#tblDriverClone  tr").clone();
			var tds = tr.find("td");
			tds.eq(0).text(count++);
			tds.eq(0).attr("data-driver_seq", this.DRIVER_SEQ);
			tds.eq(1).text(that.M_NAME);
			tds.eq(2).text(that.DRIVER_DEPART_LOCATION);
			tds.eq(3).text(that.DRIVER_DEPART_TIME);
			tds.eq(4).text(currentCount + " / " + maxCount);
			
			// 회원이 탑승신청한 운전자와 반복문을 돌면서 가져올 운전자와 같으면 승인 대기상태로 신청상태를 변경
			if (driverId == that.M_ID) {
				tds.eq(5).text("승인 대기");
			}
			
			tds.find(".btnBoard").attr("data-m_id", that.M_ID);
			$("#tblDriver tbody").append(tr);
		});
			
		}); // $.each(rData, function() {})
		
	}); // $.get(url, function(rData) {})
	
	// 비동기로 회원의 주소 가져오기
	$.get(url_member, function(rData) {
		$("#boardLoct").val(rData);
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(rData, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		     	// 마커 이미지의 이미지 주소입니다
		        var imageSrc = "/resources/images/maker/home.png"; 
		     	
		     	// 마커 이미지의 이미지 크기 입니다
		        var imageSize = new kakao.maps.Size(35, 35); 
		        
		        // 마커 이미지를 생성합니다    
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var myMarker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var rvbmInfowindow = new kakao.maps.InfoWindow({
		            content: "<div style='width:150px;text-align:center;padding:2px 0;'>내 위치</div>"
		        });
		        rvbmInfowindow.open(map, myMarker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
		    } // if (status === kakao.maps.services.Status.OK)
		    	
		    clickMap(map, rvbmInfowindow, myMarker);
		    
		}); // geocoder.addressSearch(this.m_address, function(result, status){})
	}); // $.get(url_member, function(rData) {})
	
	// 지도 클릭시 클릭할때 마다 인포윈도우 위치 변경할 함수
	function searchDetailAddrFromCoords(coords, callback) {
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }
	
	// 지도 클릭 시 실행하는 함수
	function clickMap(map, rvbmInfowindow, myMarker) {
		// 지도 클릭 시 발생하는 이벤트
	    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    	
	    	// 기존에 클릭되어 있던 인포윈도우 삭제
	    	rvbmInfowindow.close();
	    	
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    myMarker.setPosition(latlng);
		    
		 	// 인포윈도우로 장소에 대한 설명을 표시합니다
	        var currentInfowindow = new kakao.maps.InfoWindow({
	            content: "<div style='width:150px;text-align:center;padding:2px 0;'>내 위치</div>"
	        });
	        rvbmInfowindow = currentInfowindow;
	        currentInfowindow.open(map, myMarker);
	        
	        // 지도에 클릭할때 마다 탑승위치 텍스트가 변경
	        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	            	$("#boardLoct").val(result[0].road_address.address_name);
	            }   
	        }); // searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {})
	        
		});	// kakao.maps.event.addListener(map, 'click', function(mouseEvent) {})
		
	} // function clickMap(map, rvbmInfowindow, myMarker) {} )
	
	// 모달창에서 지도를 보여줄 함수
	function showModalMap(drvName, gender, drvDepartLocation, drvDept, drvDepartTime, mBoardLoct, driver_comment) {
		 
		 /* 
		 console.log("driverName:" + driverName);
		 console.log("driverAddr:" + driverAddr);
		 console.log("driverDept:" + driverDept);
		  */
		  
		  $("#driverName").text(drvName);
		  $("#gender").text(gender);
		  $("#driverDept").text(drvDept);
		  $("#driverLoct").text(drvDepartLocation);
		  $("#driverStartTime").text(drvDepartTime);
		  $("#mBoardLoct").text(mBoardLoct);
		  var defaultComment = "없음";
		  if (driver_comment == null) {
			  $("#driverComment").text(defaultComment);
		  } else {
			  $("#driverComment").text(driver_comment);
		  }
		 
		  
		  var modalMapContainer = document.getElementById('mapInModal') // 지도를 표시할 div
			 modalMapOption = {
				    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};  
			// 지도를 생성합니다    
			var modalMap = new kakao.maps.Map(modalMapContainer, modalMapOption);
			
			// 주소-좌표 변환 객체를 생성합니다
			var modalGeocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			modalGeocoder.addressSearch(drvDepartLocation, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var modalCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var modalMarker = new kakao.maps.Marker({
			        	map: modalMap,
			            position: modalCoords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var modalInfowindow = new kakao.maps.InfoWindow({
			            content: "<div style='width:150px; text-align:center;'>" + drvName + "</div>"
			        });
			        
			        modalInfowindow.open(modalMap, modalMarker);
			        modalMap.setDraggable(false);
			        modalMap.setZoomable(false);
			        setTimeout(function(){ modalMap.relayout();  modalMap.setCenter(modalCoords), modalMap.setLevel(4);}, 100);
			        
			    } // if (status === kakao.maps.services.Status.OK)
			    	
			}); // modalGeocoder.addressSearch(driverAddr, function(result, status) {})
			
	 } // function showModalMap(driverName, driverAddr, driverDept) {})
	 
	 // 탑승 신청버튼 클릭
	 $("#tblDriver").on("click", ".btnBoard", function() {
		 
		 // 보낼 url 설정
		 var url = "/board/driverInfo";
		 var driver_seq = $(this).parent().parent().find(".classTd").attr("data-driver_seq");
		 var stateText = $(this).parent().parent().find(".boardingState").text();
		 if (stateText == "승인 대기") {
			 $("#btnApply").hide();
			 $("#btnCancel").hide();
		 }
		 
		 $("#driver_seq").val(driver_seq);
		 
		 // 버튼 클릭시 행에 있는 멤버 아이디 및 로그인된 회원의 회사 정보
		 var m_id = $(this).attr("data-m_id");
		 var m_company = "${loginVo.m_company}";
		 $("#driver_id").val(m_id);
		 
		 var sData = {
				 "m_id" : m_id,
				 "m_company" : m_company
		 };
		 
		 // 지도에서 클릭한 위치 값
		 var mBoardLoct = $("#boardLoct").val();
		 
		 // 비동기형식으로 데이터 보내고 받아와서 showModalMap함수 실행
		 $.get(url, sData, function(rData) {
			 var gender = rData.GENDER;
			 if (gender = "M") {
				 gender = "남자";
			 } else {
				 gender = "여자";
			 }
			 showModalMap(rData.M_NAME, gender, rData.DRIVER_DEPART_LOCATION, rData.M_DEPT, rData.DRIVER_DEPART_TIME, mBoardLoct, rData.DRIVER_COMMENT);
		 });
		 
	 }); //  $("#tblDriver").on("click", ".btnBoard", function() {})
	 
	 // 모달창에서 버튼 클릭 (작업해야함)
	 $("#btnApply").click(function() {
// 		 $("#frmPassenger").submit();
	 });
	 
}); // $(document).ready(function() {})
</script>
<!-- 카카오 지도 -->
<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="map" style="height: 700px; width: 100%;"></div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- // 카카오 지도 -->

<!-- 모달창 -->
 <a id="modal-899906" style="display: none;">modal</a>
	<div class="modal fade" id="modal-container-899906" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel" style="font-weight: bold;">
						운전자 정보
					</h5>
				</div>
				<div class="modal-body">
					<h6 style="font-weight: bold; "> 이름 : <span id="driverName"></span></h6> 
					<h6 style="font-weight: bold; "> 성별 : <span id="gender"></span></h6>
					<h6 style="font-weight: bold; "> 부서 : <span id="driverDept"></span></h6> 
					<h6 style="font-weight: bold; "> 출발 위치 : <span id="driverLoct"></span></h6> 
					<h6 style="font-weight: bold; "> 출발 시간 : <span id="driverStartTime"></span></h6> 
					<h6 style="font-weight: bold; color: red;"> 요구 사항 : <span id="driverComment"></span></h6> 
					<hr>
					<h6 style="font-weight: bold; "> 내 위치 : <span id="mBoardLoct"></span></h6>
					<div style="font-weight: bold; text-align: center; color: green;"> 운전자 위치 </div> 
					<div id="mapInModal" style="height: 300px; width: 100%;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnApply" class="btn btn-success" >
						신청하기
					</button> 
					<button type="button" id="btnCancel" class="btn btn-danger" data-dismiss="modal">
						취소
					</button>
				</div>
			</div>
		</div>
	</div>
<!-- // 모달창 -->

<!-- 탑승자 -->
<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<form id="frmPassenger" role="form" method="post" action="/board/addPasgInfo">
		<input hidden="true" name="m_id" value="${loginVo.m_id}">
		<input hidden="true" id="driver_seq" name="driver_seq" value="">
		<input hidden="true" id="driver_id" name="driver_id" value="">
			<div class="form-group" style="margin-bottom: 10px;">
				<h3 style="text-align: center">운전자 위치를 확인하시고, 탑승할 위치<span style="color: blue;">(도로명 주소기준)</span>를 클릭해주세요.</h3>
					<label for="startLocation"> 탑승 위치 </label> 
				<input type="text" class="form-control" id="boardLoct" name="boardLoct" readonly="readonly"/>
			</div>
			<div class="form-group" style="margin-bottom: 10px;">
				<label for="boardTime"> 탑승 시간 </label> 
				<select name="boardHour">
					<option value="06:">06
					<option value="07:">07
					<option value="08:">08
				</select>
				<select name="boardMin">
					<option value="00">00
					<option value="10">10
					<option value="20">20
					<option value="30">30
					<option value="40">40
					<option value="50">50
				</select>
			</div>
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
			<table id="tblDriverClone" class="table" style="display: none;">
				<tr>
					<td class="classTd"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="boardingState" style="color: red; font-weight: bold;">미신청</td>
					<td class="tds"><a href="#modal-container-899906" role="button" class="btn btn-info btn-sm btnBoard" data-toggle="modal">탑승신청</a></td>
				</tr>
			</table>
			<table class="table" id="tblDriver" class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>운전자</th>
						<th>출발위치</th>
						<th>출발시간</th>
						<th>탑승인원</th>
						<th>신청상태</th>
						<th>탑승신청</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>> 페이지 작업 해야함 (하나도 안되어 있음) <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" href="#">Previous</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">4</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">5</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>