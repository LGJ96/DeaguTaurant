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
     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    <!-- Page Title -->
   <title>DaeguTaruant</title>
    
</head>

<body>
  	
 
  <div align="center">
   <h14>삭제 되었습니다.</h14> 
  </div>
<br>

    

<div align="center" >
  <input type="submit" id = "question-check" class="btn" value = "확인" onclick="pclose1();">
</div>
  <script>
  
	  function pclose1(){
		opener.parent.location='../serviceCenterOtoList.dae';
	    window.close();
	}	
	  
  </script>

  
    

</body>
</html>