<%@ page contentType="text/html; charset=utf-8"%>
<%-- 현재 페이지에서 jstl 태그를 사용하기 위해 jstl 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setAttribute("message", "<h1>졸려요 코코</h1>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%= "졸려요 코코" %><br>
<%= request.getAttribute("message") %><br>
${message}<br>
<%-- 특수문자를 이스케이프 처리하기 때문에 태그가 적용되지 않고 그대로 출력된다 --%>
<c:out value="${message}" default="밸류값에 할당된 값이 없으면 출력"></c:out><br>
<%-- 이스케이프 처리 하지 않음~ --%>
<c:out value="${message}" default="밸류값에 할당된 값이 없으면 출력" escapeXml="false"></c:out>
</body>


</html>