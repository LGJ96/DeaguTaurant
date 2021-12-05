<%@page import="vo.UserVO"%>
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
   <%@include file ="/common/header-login.jsp" %> 
    <!--//END HEADER -->
     <form action="../user_pwsearchresult.dae" method = "POST" name = "pwsearch">
   
      <div class="grid">
        <h3 class="grid-header" >비밀번호 찾기</h3>
        <div class="grid-body"  style = "min-height: 400px;" >
          <div class="item-wrapper">
            <div class="row mb-3">
              <div class="col-md-8 mx-auto" id ="info-text">
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area">
                    <label for="inputType1">이름</label>
                  </div>
                  <div class="col-md-9 showcase_content_area">
                    <input type="text" class="form-control" name= "user_name" id="user_name"  placeholder="홍길동">
                    
                  </div>
                </div>
                
                <div class="form-group row showcase_row_area" style="margin-top: 30px;">
                  <div class="col-md-3 showcase_text_area" >
                    <label for="inputType12">이메일</label>
                  </div>
                  <div class="col-md-9 showcase_content_area">
                    <input type="email" class="form-control" name= "user_id" id="user_id" placeholder="aaa@000.com">
                   
                  </div>
               </div>
                <button type="submit" class="btn btn-warning btn-block" style="margin-top: 30px;" onclick="pwsearchcheck()"> 확인 </button>

              </div>
            </div>
          </div>
        </div>
      </div>
</form>
    

  <!--============================= FOOTER =============================-->
  <%@include file ="/common/footer.jsp" %>
  <!-- Footer End-->
   <script>
   function pwsearchcheck(){
 
	   var user_name = document.getElementById("user_name");
	   var user_id = document.getElementById("user_id");
		if (user_name.value == ""){
			alert("이름을 입력해주세요");
			form.user_name.focus();
			return false;
	}
		else if (user_id.value == "") {
			alert("아이디를 입력해주세요");
			form.user_id.focus();
			return false;
	}
		// 만약 값이 다 넘어왔다면 전송해줘라
		document.pwsearch.submit();
   }
   
   </script>


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