<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
 <!--  이미지 수정 ....(x)-->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>

<body>
    <!--============================= HEADER =============================-->
     <%@include file ="/common/header.jsp" %>
    <!--//END HEADER -->
    	<form action="${pageContext.request.contextPath }/rest_UpdatePro.dae" method="POST" name = "updateform" onsubmit="return writeSave()">
    	   
            <input type="hidden" name="res_id" value="${restarticle.getRes_id()}">
<%-- 			<input type="hidden" name="res_pic" value="${restarticle.getRes_pic() }">
 --%>		 	
    <div class="col-lg-12">
      <div class="grid">
        <h3 class="grid-header">식당등록</h3>
        <div class="grid-body">
          <div class="item-wrapper">
            <div class="row mb-3">
              <div class="col-md-8 mx-auto" id ="info-text">
              
              
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">식당이름</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <input type="text" class="form-control" name="res_name" id="res_name" value="${restarticle.getRes_name() }">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">지역</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <input type="text" class="form-control" name="res_Addr1" id="res_Addr1" value="${restarticle.getRes_Addr1()}">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">테마</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <input type="text" class="form-control" name="res_category" id="res_category" value="${restarticle.getRes_category() }">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">메인메뉴</label>
                  </div>
                 <div class="col-md-6 showcase_content_area">
                    <textarea class="form-control" name="res_mainmenu" id="res_mainmenu" maxlength="1000" style="height: 100px;">
                    ${restarticle.getRes_mainmenu()}</textarea>
                  </div>
                </div>
                
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">전화번호</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <input type="text" class="form-control" name="res_number" id="res_number" value="${restarticle.getRes_number() }">
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType12">주소</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <input type="text" class="form-control" name="res_Addr2" id="res_Addr2" value="${restarticle.getRes_Addr2() }">
                  </div>

                  <div class="col-md-1 showcase_content_area">
                   <button type="submit" class="btn btn-check" > 우편번호 검색 </button>
                  </div>
                </div>
               <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">영업시간</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <input type="text" class="form-control" name="res_hours" id="res_hours" value="${restarticle.getRes_hours() }">
                  </div>
                </div>

               
               <%--   <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">이미지</label>
                  </div>
                  <div class="col-md-5 showcase_content_area">
                    <div style = "border: 1px solid #dddddd "> 
						<input type="file" name="res_pic" id="res_pic" accept="image/*" value="${restarticle.getRes_pic() }">
						<input type="file" name="res_pic1" id="res_pic1" accept="image/*">
					</div>
                  </div>
                </div>  --%>
                
               <div align="center">
 				<input type="submit" class="btn btn-warning"  value="수정" >
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