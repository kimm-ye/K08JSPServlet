<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="FileUploadMain.jsp">파일 등록하기</a>
	<%
	//DAO객체 생성
	MyfileDAO dao = new MyfileDAO();
	//목록에 출력할 레코드 가져오기
	List<MyfileDTO> fileLists = dao.myFileList();
	//커넥션풀에 자원 반납
	dao.close();
	%>
	<table border="1">
		<tr>
			<th>No</th>
			<th>이미지</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본파일명</th>
			<th>저장된파일명</th>
			<th>작성일</th>
			<th></th>
		</tr>
	<% for(MyfileDTO f : fileLists) { %>
		<tr>
			<td><%= f.getIdx() %></td>
			<td><img src="../Uploads/<%= f.getSfile() %>" width="150"></td>
			<td><%= f.getName() %></td>
			<td><%= f.getTitle() %></td>
			<td><%= f.getCate() %></td>
			<td><%= f.getOfile() %></td>
			<td><%= f.getSfile() %></td>
			<td><%= f.getPostdate() %></td>
			<!-- 원본파일명이 한글인 경우 깨짐방지를 위해 URL 인코딩 처리를 한다. -->
			<!-- 페이지 소스보기에서 보면 한글로 된 파일명은 인코딩 처리되어있다. -->
			<td><a href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(),"UTF-8") %>&sName=<%= URLEncoder.encode(f.getSfile(),"UTF-8") %>">[다운로드]</a></td>
		</tr>
	<%} %>
	</table>
</body>
</html>