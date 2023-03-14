<%@page import="ezen.common.factory.DaoFactory"%>
<%@page import="ezen.member.repository.JdbcMemberRepositoryT"%>
<%@page import="ezen.member.repository.MemberRepository"%>
<%@ page import="ezen.member.entity.Member" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%
//입력 데이터 수신
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="ezen.member.entity.Member" scope="request"/>
<!-- 멤버 객체 생성 및 저장 -->
<jsp:setProperty property="*" name="member"/>

<%
//회원 테이블에 등록
//MemberRepository repository = new JdbcMemberRepositoryT();
MemberRepository repository = DaoFactory.getInstance().getMemberRepository();
repository.create(member);
%>


<%-- 자바 코드를 사용하지 않고 웹컨테이너가 지원하는 액션태그 사용 (페이지 이동) --%>
<jsp:forward page="/member/memberResult.jsp"/>

