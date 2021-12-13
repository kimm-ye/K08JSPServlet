<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<script>
	function validateForm(form) {
		if(form.name.value==""){
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if(form.title.value==""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(form.attachedFile.value==""){
			alert("첨부파일은 필수 입력입니다.");
			return false;
		}
	}
</script>
<body>
	<h3>파일 업로드</h3>
	<span style="color:red">${errorMessage }</span>
	
	<!--  
	파일업로드를 위한 <form>태그에는 반드시 2개의 속성이 있어야 한다.
	method="post" (파일첨부할때는 무조건 post를 써야함) /  enctype="multipart/form-data" (파일첨부 속성임)
	또한 이처럼 전송했을때 request 내장객체를 통해 폼값을 받을 수 없다.
	
	get방식으로 하면 텍스트방식으로 전송되기때문에 내용이 전송이 되지는 않는다.
	-->
	<form name="fileForm" method="post" enctype="multipart/form-data" action="UploadProcess.jsp" onsubmit="return validateForm(this)">
	작성자 : <input type="text" name="name" value="머스트해브"> <br>
	제목 : <input type="text" name="title"><br>
	카테고리(선택사항) :
		<input type="checkbox" name="cate" value="사진" checked> 사진
		<input type="checkbox" name="cate" value="과제" > 과제
		<input type="checkbox" name="cate" value="워드" > 워드
		<input type="checkbox" name="cate" value="음원" > 음원 <br>
	첨부파일 : <input type="file" name="attachedFile"> <br>
	<input type="submit" value="전송하기">
	</form>
</body>
</html>