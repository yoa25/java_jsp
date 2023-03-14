<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<header>
			<h2>머리글부분</h2>
			<form action="#" style="text-align: right;" method="post">
				<label>아이디 : <input type="text" name="id"></label> <label>비밀번호
					: <input type="password" name="password">
				</label> <input type="submit" value="로그인">
			</form>
		</header>

		<nav>
			<ul>
				<li>메뉴1</li>
				<li>메뉴2</li>
				<li>메뉴3</li>
			</ul>
		</nav>
		<section>
			
			<%!
			String name;
			public String getMessage(){
				return "안녕하세요..";
			}
			%>
		
			<%= getMessage()%>
			
			<article>내용</article>
		</section>
		<aside>좌우메누</aside>
		<footer>바닥글</footer>
	</div>
</body>
</html>