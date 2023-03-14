<%@page import="ezen.member.repository.MemberRepository"%>
<%@page import="ezen.member.repository.JdbcMemberRepositoryT"%>
<%@page import="ezen.member.entity.Member"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.List"%>
<%@page import="ezen.common.factory.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
MemberRepository repository = DaoFactory.getInstance().getMemberRepository();
List<Member> list = repository.findAll();
%>

<%-- 파라메터 뿐만 아니라 알아서 쿠키와 세션까지 보내준다. --%>
<%--<c:url var="view" value="/jstl/jstlView.jsp" context="${pageContext.servletContext.contextPath}"> --%>

<c:url var="view" value="jstlView.jsp">
	<c:param name="name" value="${name} }"/>
	<c:param name="id" value="${id} }"/>
</c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<style>
@media ( min-width : 1200px) {
	.container {
		max-width: 970px;
	}
}
</style>
</head>
<body>
<%--
	<h2>JSLT를 이용해 구구단 출력</h2>
	<table border="1" style="background-color: gold;">
		<c:forEach var="i" begin="2" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td>${i}*${j}=${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
--%>

		<div class="container">
			<div class="py-5 text-center">
				<h2>회원 목록</h2>
			</div>
			<div class="row">
				<div class="col">
					<a href="" class="btn btn-primary float-end">회원 등록</a>
				</div>
			</div>
			<hr class="my-4">
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>나이</th>
							<th>가입일자</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="member" items="${list }" varStatus="loopInfo">

							<tr>
								<td>${loopInfo.count}</td>
								<td><a href="${view}">${member.id}</a></td>
								<td><a href="#">${member.id}</a></td>
								<td>${member.name}</td>
								<td><a href="mailto:${member.email}">${member.email}</a></td>
								<td>${member.age}</td>
								<td>${member.regdate}</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
			document.querySelector(".edit").addEventListener("submit", member)
		</script>
</body>
</html>