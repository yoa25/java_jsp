<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cardNumber" value="1111-2222-3333"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
	<c:forTokens var="tokens" items="${cardNumber}" delims="-"></c:forTokens>
</body>
</html>