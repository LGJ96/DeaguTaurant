<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "servicecenter.vo.OtoPageVO"%>
<%@ page import = "servicecenter.vo.OtoVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<head>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    <!-- Page Title -->
   <title>DaeguTaruant</title>
    
</head>
<%
	int cus_oto_number = (int)request.getAttribute("cus_oto_number");
	String oto_pageNum = (String)request.getAttribute("oto_pageNum");
%>
<body>
  	<form method="post" name="oto-delete" action="oto_deletePro.dae" onsubmit="return writeSave()">
	<input type="hidden" name="cus_oto_number" value="<%=cus_oto_number%>">
	<input type="hidden" name="oto_pageNum" value="<%=oto_pageNum%>">
   	<div align="center">
    
      <h14>삭제하시겠습니까?</h14> 
  </div>
    
<br>
 	<div align="center">
  <input type="submit" id ="otodelete" class="btn" value = "삭제" onclick="pclose1();">
 
  <input onclick="window.close();" type="button"  id = "otodelete" class="btn" value = "취소">
</div>
  

</form>

</body>

 <script>
	  function pclose1(){
	    opener.location.reload(10);
	}	
  </script>
  
</html>