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
  
   <form action="../userRegist.dae" method = "POST" name = "Info">
    <div class="col-lg-12">
      <div class="grid" >
        <h3 class="grid-header">회원가입</h3>
         
        
       <div class="grid-body" >
          <div class="item-wrapper" >
            <div class="row mb-3" >
              <div class="col-md-8 mx-auto" id ="info-text" >
                <div class="form-group row showcase_row_area"  >
                  <div class="col-md-3 showcase_text_area"  id = "Info-info" >
                    <label for="inputType1">이름</label>
                  </div>
                  <div class="col-md-9 showcase_content_area" id = "Info-input" >
                    <input type="text" class="form-control" name = "user_name" id="user_name">
                  </div>
                </div>
                
                 <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area" id = "Info-info">
                    <label for="inputType12">닉네임</label>
                  </div>
                  <div class="col-md-7 showcase_content_area" id = "Info-content">
                    <input type="text" class="form-control"  name = "user_nickname" id="user_nickname" >
                  </div>

                  <div class="col-md-2 showcase_content_area" id = "Info-check">
                  <button type="button" class="btn btn-check" onclick="checkUserNickname()" > 중복확인 </button>
             	 <input type="hidden" name="NickNameCheckResult" id="NickNameCheckResult" value="0"/>
                  </div>
                </div>
                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area" id = "Info-info"> 
                    <label for="inputType13" >이메일</label>
                  </div>
                  <div class="col-md-7 showcase_content_area" id = "Info-content"> 
                    <input type="email" class="form-control" name = "user_id"  id = "user_id" > 
                  </div>
                  <div class="col-md-2 showcase_content_area" id = "Info-check">
                 <!-- <input type = "button" class="btn btn-check" value = "아이디 중복체크" onclick="checkUserId()"/>  -->
              	<button type="button" class="btn btn-check"  onclick="checkUserId()" > 중복확인 </button>  
              	<input type="hidden" name="idCheckResult" id="idCheckResult" value="0"/>
                   </div>
                </div>

                <div class="form-group row showcase_row_area">
                  <div class="col-md-3 showcase_text_area" id = "Info-info">
                    <label for="inputType1">비밀번호</label>
                  </div>

                  <div class="col-md-9 showcase_content_area" id = "Info-input">
                    <input type="password" class="form-control"  name = "user_pw" id = "user_pw1" >
                  </div>
                </div>

                <div class="form-group row showcase_row_area" >
                  <div class="col-md-3 showcase_text_area" id = "Info-info">
                    <label for="text">비밀번호 확인</label>
                  </div>

                  <div class="col-md-9 showcase_content_area" id = "Info-input">
                    <input type="password" class="form-control" name = "user_pw" id = "user_pw2" onblur = "checkPassword()">
                    <span id = "errorMessage"></span>
                  </div>
                </div>

                
                <button type="button" class="btn btn-warning btn-block" style="margin-top: 30px;" onclick="checkInfo()"> 가입하기 </button>
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
    
    <script>
	function checkUserId(){
		//var user_id = document.login/Info.user_id;
		var user_id = document.getElementById("user_id");
		//alert(user_id.value);
		
		 window.open("../user_idCheck.dae?user_id=" + user_id.value , "user_idCheckWindow",
		"width=400,height=200");
		 /* 중복검사하면 값이 1로바뀜 */
		 var idCheckResult = document.getElementById("idCheckResult");
		 var NickNameCheckResult = document.getElementById("NickNameCheckResult");
		 
		 
		 if(idCheckResult.value=="0"){
			 idCheckResult.value="1";
		 }
		 
		 if(NickNameCheckResult.value=="0"){
			 NickNameCheckResult.value="1";
		 }
			
	}
	
	function checkUserNickname(){
		//var user_id = document.login/Info.user_id;
		var user_nickname = document.getElementById("user_nickname");
		//alert(user_id.value);
		
		 window.open("../user_nicknameCheck.dae?user_nickname=" + user_nickname.value , "user_nicknameCheckWindow",
		"width=400,height=200");
			
	}
	
	/* 비밀번호 일치 */
	 function checkPassword(){
		
		var user_pw1 = document.getElementById("user_pw1");
		var user_pw2 = document.getElementById("user_pw2");
		var errorMessage = document.getElementById("errorMessage");
		
		if(user_pw1.value != user_pw2.value){
			errorMessage.innerHTML = "<font color ='red'>비밀번호가 일치하지 않습니다!</font>";
		}
		 else if(user_pw1.value==""&&user_pw2.value==""){
			errorMessage.innerHTML = "";
		} 
		else {
			errorMessage.innerHTML = "<font color ='green'>비밀번호가 일치합니다!</font>";
		}
		
	} 
	
	/* 미입력시 안넘어가도록 */
	function checkInfo(){
		var user_name = document.getElementById("user_name");
		var user_nickname = document.getElementById("user_nickname");
		var user_id = document.getElementById("user_id");
		var user_pw1 = document.getElementById("user_pw1");
		var user_pw2 = document.getElementById("user_pw2");
		var idCheckResult = document.getElementById("idCheckResult");

		
		if (user_name.value == ""){
			alert("이름을 입력해주세요");
			form.user_name.focus();
			return false;
	}
		else if (user_nickname.value == ""){
			alert("닉네임을 입력해주세요");
			form.user_nickname.focus();
			return false;
	}
		else if(NickNameCheckResult.value=="0"){
			alert("닉네임 중복확인을 반드시 해주세요");
			form.NickNameCheckResult.focus();
			return false;
		}
		
		else if (user_id.value == "") {
			alert("아이디를 입력해주세요");
			form.user_id.focus();
			return false;
	}	
	
		else if(idCheckResult.value=="0"){
			alert("아이디 중복확인을 반드시 해주세요");
			form.idCheckResult.focus();
			return false;
		}
		
		else if (user_pw1.value == ""){
				alert("비밀번호를 입력해주세요");
				form.user_pw1.focus();
				return false;
	}
		else if (user_pw2.value == ""){
			alert("비밀번호를 한번 더 입력해주세요");
			form.user_pw2.focus();
			return false;
	}
		if(user_pw1.value != user_pw2.value){
			form.user_pw1.focus();
			form.user_pw2.focus();
			return false;
		}
		 
		
		// 만약 값이 다 넘어왔다면 전송해줘라
		document.Info.submit();
	}
	
	</script>
	
	
    
    
    
    

</body>
</html>