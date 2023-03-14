<%@ page contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>페이지 모듈화 작업</title>
<link rel="stylesheet" href="./css/main.css">
</head>

<body>
	<div id="container">
		<%-- <%@ include file="/include/header.jsp" %> --%>
		<jsp:include page ="/include/header.jsp">
			<jsp:param value="메인페이지 헤더입니다" name="title"/>
		</jsp:include>

		<section>
			<article>내용</article>
		</section>
		
		<%-- <%@ include file="/include/aside.jsp" %> --%>
		<jsp:include page ="/include/aside.jsp"/>
		
		<jsp:include page ="/include/footer.jsp"/>
		
		<%--<%@ include file="/include/footer.jsp" %>--%>
		
		
	</div>
</body>
</html>
