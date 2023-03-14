<%@ page contentType="text/html; charset=utf-8"%>
<%
//세션 삭제
//session.invalidate();

//일단 쿠키를 찾아
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equalsIgnoreCase("loginId")){
			cookie.setMaxAge(0); //쿠키 삭제 
			cookie.setPath("/");
			response.addCookie(cookie);
			break;
		}
	}
}

//index.jsp 자동 요청 처리. 세션이 없어졌죠?
//response.sendRedirect(application.getContextPath()+"/index.jsp");
%>
<%-- 똑같은 코드~ --%>
<c:redirect url = "/index.jsp"/>