<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <%=10 + "10"%><br> ${ 10 + "10" }, ${"10"/2 }
  <br> ${true && false }, ${true||false}, ${!true} ${10>5}, ${10 == 10}
  <br> ${empty null},${empty ""}
</body>
</html>