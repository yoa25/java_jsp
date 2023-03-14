<%@ page contentType="text/html; charset=utf-8"%>
<%
//String loginId = (String)session.getAttribute("loginId");
String loginId = null;
String saveId = "";
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equalsIgnoreCase("loginId")){
			loginId = cookie.getValue();
		}
		if(cookie.getName().equalsIgnoreCase("saveid")){
			saveId = cookie.getValue();
		}
	}
}
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
			<%
			if(loginId == null){//로그인 하지 않은 상태
			%>
			<form action="<%=application.getContextPath() %>/member/login.jsp" style="text-align: right;" method="post">
				<label>아이디 : <input type="text" name="id" value="<%=saveId %>"></label> 
				<label>비밀번호	: <input type="password" name="password"></label>
				<label>아이디 저장 <input type="checkbox" name="saveid"></label>
				<input type="submit" value="로그인">
			</form>				
			<%
			}else{
			%>
			<span><%=loginId %>님 로그인중 <a href="<%=application.getContextPath()%>/member/logout.jsp">로그아웃</a></span>
			<%
			}

			%>
		</header>

