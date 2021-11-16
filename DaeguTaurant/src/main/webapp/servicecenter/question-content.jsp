<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="../css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="../css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="../css/set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="../css/swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <!--============================= HEADER =============================-->
   <%@include file ="/common/header.jsp" %>
    <!--//END HEADER -->
    
    <!--============================= 1:1문의 내용 헤더 =============================-->
    <div>
        <!-- Swiper -->
        <div class="row d-flex justify-content-center">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                         <div class="dark-cbg">
                         <h2>1:1 문의 내용</h2>
                       
                    </div>
                </div>
            </div>
        
    
    <!--//END 1:1문의 내용 헤더 -->

    
    <!-- 글쓰기 본문 -->
    
   <div class="container" >
    <div class="col-lg-12" align="right">
	
	 <a href="../comm/comm.jsp"><button class="btn btn-warning1" > 삭제</button></a>
	</div>
	 <div class="col-lg-12">
		<form method="post" action="writeAction.jsp">
		
		<div style = "border: 1px solid #dddddd " >
	
		<input type="text"  placeholder="글 제목" name="bbsTitle" maxlength="100" id = "qtitle">
		</div>
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				</form>
			<div class="col-lg-12">
               
			</div>
		</div>
		
	<!-- 목록 버튼 -->	
 
	<div class="col-lg-12" align="right">
	 <a href="../mypage/mypage.jsp"><button class="btn btn-warning" > 목록</button></a>
	<button type="submit" class="btn" onclick="location.href='../servicecenter/center-write.jsp';"> 답변 등록 </button>
                 
	</div>
	
	
	</div>
	
	</div>
	</div>

</body>		
   <!--============================= FOOTER =============================-->
    <%@include file ="/common/footer.jsp" %>
   <!-- Footer End-->
   

 


    




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src="../js/jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="../js/swiper.min.js"></script>
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