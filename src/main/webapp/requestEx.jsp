<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>jsp 디폴트 객체 연습</h2>
<ul>
	<li>브라우저 요청 방식 : <%=request.getMethod() %></li>
	<li>브라우저 요청 URI : <%=request.getRequestURI() %></li>
	<li>브라우저 요청 프로토콜 : <%=request.getProtocol() %></li>
</ul>

<h2>브라우저 요청 메시지의 헤더정보</h2>
<%
String userAgent = request.getHeader("user-agent");
//out.println(userAgent);
%>
<%=userAgent %>
<%
Enumeration<String> e = request.getHeaderNames();
while(e.hasMoreElements()){
	String headername = e.nextElement();
	String headerValue = request.getHeader(headername);

%>
<%=headername %> : <%=headerValue %><br>
<%} %>
</body>
</html>