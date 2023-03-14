<%@ page import="member.bean.Member" %>
<%@ page contentType="text/html; charset=utf-8"%>

<%
	//Member member = (Member)request.getAttribute("member");
%>

<!-- 읽어올 때도 useBean 사용 -->
<jsp:useBean id="member" class="member.bean.Member" scope="request"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 정보</h2>
아이디 : <jsp:getProperty property="id" name="member"/> <br>
이름 : <jsp:getProperty property="name" name="member"/> <br>
이메일 : <jsp:getProperty property="email" name="member"/> <br>
</body>
</html>