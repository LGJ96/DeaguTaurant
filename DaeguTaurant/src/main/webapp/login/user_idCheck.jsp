<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%


	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	String user_id = (String)session.getAttribute("user_id");
	boolean user_idExist = (boolean)session.getAttribute("user_idExist");
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
		if(user_idExist){
	%>
	<h4><%=user_id %>는 사용할 수 없습니다.</h4>
	
	<form action="user_idCheck.dae">
		<label for = "user_id">아이디 : </label>
		<input type = "text" name = "user_id" id = "user_id"/><br>
		<input type = "submit" class="btn btn-check"  value = "적용"/>
	</form>
	<%
		}
		else{
	%>
	<h4><%=user_id %>는 사용할 수 있습니다.</h4>	
	<a href = "javascript:closeWindow()" class="btn btn-check">확인</a>
	<%
		}
	%>

<script>
	function closeWindow() {
		opener.document.Info.user_id.value = '<%=user_id%>';
		window.close();
		//self.close();
		//close();
	}
</script>

</body>
</html>