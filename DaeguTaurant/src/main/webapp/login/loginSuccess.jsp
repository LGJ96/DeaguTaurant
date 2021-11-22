<!-- 6번 -->
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//Object 영역객체.getAttribute(String attrName)
	UserVO loginUser = (UserVO)request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaeguTaurant</title>
</head>
<body>
	<h1>로그인에 성공한 사용자 정보</h1>
	<b>아이디 : </b> <%=loginUser.getUser_id() %><br> <!-- out.print() 역할을 하는 Expression Tag -->
	<b>비번 : </b> <%=loginUser.getUser_pw() %><br>
	<b>이름 : </b> <%=loginUser.getUser_name() %><br>
	<b>닉네임 : </b> <%=loginUser.getUser_nickname() %><br> 
</body>
</html>