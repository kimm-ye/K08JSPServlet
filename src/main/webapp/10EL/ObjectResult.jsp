<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 객체 매개변수</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<!--  
		영역에 저장된 속성에 EL로 접근할때는 속성명이 중복되지 않는
		경우라면 EL내장객체 없이 속성명 만으로 접근할 수 있다.
		즉 requestScope.personObj.name 형태로 기술하지 않아도 된다.
	-->
	<ul>
		<!-- 
			"속성명.멤버변수" 형태로 기술하면 객체의 getter()를 자동으로
			호출하게 되어 값이 출력된다. 즉 아래의 문장은 getter()를 호출하므로
			Person클래스에서 getName()을 주석처리하면 에러가 발생한다.
			또한 출력시 형변환이 자동으로 되므로 더욱 편리하다.
			
			왜냐면 거기서 name을 가져오는거니까
		-->
		<li>Person 객체 => 이름 : ${personObj.name }, 나이 : ${personObj.age }</li>
		
		<!-- requestScope은 생략할 수 있다. 여기서는 그냥 보여주려고 씀 -->
		<li>String 객체 => ${requestScope.stringObj }</li>
		<li>Integer 객체 => ${integerObj }</li>
	</ul>
	
	<h2>JSP내장객체를 통해 영역의 값 읽어오기</h2>
	<%
	//영역은 모든 객체를 저장할 수 있는 공간이므로 Object형으로 저장된다.
	Object object = request.getAttribute("personObj");
	//따라서 영역에서 객체를 꺼내서 사용할때는 원래 형으로 형변환 해야한다.
	Person person = (Person)object;
	//출력시에는 getter()를 사용한다.
	out.println("이름:" + person.getName() + "<br>");
	%>
	나이:<%=person.getAge() %>
	
	
	<!-- 
	파라미터로 전달된 값을 읽을때 3가지 모두 사용할 수 있다. 
		param.파라미터명
		param['파라미터명']
		param["파라미터명"]
	-->
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- EL은 변수/파라미터 등을 출력하기 위해 사용한다. 그래서 달러부터 {}까지 를 하나로 봄 -->
		<!-- 
			EL에서는 산술연산이 가능하므로 아래에서는 30이 출력된다.
			또한 파라미터로 전달된 문자열을 숫자로 자동변환 해준다. (파라미터는 원래 문자열)
		-->
		<li>${param.firstNum + param['secondNum'] }</li>
		<!-- 단순한 출력이므로 10 + 20으로 출력된다. -->
		<li>${param.firstNum } + ${param["secondNum"] }</li>
	</ul>
</body>
</html>