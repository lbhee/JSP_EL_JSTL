<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL out출력객체 - 잘 사용하지 않는다(EL을 사용함)</h3>
	<c:out value="<p>문단태그입니다.</p>" />
	&lt;p&gt; 이 태그는 문단태그 입니다.
	
	<p></p> 이 태그는 ...설명
	
	<hr>
	
	<h3>JSTL 예외처리</h3>
	<c:catch var="msg">
		name: <%=request.getParameter("name") %><br>
		<%
			if(request.getParameter("name").equals("hong")) {
				out.print("당신의 이름은 " + request.getParameter("name"));
			}
		%>
	</c:catch>
	<c:if test="${msg != null}">
		<h4>예외발생</h4>
		오류메세지 : ${msg}<br>
	</c:if>
	<!-- catch블록 안에서 예외가 발생하면 예외객체가 생성된다. 그 예외객체정보를 msg라는 변수가 받는다. catch(Exception e)역할 -->
</body>
</html>