<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="vo.UserVO"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div align="center">
	<h10>비밀번호 변경하기</h10>
	
	<form action="#" method="POST" name = "pwUpdate" id = "pwUpdate" >
	 <div class="form-group row showcase_row_area"  >
	 	
	 	 
		 <div class="col-md-3 showcase_text_area" id = "updatePw" >
            <label for="inputType1">새 비밀번호</label>
         </div>
         <div class="col-md-9 showcase_text_area"  id = "updatePw" >
        	<input type = "password" name = "user_pw1" id = "user_pw1"/><br>
         </div>
	
       </div>
        <div class="form-group row showcase_row_area"  >
       		<div class="col-md-2 showcase_text_area" id = "updatePw" >
            	<label for="inputType1">비밀번호 확인</label>
        	</div>

        	<div class="col-md-2 showcase_text_area" id = "updatePw" >
				<input type = "password" name = "user_pw2" id = "user_pw2"/><br>
			</div>
		</div>
	</form>
		<input type = "submit" value = "적용" name= "update1" id = "update1" onclick="pwUpdate1(); ">  
		

	
	
 <script >		
 
      function pwUpdate1() {
   
        var user_pw1 = document.getElementById("user_pw1");
        var user_pw2 = document.getElementById("user_pw2");
      
        
      	if (user_pw1.value == ""){
           alert("비밀번호를 입력해주세요");
         	form.user_pw1.focus();
         return false;
      }
      
        else if (user_pw2.value == ""){
          alert("비밀번호를 한번 더 입력해주세요");
          form.user_pw2.focus();
        return false; 
     }                              
        else if(user_pw1.value != user_pw2.value){
      	  alert("비밀번호가 일치하지 않습니다.");
         form.user_pw1.focus();
          form.user_pw2.focus();
        return false;
   	}
      
        else {
        	alert('변경 되었습니다.');
      	document.pwUpdate.target = "${pageContext.request.contextPath }/mypage/mypage.jsp";
      	document.pwUpdate.action="${pageContext.request.contextPath }/userPw_UpdatePro.dae";
     	document.pwUpdate.submit();
     	
        self.close();
   
        }
  }
     
  
	</script>
</div>
</body>
</html>