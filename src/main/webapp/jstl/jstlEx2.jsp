<%@ page contentType="text/html; charset=utf-8"%>
<%-- 현재 페이지에서 jstl 태그를 사용하기 위해 jstl 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// request.setAttribute("message", "<h1>졸려요 코코</h1>");
%>
<jsp:useBean id="member" class="ezen.member.entity.Member" scope="page"/><c:catch></c:catch>

<%-- 4개의 스코프 객체에 속성 설정 --%>
<c:set var="message" value="김기정 바보"/>
<%-- 자바 빈 프로퍼티 설정 --%>
<c:set target="${member}" property="name" value="로코"/>
<c:set target="${member}" property="id" value="roco"/>

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
</body>


</html>