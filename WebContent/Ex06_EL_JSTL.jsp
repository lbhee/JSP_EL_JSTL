<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL for문</h3>
	<!-- 
		<java코드>
		
		int sum = 0;
		for(int 1 = 0; i <= 10; i++) {
			sum += i;
		}
		
		for(String s : list){}
	 -->
	 <c:forEach var="i" begin="1" end="10">
	 	<c:set var="sum" value="${sum+i}"/>
	 	<b>${i}</b><br>
	 </c:forEach>
	 sum 누적값 : ${sum}<br>
	 
	 <hr>
	 
	 <h3>구구단 5단 출력</h3>
	 <ul>
		 <c:forEach var="i" begin="1" end="9">
		 	<li>
		 		5 * ${i} = ${5 * i}
		 	</li>
		 </c:forEach>
	 </ul>
	 
	 <hr>
	 
	 <h3>El & JSTL 사용해서 구구단 출력하기</h3>
	 <table border="1">
	 <c:forEach var="i" begin="2" end="9">
	 	<c:forEach var="j" begin="0" end="9">
	 		<c:choose>
	 			<c:when test="${j == 0}">
	 				<tr bgcolor="gold"><th>${i}단</th></tr>
	 			</c:when>
	 			<c:otherwise>
	 				<tr><td>${i} * ${j} = ${i*j}</td></tr>
	 			</c:otherwise>
	 		</c:choose>
	 	</c:forEach>
	 </c:forEach>
	 </table>
	 
	 <hr>
	 
	 <h3>일반적인 배열 출력</h3>
	 <%
	 	int[] arr = new int[]{10, 20, 30, 40, 50};
	 	for(int i : arr) {
	 		out.print("출력값 : <b><i>" + i + "</i></b><br>");
	 	}
	 %>
	 
	 <h3>EL은 java객체에 대한 직접적근이 불가능 -> JSTL을 통해서 접근</h3>
	 arr객체배열에 직접접근 -> ${arr}<br>
	 
	 <c:set var="intarr" value="<%=arr %>"/>
	 JSTL을 통한 접근 -> ${intarr}<br>           <!-- 재정의 되지 않았으니 주소값 출력 -->
	 
	 <h3>forEach의 개선된for문을 사용해서 배열출력</h3>
	 <c:forEach var="i" items="${intarr}">
	 	배열값 : ${i}<br>
	 </c:forEach>  
	 
	 <h3>c:set에 담지않고 단순하게 출력</h3>        <!-- 편의에 따라서 골라쓰자 -->
	 <c:forEach var="i" items="<%=arr %>">
	 	배열값2 : ${i}<br>
	 </c:forEach>
	 
	 <h3>재미삼아서 그냥해보는 것</h3>
	 <c:forEach var="i" items="<%=new int[]{10,20,30,40,50} %>"> <!-- new도 주소값을 넘기는 것이기 때문에 가능하지만 사용하지마세요 -->
	 	배열값3 : ${i}<br>
	 </c:forEach>
	 
	 <h3>forEach 속성활용하기</h3>
	 <c:forEach var="i" items="${intarr}" varStatus="status">
	 	index: ${status.index}&nbsp;&nbsp;&nbsp;
	 	count: ${status.count}&nbsp;&nbsp;&nbsp;
	 	value: ${i}<br>
	 </c:forEach>
	 <hr>
	 
	 <h3>TODAY POINT(게시판 화면구성)</h3>
	 <%
	 	//DB에 사원정보를 담는 테이블이 있다.
	 	//java코드 : List<Emp> getEmpList(){ 구현되는 코드 }
	    List<Emp> emplist = new ArrayList<>();
	    emplist.add(new Emp(100, "A"));
	    emplist.add(new Emp(200, "B"));
	    emplist.add(new Emp(300, "C"));
	    
	    //return emplist;
	    //함수의 리턴값을 받아서 처리
	    for(Emp e : emplist) {
	    	out.print(e.getEmpno() + " / " + e.getEname() + "<br>");
	    }
	    
	    //이 데이터를 JSP페이지에서 테이블에 출력해보자!
	    request.setAttribute("list", emplist);
	    //include나 forward된 페이지에서 사용가능하다. (request.getAttribute)
	    //또는 EL도 접근가능하다. (requestScope.list)
	    
	 %>
	 
	 <h3>게시판 데이터 출력(EL & JSTL) - c:set사용</h3>
	 <c:set var="list" value="<%=emplist %>"/>
	 <table border="1">
	 	<tr><td>사번</td><td>이름</td></tr>
	 	<c:forEach var="emp" items="${list}">
	 		<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
	 	</c:forEach>
	 </table>
	 
	 <h3>게시판 데이터 출력(EL & JSTL) - 배열주소사용</h3>
	 <table border="1">
	 	<tr><td>사번</td><td>이름</td></tr>
	 	<c:forEach var="emp" items="<%=emplist %>">
	 		<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
	 	</c:forEach>
	 </table>
	 
	 <h3>java Map 객체 EL&JSTL 사용해서 출력</h3>
	 <%
	 	Map<String,Object> hm = new HashMap<>();
	 	hm.put("name", "hong");
	 	hm.put("pwd", "1004");
	 	hm.put("date", new Date());
	 %>
	 <c:set var="hm" value="<%=hm %>"/>
	 <c:forEach var="obj" items="${hm}">
	 	${obj.key} -> ${obj.value}<br>
	 </c:forEach>
	 
	 <!-- forEach안쓰고 출력 -->
	 key(name) : ${hm.name}<br>
	 key(pwd)  : ${hm.pwd}<br>
	 key(date) : ${hm.date}<br>
	 <hr>
	 
	 <h3>기타옵션</h3>
	 JSTL 구분자 기준처리<br>
	 <c:forTokens var="token" items="A.B.C.D" delims=".">
	 	${token}<br>
	 </c:forTokens>
	 
	 복합구분자<br>
	 <c:forTokens var="token" items="A.B/C-D" delims="./-">
	 	${token}<br>
	 </c:forTokens>
	 
	 <hr>
	 <!-- forEach의 단점 : 스텝이 -1의 값을 가질 수 없다. -->
	 <c:set var="nownum" value="10" />
	 <c:forEach var="i" begin="0" end="${nownum}" step="1">
	 	${nownum - i}<br>	<!--  최대값에서 i를 빼는 식으로해서 역순출력한다. --> 	
	 </c:forEach>
</body>
</html>