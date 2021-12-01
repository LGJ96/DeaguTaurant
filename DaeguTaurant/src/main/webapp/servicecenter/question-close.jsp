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

<body>
  	
   <table width="250" border = "1" cellspacing="0" cellpadding="0"
   align="center">
    <tr>
    <td align="center" colspan="2">
      <div>요청이 처리 되었습니다.</div> 
   </td>
   </tr>
    
<br>
  <tr>      
 <td colspan=2 " align="center"> 
  <input type="submit" style="color:black" class="btn btn-check" value = "확인" onclick="pclose1();">
  <script>
	  function pclose1(){
		opener.parent.location='../serviceCenterOtoList.dae';
	    window.close();
		}	
  </script>

</td>
</tr>
  
    
</table> 

</body>
</html>