<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
	String user_id = (String)session.getAttribute("user_id");
	
%>
<!DOCTYPE html>
<html>
<head>

     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
 
</head>

<body>  

<script type="text/javascript">
		function checkform() {
			if ( document.user_pw.user_pw.value == "") {    //document.(form name).(input name).value
				alert("비밀번호를 입력해주세요")
				form.user_pw.focus();
				return false;                                //그 다음 화면으로 안넘어가게 - type이 버튼일 경우 가능
			}
			else{
				document.user_pw.submit();                   // 입력하고 확인버튼을 눌렀다면 user_infoDeletePro.dae로 전송해줘라
			}
		}
	</script>
<form name="user_pw" method="post" action="user_infoDeletePro.dae"  >
<input type="hidden" name="user_id" value="<%=user_id%>">
<div class="col-lg-12">
 <div align="center">
 <h11>회원 탈퇴</h11>
<br>
<div class="grid-body" >
 <div class="row mb-3" >
 	
		<div class="form-group row showcase_row_area" >
  			<div class="col-md-5 showcase_text_area" id ="pw_delete">
    			<label for = "user_pw" >비밀번호 </label>
  			</div>
  			<div class="col-md-3 showcase_content_area" id = "pw_delete_input">
     			<input type="password"  size=15 maxlength="12" name="user_pw"> 
  			</div>
		</div>
</div>
</div>

<input type="button" value="확인" id="deletebutton" onclick="checkform()"> 
<input type="submit" id = "deleteButton" value="취소" onclick="window.close();">
</div>
</div>
</div>
</form>
 

 
   
</body>
</html>      
