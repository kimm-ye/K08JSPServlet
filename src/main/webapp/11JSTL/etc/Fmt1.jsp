<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>	
	<!--  
	국제화(Formatting) 태그
	-국가별로 다양한 언어, 날짜, 시간, 숫자 형식을 설정할때 사용한다.
	-접두어로는 fmt를 사용한다.
	-->
	<h4>숫자 포맷 설정</h4>
	<!-- 변수 생성 -->
	<c:set var="number1" value="12345" />
	<!--  
	groupingUsed 속성은 디폴트값이 true이므로 아래는 세자리마다 컴마를 출력한다.
	-->
	콤마 O : <fmt:formatNumber value="${number1 }" /> <br>
	<!-- 세자리 콤마가 출력되지 않는다. -->
	콤마 X : <fmt:formatNumber value="${number1 }" groupingUsed="false"/> <br>
	
	
	
	<!--  
	type이 currency인 경우 현지 통화기호로 출력된다.
	var 속성 지정시 즉시 출력되지 않고, 원하는 위치에 EL을 통해 출력한다.
	currencySymbol 속성으로 통화가호를 변경할 수 있다.
	-->
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1" />
	통화기호(원화로 표시) : ${printNum1 } <br>
	
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1" currencySymbol="$"/>
	통화기호(달러로 표시) : ${printNum1 } <br>
	
	
	<!-- value 속성값을 % 단위로 변환해서 출력한다. 즉 100을 곱한 결과에 % 기호까지 붙여준다. -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2" />
	퍼센트 : ${printNum2 }
	
	
	
	<h4>문자열을 숫자로 변경</h4>
	<!--  
		Integer.parseInt()와 동일한 기능으로 문자열을 숫자로 변경한다.
		pattern : 변환할 문자열의 패턴을 지정하여 파싱한다.
		integerOnly : 소수점 이하를 절삭하여 정수부분만 출력한다.
	-->
	<c:set var="number2" value="6,789.01" />
	<!--  
		pattern 속성에 
			000,000.00 사용시 정상
			0,0.0 사용시 정상
			,. 사용시 에러발생
	-->
	<fmt:parseNumber value="${number2 }" pattern="00,000.00" var="printNum3" /> <!-- 즉, 여기서의 pattern은 저 패턴으로 출력하려는 게 아니라 문자열을 숫자로 변환을 한 부분이다. -->
	소수점까지 : ${printNum3 } <br>
	<fmt:parseNumber value="${number2 }" integerOnly="true" var="printNum4" />
	정수 부분만 : ${printNum4 }
	
	
	<h4>Java코드로 1000단위 콤마 표시하기</h4>
	<%
	//page영역에 저장된 number1을 문자열로 변환후 저장한다.
	String moneyStr = pageContext.getAttribute("number1").toString();
	//숫자로 변환한다.
	int money = Integer.parseInt(moneyStr);
	//해당 클래스는 싱글턴패턴이 적용되어 있으므로 new로는 객체를 생성할 수 없다. (생성자가 private기 때문에)
	NumberFormat nf = NumberFormat.getInstance();
	//format() 메서드를 통해 세자리 컴마를 적용한다.
	String commaMoney = nf.format(money);
	out.print(commaMoney);
	%>
</body>
</html>