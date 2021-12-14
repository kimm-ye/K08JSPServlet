<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnnoMapping.jsp</title>
</head>
<body>
	<h2>애너테이션으로 매핑하기</h2>
	<p>
		<strong>${ message }</strong>
		<br>
		<!-- 절대경로라 처음부터 다 써야함. 폴더명이 바뀌면 폴더명을 다 수정해야하기 때문에 유지보수가 힘들다. -->
		<!-- 요청명을 링크에 절대경로로 적용함. -->
		<a href="<%= request.getContextPath()%>/13Servlet/AnnoMapping.do">바로가기</a> 
	</p>
</body>
</html>