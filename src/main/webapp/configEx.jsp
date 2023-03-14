<%@ page contentType="text/html; charset=utf-8"%>
<%
config.getInitParameter("");
String message = config.getInitParameter("message");

String upPath = application.getInitParameter("uploadPath");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
web.xml에서 읽어들인 초기 파라메터 값 : <%=message %>
업로드 패스 : <%=upPath %><br>
<%=page %>, <%=this %>,
</body>
</html>