<%@page import="ezen.member.entity.Member"%>
<%@page import="ezen.member.repository.JdbcMemberRepositoryT"%>
<%@page import="ezen.member.repository.MemberRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>

<jsp:useBean id="member" class="ezen.member.entity.Member" scope="request"/>
<jsp:setProperty property="*" name="member" />


<%
	String saveId = request.getParameter("saveid");
	
	//db연동
	MemberRepository repository = new JdbcMemberRepositoryT();
	Member loginMember = repository.isMember(member);
	
	//회원인 경우
	if(loginMember != null){
		
		//쿠키를 이용한 로그인 처리
		Cookie loginCookie = new Cookie("loginId", member.getId());
		loginCookie.setPath("/");
		response.addCookie(loginCookie);
	
		//쿠키를 이용한 아이디 저장(파일 저장)
		if(saveId != null){
			Cookie saveIdCookie = new Cookie("saveId", member.getId());
			saveIdCookie.setPath("/");
			saveIdCookie.setMaxAge(60*60*24*100); //100일동안 파일 저장
			response.addCookie(saveIdCookie);
		}
		response.sendRedirect(application.getContextPath()+"/index.jsp"); // 반응. 여기로 다시 돌려줘요~
	
	}else {
		//회원이 아닌 경우 로그인 화면으로 이동
%>

	<p style="color:red">아이디 또는 비밀번호를 잘못 입력했습니다.<br> 
	입력하신 내용을 다시 확인해주세요</p>
		
<%
	}
%>


