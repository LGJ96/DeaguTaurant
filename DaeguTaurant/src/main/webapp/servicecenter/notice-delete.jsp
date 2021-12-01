<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "servicecenter.vo.PageVO"%>
<%@ page import = "servicecenter.vo.NoticeVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="#">
    <meta name="keywords" content="#">
    <!-- Favicons -->
    <link rel="shortcut icon" href="#">
    <!-- Page Title -->
   <title>DaeguTaruant</title>
    
</head>
<%
	int cus_notice_number = (int)request.getAttribute("cus_notice_number");
	String pageNum = (String)request.getAttribute("pageNum");
%>
<body>
  	<form method="post" name="notice-delete" action="notice_deletePro.dae" onsubmit="return writeSave()">
	<input type="hidden" name="cus_notice_number" value="<%=cus_notice_number%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
   <table width="250" border = "1" cellspacing="0" cellpadding="0"
   align="center">
    <tr>
    <td align="center" colspan="2">
      <div>삭제하시겠습니까?</div> 
   </td>
   </tr>
    
<br>
  <tr>      
 <td colspan=2 " align="center"> 
  <input type="submit" style="color:black" class="btn btn-check" value = "삭제" onclick="pclose1();">
  <script>
	  function pclose1(){
	    opener.location.reload(10);
		}	
  </script>
  <input onclick="window.close();" type="button"  style="color:black" class="btn btn-check" value = "취소">
</td>
</tr>
  
    
</table> 
</form>

</body>
</html>