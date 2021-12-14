<%@page import="vo.UserVO"%>
<%@page import="comm.vo.CommentReplyVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="comm.vo.CommPageVO"%>
<%@page import="comm.vo.CommVO"%>
<%@page import="comm.vo.CommentPageVO"%>
<%@page import="comm.vo.CommentVO"%>
<%@page import="java.util.List"%>
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
 	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	String user_id = (String)session.getAttribute("user_id");
	String user_pw = (String)session.getAttribute("user_pw"); 
%>
<%
	CommentVO commentArticle = (CommentVO)request.getAttribute("commentArticle");
    String comment_pageNum = (String)request.getAttribute("comment_pageNum");
 %>
<%
	CommVO comArticle = (CommVO)request.getAttribute("comArticle");
    String com_pageNum = (String)request.getAttribute("com_pageNum");
 %>
<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
<%-- <%
 CommentReplyVO commentReplyVO = (CommentReplyVO)request.getAttribute("commentReplyVO");
 	int comment_number = commentReplyVO.getComment_number();
 	int comment_ref = commentReplyVO.getComment_ref();
 	int comment_re_step = commentReplyVO.getComment_re_step();
 	int comment_re_level = commentReplyVO.getComment_re_level();
%> --%>
<body>
   
    
    <!-- 글쓰기 본문 -->
    <form method="post" name="comment-update" action="comment_updatePro.dae" onsubmit="return writeSave()">
		<input type="hidden" name="comment_number" value="${commentArticle.comment_number}">
		<input type="hidden" name="comment_ref" value="${commentArticle.comment_ref}">
		<input type="hidden" name="comment_re_step" value="${commentArticle.comment_re_step}">
		<input type="hidden" name="comment_re_level" value="${commentArticle.comment_re_level}">
		<input type="hidden" name="user_nickname" value="${loginUser.user_nickname}<%=loginUser.getUser_nickname()%>">
		<input type="hidden" name="com_number" value="${commentArticle.com_number}">
		<input type="hidden" name="com_pageNum" value="${com_pageNum}">
		<input type="hidden" name="comment_pageNum" value="${comment_pageNum}">
		
		   <div class="container" style = "margin-top : 50px;" align="center"  >
			 <div class="col-md-5">
	 	
		
			
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td><textarea class="form-control" name="comment_content" maxlength="100" style="height: 80px;">${commentArticle.comment_content}</textarea></td>
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
          if (confirm1("해당 댓글을 수정하시겠습니까?")){
               alert("수정 완료.");
               opener.parent.location='comment.dae';
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