<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

<title>나의 문의 삭제</title>
</head>
<body>
	<center>
	<h5>삭제되었습니다.</h5>	
	<input type="submit" value="확인" id = "question-check"
	onclick="opener.location.reload();window.close();">
</body>
</html>