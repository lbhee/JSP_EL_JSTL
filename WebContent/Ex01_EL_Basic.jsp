<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	request.setAttribute("name", "korea");
	session.setAttribute("user", "bit");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 출력표현식</title>
</head>
<body>
	<h3>JSP복습</h3>
	<b><%=id %></b><br>
	<b><%=request.getAttribute("name") %></b><br>
	<b><%=session.getAttribute("user") %></b><br>
	<b><%=request.getParameter("userid") %></b> <!-- 변수에 담지 않아도 출력가능 -->
	
	
	<!-- 
		문제점 -> 스파게티코드(%영역 UI과 혼재)는 유지보수 어려움, 코드 가독성 떨어짐
		
		해결방법 -> EL(Expression Language), JSTL(JSP Standard Tag Library)
		          
		          
		EL 
		: JSP페이지에서만 사용되는 스크립트 언어. 화면출력을 담당. (%=과 같은역할)
		  html과도 잘 어울리고 script와도 어울린다. 단점은 JSP에서만 사용가능하다는 것.
		  톰갯이 내장하고 있는 객체 자원(별도의 참조없이 사용가능)
		            
		EL이 가지고 있는 객체
		 1. param
		 2. paramValues
		 3. requestScope
		 4. sessionScope
		 5. applicationScope            
		            
	 -->
	 <hr>
	 
	 <h3>EL 출력표현식</h3>
	 기존방식 : <%= 100+50 %><br>
	 EL방식  : ${00+50}<br>
	 EL방식  : ${"1" + 1}<br>     <!-- 문자형 숫자 자동형변환 => 2 -->
	 EL방식  : ${1==1}<br>
	 EL방식  : ${false}<br>
	 EL방식  : ${!false}<br>
	 EL방식  : ${empty x}<br>     <!-- x라는 변수의 값이 비어있니? -->
	 
</body>
</html>