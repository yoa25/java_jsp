<%@page import="javax.sql.DataSource"%>
<%@page import="ezen.common.factory.DaoFactory"%>
<%@page import="ezen.member.repository.JdbcMemberRepositoryT"%>
<%@page import="ezen.member.entity.Member"%>
<%@page import="java.util.List"%>
<%@page import="ezen.member.repository.MemberRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>



<%
// 비즈니스 객체 생성 및 사용
// MemberService memberservice = new MemberServiceImlp();
// List<Member> list =  memberService.getMembers();

// 편의상 비즈니스 객체는 생략하고 JSP에서 DAO 객체 사용
// MembeRepository를 이용한 DB연동

MemberRepository repository = DaoFactory.getInstance().getMemberRepository();

// 코드 이름이 바뀌어도 불러올 수 있도록... jsp를 수정하는 일 없게.
// daoFactory의 역할을 확장하는 것이 바로 스프링

//MemberRepository repository = DaoFactory.getMemberRepository();

// BoardRepository boardRepository = DaoFactory.getboardRepository();

List<Member> list = repository.findAll();
%>
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
				
					<%
					for (Member member : list) {
					%>
					
					<tr>
						<th><a href="memberEdit.jsp?id=<%=member.getId()%>"><%=member.getId()%></a></th>
						<th><%=member.getName()%></th>
						<th><a href="<%=member.getEmail()%>"><%=member.getEmail()%></a></th>
						<th><%=member.getAge()%></th>
						<th><%=member.getRegdate()%></th>
					</tr>
					
					<%
					}
					%>

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