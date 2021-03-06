<%@page import="comm.vo.CommReplyVO"%>
<%@page import="comm.vo.CommVO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
	CommVO comArticle = (CommVO)request.getAttribute("comArticle");
    String com_pageNum = (String)request.getAttribute("com_pageNum");
 %>

 
<body>
    <!--============================= HEADER =============================-->
    <%@include file ="/common/header-content.jsp" %>
    <!--//END HEADER -->
    
    
    <!--============================= 커뮤니티 헤더 =============================-->
    <div>
        <!-- Swiper -->
        <div class="row d-flex justify-content-center">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                         <div class="dark-cbg">
                         <h2>커뮤니티 - 글수정</h2>
                       
                    </div>
                </div>
            </div>
        </div>
     </div>
  </div>
</div>
        
    
    <!--//END 커뮤니티 헤더 -->
    
    <!-- 글쓰기 본문 -->
    
		<form method="post" name = "comm-update" action="comm_updatePro.dae" onsubmit="return writeSave()" enctype="multipart/form-data">
		<input type="hidden" name="com_number" value="<%=comArticle.getCom_number()%>">
		<input type="hidden" name="com_pageNum" value="<%=com_pageNum%>">
		<input type="hidden" name="user_nickname" value="${loginUser.user_nickname}<%-- <%=loginUser.getUser_nickname()%> --%>">
    <div class="container" style = "margin-top : 50px;" >
	 <div class="col-lg-12">
		<select name = "com_subject" title ="말머리" id = "content-head" class = "col-lg-3" >
			<c:if test="${ '자유' eq comArticle.com_subject }">
			<option value = "자유" > 자유 </option>
			<option value = "정보" > 정보 </option>
			</c:if>
			<c:if test="${ '정보' eq comArticle.com_subject }">
			<option value = "정보" > 정보 </option>
			<option value = "자유" > 자유 </option>
			</c:if>
			<%-- <option value = "정보"> <c:if test="${ '정보' eq comArticle.com_subject }"></c:if> 정보 </option> --%>
		</select>
	
		<input type="text"  placeholder="글 제목" name="com_title" maxlength="100" id = "title"
		value = "<%=comArticle.getCom_title()%>">

			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="com_content" maxlength="2048" style="height: 350px;"><%=comArticle.getCom_content()%></textarea></td>
						</tr>
					</tbody>
				</table>
				
				<div style = "border: 1px solid #dddddd "> 
				<input type="file" name="com_pic" id="com_pic" accept="image/*">
				</div>
			</div>
			</div>
<!-- 글쓰기 버튼 생성 -->
	<div align="center">
 	<input type="submit" class="btn btn-warning"  value="등록" >
	<input type="button" class="btn btn-warning"  value="취소"
 	 OnClick="window.location='commList.dae'">

	</div>
	</form>
		
      <!--============================= FOOTER =============================-->
	<%@include file ="/common/footer.jsp" %>
	<!-- Footer End-->


    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="js/swiper.min.js"></script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>
</body>
</html>