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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%
		if(user_idExist){
%>
	
	<h12><%=user_id %>는 사용할 수 없습니다.</h12>
	
	<form action="user_idCheck.dae">
		<label for = "user_id" id = "checkId">아이디 : </label>
		<input type = "text" name = "user_id" id = "user_id" style = "height: 20px; margin-top: 20px;"/>
		<input type = "submit" class="btn" id = "btn-checkId" value = "적용"/>
	</form>
	<%
		}
		else{
	%>
	<h12><%=user_id %>는 사용할 수 있습니다.</h12><Br>
	<a href = "javascript:closeWindow()" id = "a1">
	<h13>확인</h13>
	</a>
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