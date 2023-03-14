<%@ page import="member.bean.Member" %>
<%@ page contentType="text/html; charset=utf-8"%>

<%
//DB에서 가져온 정보라고 가정
//Member member = new Member();
//member.setId("koko");
//member.setPassword("1111");
//member.setName("코코");
//member.setEmail("koko@gmail.com");
%>

<!-- new Member()와 같다. -->
<jsp:useBean id="member" class="member.bean.Member" scope="request"></jsp:useBean>


<%--
<%
//이렇게 돌아간다
Member member = (Member)request.getAttribute("member");
if(member == null){
	member = new Member();
	request.setAttribute("member", member);
}
%>
--%>



<jsp:setProperty property="id" value="1111" name="member"/>
<jsp:setProperty property="password" value="1111" name="member"/>
<jsp:setProperty property="name" value="코코" name="member"/>
<jsp:setProperty property="email" value="koko@gmail.com" name="member"/>

<jsp:forward page="useBeanEx2.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>