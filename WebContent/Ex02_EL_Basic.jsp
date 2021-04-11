<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL스크립트 언어는 서버쪽 자원에 접근가능. <%=를 사용하지 않아도 된다.
	//EL을 사용한다고해서 java객체 api를 지원하지는 않는다.
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면 출력(별도의 객체를 통해서 서버자원에 접근가능)</h3>
	EL : ${requestScope.day}<br>  <!-- request객체에 접근하기 위해서 requestScope사용 -->
	EL : ${day}<br>               <!-- 객체명을 생략가능하다. (권장하지않음) -->
	EL : ${sessionScope.day2}<br> <!-- session객체에 접근하기 위해서 sessionScope사용 -->
	
</body>
</html>