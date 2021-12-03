<%@page import="servicecenter.vo.NoticeReplyVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
 NoticeReplyVO noticeReplyVO = (NoticeReplyVO)request.getAttribute("noticeReplyVO");
 	int cus_notice_number = noticeReplyVO.getCus_notice_number();
 %>
<body>
    <!--============================= HEADER =============================-->
    <%@include file ="/common/header.jsp" %>
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
                         <h2>공지사항 등록</h2>
                       
                    </div>
                </div>
            </div>
         </div>
      </div>
   </div>
</div>
        
    
    <!--//END 커뮤니티 헤더 -->

  <!-- 글쓰기 본문 -->
 
    
   <div class="container" style = "margin-top : 50px;" >
	 <div class="col-lg-12">
	 	<form method="post" name="notice-write" action="notice_writePro.dae" onsubmit="return writeSave()">
		<input type="hidden" name="cus_notice_number" value="<%=cus_notice_number%>">
		
	 
		
<table>
		<div style = "border: 1px solid #dddddd " >
		
			
	       <input type="text" placeholder="글 제목" name="cus_notice_title" maxlength="100" id = "qtitle"></td>
	       
		
		
		</div>
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td>
							<textarea class="form-control" placeholder="글 내용" name="cus_notice_content" maxlength="2048" style="height: 350px;"></textarea>
							</td>
						</tr>
					</tbody>
				
				
		
  </table>
 
<!-- 글쓰기 버튼 생성 -->
	<div align="center">
 	<input type="submit" class="btn btn-warning"  value="등록" />
	<input type="button" class="btn btn-warning"  value="취소"
 	 OnClick="window.location='serviceCenterList.dae'">
	</div>
  </table>
 
</form>
</div>
</div>



    <!--============================= FOOTER =============================-->
    <footer>
       <!-- Footer Start-->
       <%@include file ="/common/footer-home.jsp" %>
       <!-- Footer End-->
   </footer>



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
    <script>
        if ($('.image-link').length) {
            $('.image-link').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
        if ($('.image-link2').length) {
            $('.image-link2').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
    </script>

</body>
</html>