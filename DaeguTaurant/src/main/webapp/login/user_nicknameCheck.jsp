<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	String user_nickname = (String)session.getAttribute("user_nickname");
	boolean user_nicknameExist = (boolean)session.getAttribute("user_nicknameExist");
%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

<%
		if(user_nicknameExist){
	%>
	<h4><%=user_nickname %>는 사용할 수 없습니다.</h4>
	
	<form action="user_nicknameCheck.dae">
		<label for = "user_nickname">닉네임 : </label>
		<input type = "text" name = "user_nickname" id = "user_nickname"/><br>
		<input type = "submit" class="btn btn-check"  value = "적용"/>
	</form>
	<%
		}
		else{
	%>
	<h4><%=user_nickname %>는 사용할 수 있습니다.</h4>	
	<a href = "javascript:closeWindow()" class="btn btn-check">확인</a>
	<%
		}
	%>

<script>
	function closeWindow() {
		opener.document.Info.user_nickname.value = '<%=user_nickname%>';
		window.close();
		//self.close();
		//close();
	}
</script>

</body>
</html>