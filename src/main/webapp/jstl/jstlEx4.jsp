<%@ page contentType="text/html; charset=utf-8"%>
<%-- 현재 페이지에서 jstl 태그를 사용하기 위해 jstl 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<c:set var="score" value="85" scope="page"/>
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty param.score }">
	<c:choose>
		<c:when test="%{param.score >= 90}">
		수입니다
	</c:when>
		<c:when test="%{param.score >= 80}">
		우입니다
	</c:when>
		<c:when test="%{param.score >= 70}">
		미입니다
	</c:when>
		<c:when test="%{param.score >= 60}">
		양입니다
	</c:when>
		<c:otherwise>
		가입니다
		</c:otherwise>
	</c:choose>
</c:if>

</body>
</html>