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
    <div class="dark-hg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="../home_review/index.jsp"><img src="../images/logo.png" alt="logo" /> </a>
                       
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="icon-menu"></span>
            </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                               
                                <li><a href="../login/login.jsp" class="btn btn-outline-light top-btn" id ="login-text"><span class="ti-plus"></span> 로그인</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!--//END HEADER -->
   

    <!--============================= 검색창, 검색버튼 =============================-->

    <div class="row d-flex justify-content-center"  style = "margin-bottom: 50px;">
     	
        <div class="col-md-8" align="right">
            <form class="form-wrap mt-4">
                <div class="btn-group" role="group" aria-label="Basic example">
               
                    <input type="text" placeholder="검색창" class="btn-group"/>
                    <button type="button" class="btn-form2" onclick="location.href='../home_review/search.jsp'; ">검색</button>
                    
   
           
                  	
               </div>
           </form>
        </div>
  </div>     
 <!--============================= 지역/테마 선택 =============================-->
    <div class=" dark-bg" style = "margin-bottom: 100px;">
        <div class="col-lg-12">
            <div class="row">
                <div class="container">
              		<div class = "col-xs-2"  style="float: left; margin-right: 40px;" >
              			<h3>지역</h3>
              		</div>
                
                <div class = "col-ld-12" style = "margin-top: 26px;">
                  	<input type="checkbox" id="cb1" name ="cb1">
   					<label for="cb1"  id = "t1"  style = "margin-right: 10px;" >남구</label>
   					
                    <input type="checkbox" id="cb2" name ="cb1">
   					<label for="cb2"  id = "t1" style = "margin-right: 10px;">달서구</label>
   					
   					<input type="checkbox" id="cb3" name ="cb1">
   					<label for="cb3"  id = "t1" style = "margin-right: 10px;">달성군</label>
   					
   					<input type="checkbox" id="cb4" name ="cb1">
   					<label for="cb4"  id = "t1" style = "margin-right: 10px;">동구</label>
   					
   					<input type="checkbox" id="cb5" name ="cb1">
   					<label for="cb5"  id = "t1"style = "margin-right: 10px;" >북구</label>
   					
   					<input type="checkbox" id="cb6" name ="cb1">
   					<label for="cb6"  id = "t1" style = "margin-right: 10px;">서구</label>
   					
   					<input type="checkbox" id="cb7" name ="cb1">
   					<label for="cb7"  id = "t1"style = "margin-right: 10px;" >수성구</label>
   					
   					<input type="checkbox" id="cb8" name ="cb1">
   					<label for="cb8"  id = "t1" style = "margin-right: 10px;">중구</label>
                       
                 </div>
               </div>    
                    
		     	<div class="container">
              		<div class = "col-xs-2"  style="float: left; margin-right: 40px;" >
              			<h3>테마</h3>
              		</div>
                
                <div class = "col-md-10" style = "margin-top: 20px;">
                  	<input type="checkbox" id="cb9" name ="cb1">
   					<label for="cb9"  id = "t1" >양식</label>
   					
                    <input type="checkbox" id="cb10" name ="cb1">
   					<label for="cb10"  id = "t1" >중식</label>
   					
   					<input type="checkbox" id="cb11" name ="cb1">
   					<label for="cb11"  id = "t1" >한식</label>
   					
   					<input type="checkbox" id="cb12" name ="cb1">
   					<label for="cb12"  id = "t1" >일식</label>
   					
   					<input type="checkbox" id="cb13" name ="cb1">
   					<label for="cb13"  id = "t1" >디저트</label>
                       
                 </div>
               </div>                                
                </div>
            </div>
        </div>

    <!--//지역/테마선택 END -->
    
    <!------------------ 식당 리스트 화면--------------- -->
    
    <div class="col-md-12">
      <div class="container">
   		<div class="row"  >
   		<table id=search-menu>
         <tr>
            <td >
             <img id = "img2" src ="../images/mom.jpg"/>
              <span class="point">6.5</span>
               <span class="point1">지역 : 남구</span>
               <span class="point2">테마 : 양식</span>
               <span class="point3">조회수 : 500</span>
              <br>
             	맘스터치
            </td>
         </tr>
         
      </table>
      
   		<table  id=search-menu >
         <tr>
            <td >
             <img  id = "img2" src ="../images/mom.jpg"/>
              <span class="point">9.0</span>
              <span class="point1">지역 : 남구</span>
               <span class="point2">테마 : 양식</span>
               <span class="point3">조회수 : 500</span>
              <br>
             	맘스터치dddddddddd
            </td>
            
        
         </tr>
      </table>
      
   		<table id=search-menu>
         <tr>
            <td >
             <img id = "img2" src ="../images/piz.jpg" />
             <span class="point">6.5</span>
              <span class="point1">지역 : 남구</span>
               <span class="point2">테마 : 양식</span>
               <span class="point3">조회수 : 500</span>
              <br>
             	맘치
            </td>
            
        
         </tr>
      </table>
   	</div>
  </div>
