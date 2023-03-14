<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//String loginId = (String)session.getAttribute("loginId");
String loginId = null;
String saveId = "";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>float를 이용한 홈페이지 레이아웃</title>
<link rel="stylesheet" href="<%=application.getContextPath() %>/css/main.css">
</head>


<body>
	<div id="container">
		<header>
			<h2>머리글부분</h2>
			
			<c:url var="login" value="/member/login.jsp" 
			context="${pageContext.servletContext.contextPath}"/>
			
			<c:if test="${cookie.loginId.empty}">
				<form action="${login}" style="text-align: right;" method="post">
					<label>아이디 : <input type="text" name="id" value="<%=saveId %>"></label> 
					<label>비밀번호	: <input type="password" name="password"></label>
					<label>아이디 저장 <input type="checkbox" name="saveid"></label>
					<input type="submit" value="로그인">
				</form>				
			</c:if>
				
			<span><%=loginId %>님 로그인중 
			<a href="<%=application.getContextPath()%>/member/logout.jsp">로그아웃</a></span>

		</header>

		<nav>
			<ul>
				<li>메뉴1</li>
				<li>메뉴2</li>
				<li>메뉴3</li>
			</ul>
		</nav>
		<section>
			<article>내용</article>
		</section>
		<aside>좌우메누</aside>
		<footer>바닥글</footer>
	</div>
</body>
</html>
