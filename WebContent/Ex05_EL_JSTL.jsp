<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	/*
		JSTL 구문
		1. <c:set             변수생성, 값을 저장 **
		2. <c:remove          변수삭제
		3. <c:if test="조건식"  조건문 **
		4. <c:choose          여러가지 조건에 따라서 처리가능(if보다 활용도가 높다) </c:when> <c:otherwise>**
		5. <c:forEach         반복문 **
		6. <c:forTokens       for문과 split의 결합
		7. <c:out             출력문 (이것보다는 EL을 사용하는 것을 권장)
		8. <c:catch           예외처리
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL & EL</h3>
	EL의 parameter 사용하기 : ${param.id} - ${param.pwd}<br>
	
	<hr>
	<h3> EL의 parameter를 변수로 저장하기</h3>
	<c:set var="userid" value="${param.id}"/>
	<c:set var="userpwd" value="${param.pwd}"/>
	
	<hr>
	<h3>JSTL 변수값 출력하기</h3>
	id: ${userid}<br>
	pwd: ${userpwd}<br>
	
	<hr>
	<h3>if문 사용하기</h3>
	<c:if test="${!empty userpwd}">           <!-- 패스워드가 있으면 --> 
		<h3>not empty userpwd</h3>
		<c:if test="${userpwd == '1004'}">    <!-- 패스워드가 1004면 -->
			<h3>welcom Admin page</h3>
		</c:if>
	</c:if>
</body>
</html>