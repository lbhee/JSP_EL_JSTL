<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  외부라이브러리 (lib) 사용하기 위한 조건 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- prefix는 uri의 별칭 -->
<!-- 
	EL   : 출력만이 목적이다. 제어구조, 변수 개념 자체가 없다. (로직X)
	JSTL : EL을 도와서 제어구조, 변수를 사용가능하다. (톰캣에서 제공하지 않는다. 별도 다운로드 필요함)
-->
   
<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("hiuser");
	
	HashMap<String,String> hp = new HashMap<>();
	hp.put("data", "1004");
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<h3>기존방식 출력</h3>
	<%=e %><br>
	<%=e.getEmpno() %><br>
	<%=e.getEname() %><br>
	
	<h3>EL방식 출력</h3>
	EL단점 : 자바 객체에 대한 출력을 못한다.(직접적인 접근이 막혀져 있음) -> ${e}<br>
	EL단점 : 이것도 안된다. -> ${e.getEmpno()}<br>
	
	<h3>해결방법</h3>
	1. request 또는 session 객체에 담아주면 가능하다.(이중으로 일을 하게됨)<br>
	2. JSTL을 사용해서 처리한다.<br>
	
	<h3>JSTL(core엔진선언 후 사용) : 변수, 제어문 사용가능(자바코드없이!)</h3>
	<c:set var="m" value="<%=e %>" ></c:set>  
	JSTL을 사용해서 m이라는 변수 생성해서 e를 값으로 담아준다. 이렇게하면 e를 출력할 수 있다. -> ${m}<br>
	
	getter함수(권장방법아님) : ${m.getEmpno()}<br>
	EL출력 권장방법 : (m.memberfield명 -> 자동으로 getter호출) : ${m.empno}<br>
	EL출력 권장방법 : (m.memberfield명 -> 자동으로 getter호출) : ${m.ename}<br>
	<hr>
	
	<c:set var="username" value="${m.ename}"/>
	변수값 출력 : ${username}<br>
	<hr>
	
	<h3>JSTL 변수에 scope 정의하기</h3>
	<c:set var="job" value="농구선수" scope="request"/> 
	당신의 직업은 : ${job}<br>
	만약에 당신이 include, forward한 페이지가 있다면 그 페이지에서도 EL을 사용해서 job변수를 출력할 수 있다.
	<!-- job이라는 변수는 request객체처럼 이 페이지에서만 사용하거나 include, forward시에 다른페이지에서 사용가능 -->	
	<hr>
	
	<h3>변수삭제(잘쓰지 않는다.)</h3>
	<c:set var="job2" value="야구선수" scope="request"/>
	값 출력(삭제전) : ${job2}<br>
	<c:remove var="job2"/>
	값 출력(삭제후) : ${job2}<br>
	<hr>
	
	<h3>hp객체 직접 접근하기</h3>
	hp객체 직접접근 -> ${hp}<br>
	<c:set var="vhp" value="<%=hp %>"/>
	hp객체 접근-> ${vhp}<br>
	hp객체 접근-> ${vhp.data}<br>
	<hr>
	
	<h3>속성 넣기(잘쓰지 않는다.)</h3>
	<c:set target="${vhp}" property="color" value="red"/>
	hp객체 -> ${vhp}<br>
</body>
</html>