</div>


 <div class="col-md-12">
      <div class="container">
   		<div class="row"   >
   		<table id = "search-menu">
         <tr>
            <td style = "text-align: center;">
             <img id = "img2" src ="../images/to.jpg"/>
             <span class="point">6.5</span>
             <span class="point1">지역 : 남구</span>
               <span class="point2">테마 : 양식</span>
               <span class="point3">조회수 : 500</span>
              <br>
             	맘스터치
            </td>
         </tr>
      </table>
      
   		<table id = "search-menu">
         <tr>
            <td style = "text-align: center;">
             <img id = "img2" src ="../images/mom.jpg"/>
             <span class="point">6.5</span>
             <span class="point1">지역 : 남구</span>
               <span class="point2">테마 : 양식</span>
               <span class="point3">조회수 : 500</span>
              <br>
             	맘스터치dddddddddd
            </td>
            
        
         </tr>
      </table>
      
   		<table  id = "search-menu">
         <tr>
            <td >
             <img id = "img2" src ="../images/mom.jpg"/>
             <span class="point">6.5</span>
             <span class="point1">지역 : 남구</span>
               <span class="point2">테마 : 양식</span>
               <span class="point3">조회수 : 500</span>
              <br>
             	맘치
            </td>
            
        
         </tr>
      </table>
   	</div>
  </div>
</div>

  <!--============================= FOOTER =============================-->
    <footer>
       <!-- Footer Start-->
       <div class="main-block dark-bg ">
           <div class="container">
               <div class="row d-flex justify-content-between">
               
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                      <div class="copyright mb-30">
                         <!-- logo -->
                           <a href="../home_review/index.jsp"><img src="../images/logo.png" alt="logo"></a>
                      
                         <div class="footer-pera">
                              <p><script>document.write(new Date().getFullYear());</script> 대구토랑 | 2021-12-16 </p>
                         </div>
                      </div>
                   </div>
                   
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h6>제작자</h6>
                               <ul id = "footer-maker">
                                   <li >김수빈</li>
                                   <li>박태림</li>
                                   <li>이광준</li>
                                   <li>장용성</li>
                               </ul>
                           </div>
                       </div>
                   </div>
                  
                   <div class="col-xl-3 col-lg-3 col-md-4  col-sm-5">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h6>찾아오시는 길</h6>
                               <ul id = "footer-maker" >
                                   <li>대구 수성구 알파시티</li>
                                   <li>스마트융합인재개발원</li>
                               </ul>
                             
                            </div>
                       </div>
                    </div>
                           
                     <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                          	 <a href="../servicecenter/servicecenter.jsp" target="_blank">고객센터</a>
                               <ul id = "footer-maker" >
                                   <li>공지사항</li>
                                   <li>FAQ</li>
                                   <li>1:1문의</li>
                               </ul>
                           
                                
                           </div>
                       </div>
                   </div>
                       </div>
                   </div>
               </div>
       <!-- Footer End-->
   </footer>





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

</body>
</html>