<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
 <%@page import="java.util.*" %>





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
     <%@include file ="/common/header-content.jsp" %>
    <!--//END HEADER -->
   <form action="../rest_Regist.dae" method="POST" name = "registform" enctype = "multipart/form-data">
    	
    	
    <div class="col-lg-12">
      <div class="grid">
        <h3 class="grid-header">식당등록</h3>
        <div class="grid-body">
          <div class="item-wrapper">
            <div class="row mb-3">
              <div class="col-md-8 mx-auto" id ="info-text">
              
      	
            
            <input type="hidden" name="res_id" value="${replyVO.res_id }">
			<input type="hidden" name="res_ref" value="${replyVO.res_ref }">
			<input type="hidden" name="res_re_step" value="${replyVO.res_re_step }">
		
              
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">식당이름</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <input type="text" class="form-control" name="res_name" id="res_name">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">지역</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <input type="text" class="form-control" name="res_Addr1" id="res_Addr1">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">테마</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <input type="text" class="form-control" name="res_category" id="res_category">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">메인메뉴</label>
                  </div>
                 <div class="col-md-6 showcase_content_area">
                    <textarea class="form-control" placeholder="메뉴" name="res_mainmenu" id="res_mainmenu" maxlength="1000" style="height: 100px;"></textarea>
                  </div>
                </div>
                
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">전화번호</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <input type="text" class="form-control" name="res_number" id="res_number">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType12">주소</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <input type="text" class="form-control" name="res_Addr2" id="res_Addr2">
                  </div>

                </div>
               <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">영업시간</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <input type="text" class="form-control" name="res_hours" id="res_hours">
                  </div>
                </div>

               
                 <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">이미지</label>
                  </div>
                  <div class="col-md-6 showcase_content_area">
                    <div style = "border: 1px solid #dddddd "> 
						
						<input type="file"  name="res_pic" id="res_pic" accept="image/*">
					
					</div>
                  </div>
                </div> 
                
               <div align="center">
 				<input type="submit" class="btn btn-warning"  value="등록" >
				<button class="btn btn-warning" > 취소</button>
			   </div>
             
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

             </form>

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
            slidesPerView: 2,
            slidesPerGroup: 2,
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