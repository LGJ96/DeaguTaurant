<%@page import="servicecenter.vo.FaqVO" %>
<%@page import="servicecenter.vo.FaqReplyVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
   FaqVO faqArticle = (FaqVO)request.getAttribute("faqArticle");
   String faq_pageNum = (String)request.getAttribute("faq_pageNum");
%>

<body>
    <!--============================= HEADER =============================-->
    <%@include file ="/common/header-servicecenter.jsp" %>
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
                         <h2>FAQ 수정</h2>
                       
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
	 	<form method="post" name="faq-write" action="faq_updatePro.dae" onsubmit="return writeSave()">
		<input type="hidden" name="cus_faq_number" value="<%=faqArticle.getCus_faq_number()%>">
		<input type="hidden" name="faq_pageNum" value="<%=faq_pageNum%>">
		
	 
		
<table>
		<div style = "border: 1px solid #dddddd " >
		
			
	       <input type="text" placeholder="글 제목" name="cus_faq_title" maxlength="100" id = "qtitle"
	       value = "<%=faqArticle.getCus_faq_title()%>"></td>
	       
		
		
		</div>
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td>
							<textarea class="form-control" placeholder="글 내용" name="cus_faq_content" maxlength="2048" style="height: 350px;"><%=faqArticle.getCus_faq_content()%></textarea>
							</td>
						</tr>
					</tbody>
				
				
		
  </table>
 
<!-- 글쓰기 버튼 생성 -->
	<div align="center">
 	<input type="submit" class="btn btn-warning"  value="등록" />
 	<input type="button" class="btn btn-warning"  value="취소"
 	 OnClick="window.location='serviceCenterFaqList.dae'">
	</div>
  </table>
 
</form>
</div>
</div>



    <!--============================= FOOTER =============================-->
    <footer>
      <%@include file ="/common/footer-home.jsp" %>
   </footer>
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