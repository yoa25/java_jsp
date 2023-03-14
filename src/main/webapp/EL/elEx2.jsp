<%@page import="ezen.member.entity.Member"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
pageContext.setAttribute("id", "koko");
pageContext.setAttribute("name", "코코");
session.setAttribute("age", 5);
application.setAttribute("school","아이스크림 아카데미"); //이 범위는 잘 안씁니다...
%>

<%= pageContext.getAttribute("id")%><br>
<%= request.getAttribute("name")%><br>
<%= session.getAttribute("age")%><br>
<%= application.getAttribute("school")%><br>
<!-- 
<%= pageContext.getAttribute("school", PageContext.APPLICATION_SCOPE)%><br>
<%= pageContext.findAttribute("name") %>
 -->

<%
	//이건 메모리상에 생성된 것. 스코프에 저장된 것이 아니기 때문에 el 접근 불가
	Member member = new Member();
	member.setId("momo");
	member.setName("모모");
	member.setAge(3);
	member.setEmail("momo@naver.com");
	
	request.setAttribute("member", member);
%>

브라우저 요청 : <%request.getMethod(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>el이 제공하는 11개의 디폴트 객체</h2>
${param.id},${param["id"]}<br>
${paramValues.hobby[0]},${paramValues.hobby[1]}<br>
${header["user-agent"]}<br>
${headerValues.Cookie[0]}<br>
<!-- ${cookie.saveId.value}<br> --> 

${pageScope.id}<br>
${requestScope.name}<br>
${sessionScope.age}<br>
${applicationScope.school}<br>

<!-- 전범위에서 찾아도~나오죠~ -->
${id}<br>
${name}<br>
${age}<br>
${school}<br>

${requestScope.member.name}<br>
${member.name}<br>
<%--EL에서 메소드 호출도 가능하지만 웬만하면 사용하지마세요  --%>
${member.getName()}<br> 
${member}<br>

브라우저 요청방식 : ${pageContext.request.method}



</body>
</html>