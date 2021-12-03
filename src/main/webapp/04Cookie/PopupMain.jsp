<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//레이어 팝업창의 오픈여부에 대한 변수
String popupMode = "on"; //on인 경우 팝업창 오픈

//웹브라우저에서 생성된 쿠키 전체를 배열로 얻어옴
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		//쿠키명이 PopupClose 일때 쿠키값을 변수에 저장
		if(cookieName.equals("PopupClose")){
			popupMode = cookieValue;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
	/*위에 띄우기 위한 스타일 속성*/
	div#popup{
		position: absolute; top:100px; left:100px; color:yellow;
		width:300px; height:100px; background-color:gray;
	}
	div#popup>div{
		position: relative; background-color: #ffffff; top:0px;
		border: 1px solid gray; padding: 10px; color:black;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
	//닫기 버튼을 누르면...
	$('#closeBtn').click(function(){
		//레이어 팝업창을 숨김처리한다.
		$('#popup').hide();
		//하루동안 열지 않음 체크박스에 체크된 경우 value를 얻어옴
		var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
		$.ajax({
			url : './PopupCookie.jsp', //요청URL
			type : 'get', //전송방식
			data : {inactiveToday : chkVal}, //파라미터(매개변수)
			dataType : "text", //콜백데이터의 형식
			success : function(resData){ //성공했을때의 콜백메서드
				//콜백데이터는 매개변수 resData가 받는다.
				if(resData){
					console.log('있다');
				}
				else{
					console.log('없다');
				}
				//콜백 데이터가 있다면 화면을 새로고침한다.
				//쿠키는 만들어진 직후에는 사용할 수 없어서 서버로 요청해야지 사용할 수 있기 때문에 여기서 강제적으로 새로고침
				if(resData != '') location.reload();
			}
		});
	});
});
</script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
	for(int i=1; i<=10; i++){
		out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br>");
	}
	//popupMode가 on일때만 레이어 팝업창을 오픈한다.
	if(popupMode.equals("on")){
%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right"><form name="popFrm">
			<input type="checkbox" id="inactiveToday" value="1">
			하루동안 열지 않음
			<input type="button" value="닫기" id="closeBtn">
		</form></div>
	</div>
<%
	}
%>
</body>
</html>
