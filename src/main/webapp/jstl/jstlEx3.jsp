<%@ page contentType="text/html; charset=utf-8"%>
<%-- 현재 페이지에서 jstl 태그를 사용하기 위해 jstl 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="score" value="85" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

${message}<br>
<c:out value="${message}" default="" escapeXml="false"></c:out>
회원 이름 : ${member.name}<br>
회원 아이디 : ${member.id}
<%-- 
<%
String score = (String)pageContext.getAttribute("score");
int intScore = Integer.parseInt(score);
if(intScore >= 60){%>
합격입니다
<%
%>} else{
%>
불합격입니다
<%
}%>
--%>

<c:if test="${score >= 60}">
합격입니다
</c:if>

<c:if test="${empty param.id}">
당신은 id를 전달하지 않았습니다.
</c:if>
<c:if test="${not empty param.id}">
${param.id}
</c:if>
</body>
</html>