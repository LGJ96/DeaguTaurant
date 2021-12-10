<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<title>탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body>

	<center>
	<h5>탈퇴되었습니다.</h5>	
	<input type="submit" value="확인" id = "question-check"
	onclick="opener.location.href='../home_review/index.jsp';window.close();">


</body>
</html>