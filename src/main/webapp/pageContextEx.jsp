<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>

<%
//서블릿에서 제공하는 Context 객체 3개
//request < session < application

//jsp에 추가된 Context 객체 : pageContext (가장 작음)
//현재 jsp에 관련된 환경 정보 저장
pageContext.setAttribute("name", "코코");
pageContext.setAttribute("today", Calendar.getInstance());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
아이디 : <%=session.getAttribute("id") %><br>
아이디 : <%=pageContext.getAttribute("id", PageContext.SESSION_SCOPE) %><br>
아이디 : <%=pageContext.findAttribute("id") %> 
<!-- pageContext > request > session > application -->

<%=pageContext.getAttribute("name") %><br>
<%=pageContext.getAttribute("today") %><br>
</body>
</html>