<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - import</title></head>
<body>
	<!--  
	import 태그
		: include 액션태그와 같은 기능으로 request영역을 공유한다. 
		서로 다른 페이지 이므로 page영역은 공유되지 않는다. 
		url속성에 절대경로 설정시 컨텍스트 루트명은 제외한다. 
		
		프로젝트명을 제외한 나머지 루트명을 쓰면 된다는 뜻
	-->
	<!-- 리퀘스트 영역에 변수 저장 -->
    <c:set var="requestVar" value="MustHave" scope="request" />
    <!--  
    	var속성을
    		미사용시 : 해당 위치에 즉시 포함된다. 
    		사용시 : var에 지정한 변수를 EL로 출력하는곳에 포함된다.
    			선언과 출력을 별도로 할수 있으므로 코드를 정리할때 편리하다. 
    -->
    <c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="JSP" />
        <c:param name="user_param2" value="기본서" />
    </c:import>       
    
    <h4>다른 문서 삽입하기</h4>
    ${contents }
    <!-- 위에 var속성이 있을때는 원하는 위치에 삽입가능. 없을때는 import태그가 있는 위치에 즉시 출력된다. -->
    
    <h4>외부 자원 삽입하기</h4>    
    <iframe src="../inc/GoldPage.jsp" style="width:100%;height:600px;"></iframe>
</body>
</html>