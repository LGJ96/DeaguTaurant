<%@page import="servicecenter.vo.OtoReplyVO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="css/set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="css/swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<%
 OtoReplyVO otoReplyVO = (OtoReplyVO)request.getAttribute("otoReplyVO");
 	int cus_oto_number = otoReplyVO.getCus_oto_number();
 	int cus_ref = otoReplyVO.getCus_ref();
 	int cus_re_step = otoReplyVO.getCus_re_step();
 	int cus_re_level = otoReplyVO.getCus_re_level();
 	String cus_oto_reply_content = otoReplyVO.getCus_oto_reply_content();
%>
<%
 	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	String user_id = (String)session.getAttribute("user_id");
	String user_pw = (String)session.getAttribute("user_pw"); 
%>
<body>
   
    
    <!-- 글쓰기 본문 -->
    <form method="post" name="oto-write" action="oto_writePro.dae" onsubmit="return writeSave()">
		<input type="hidden" name="cus_oto_number" value="<%=cus_oto_number%>">
		<input type="hidden" name="cus_ref" value="<%=cus_ref%>">
		<input type="hidden" name="cus_re_step" value="<%=cus_re_step%>">
		<input type="hidden" name="cus_re_level" value="<%=cus_re_level%>">
		<input type="hidden" name="cus_oto_reply_content" value="<%=cus_oto_reply_content%>">
		<input type="hidden" name="user_nickname" value="<%=loginUser.getUser_nickname()%>">
		   <div class="container" style = "margin-top : 50px;" align="center"  >
			 <div class="col-md-5">
	 	
		
			<%if(cus_oto_number == 0){%>
				<input type="text"  placeholder="문의 제목" name="cus_oto_title" maxlength="100" id = "qtitle" style = "width : 100">
			<%}else{%>	
				<input type="text"  placeholder="문의 제목" name="cus_oto_title" maxlength="100" id = "qtitle" style = "width : 100" value = "[답변]">
				<%}%>
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td><textarea class="form-control" placeholder="문의 내용" name="cus_oto_content" maxlength="100" style="height: 200px;"></textarea></td>
							</tr>
						</tbody>
					</table>
			</div>
					</div>
			
<!-- 글쓰기 버튼 생성 -->
	<div align="center">
 	<input type="submit" class="btn btn-warning"  value="등록">
 	<script language="javascript">
       function showConfirm1() {
          if (confirm("1:1문의를 등록하시겠습니까?")){
               alert("등록 완료.");
               opener.parent.location='serviceCenterOtoList.dae';
               window.close();
            } 
         else{
                alert("취소");
            }
          }
      </script>
    <input type="button" class="btn btn-warning"  value="취소"
 	 OnClick="window.close();">

	</div>
		

</form>
</body>
</html>