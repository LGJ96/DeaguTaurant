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
    <!--============================= HEADER(로고, 로그인 버튼) =============================-->
    <div class="nav-menu">
        <div class="bg transition">
            <div class="container-fluid fixed">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="../home_review/index.jsp"><img src="../images/logo.png" alt="logo" /> </a>

                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-menu"></span>
              </button>
                            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                <ul class="navbar-nav" >         
                                    <li><a href="../login/login.jsp" class="btn btn-outline-light top-btn" id = "login-text"><span class="ti-plus" ></span> 로그인</a></li>
                                    <li><a href="../mypage/mypage.jsp" class="btn btn-outline-light top-btn" id = "login-text">둘리</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SLIDER(대구 식당 소개 제목 창 & 검색 창 & 지역/테마, 커뮤니티 버튼) --> 
       <section class="slider d-flex align-items-center">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    <div class="slider-title_box">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="slider-content_wrap">
                                    <h1>대구의 식당 소개</h1>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                                <form class="form-wrap mt-4">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <input type="text" placeholder="검색창" class="btn-group">
                                     
                                        <button type="button" class="btn-form1" onclick="location.href='../home_review/search.jsp'; ">SEARCH</button>
                                    </div>
                                </form>
                                
                                <div class="slider-link">
                                
                                    <a href="../home_review/search.jsp">지역/테마</a>
                                    <span> </span> 
                                    <a href="../comm/comm.jsp">커뮤니티</a>
                                    
                                    <%
										// 로그인 하지 않았을 때 보여지는 화면
											if(userID == null){
									%>
									
         	                        <!-- alert(로그인을 먼저 해주세요) -->
         	                        
         	                        <%
									// 로그인이 되어 있는 상태에서 보여주는 화면
										}else{
									%>
									
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--// SLIDER -->
    <!--//END HEADER -->

<!--============================= FEATURED PLACES =============================-->
 
	<div class = "container" align="right" style = "margin-top: 20px;">
	 <button class="btn" onclick="location.href='../home_review/restaurant_register.jsp';" > 식당 등록</button>
	</div>
    <section class="main-block1 light-bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="styled-heading">
                        <h3>Featured Places</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
                        <a href="detail.jsp">
                            <img src="../images/featured1.jpg" class="img-fluid" alt="#">
                            <span class="featured-rating-orange">6.5</span>
                            <div class="featured-title-box">
                                <h6>Burger & Lobster</h6>
                                <p>Restaurant </p> <span>• </span>
                                <p>3 Reviews</p> <span> • </span>
                                <p><span>$$$</span>$$</p>
                                <ul>
                                    <li><span class="icon-location-pin"></span>
                                        <p>1301 Avenue, Brooklyn, NY 11230</p>
                                    </li>
                                    <li><span class="icon-screen-smartphone"></span>
                                        <p>+44 20 7336 8898</p>
                                    </li>
                                    <li><span class="icon-link"></span>
                                        <p>https://burgerandlobster.com</p>
                                    </li>

                                </ul>
                                <div class="bottom-icons">
                                    <div class="closed-now">CLOSED NOW</div>
                                    <span class="ti-heart"></span>
                                    <span class="ti-bookmark"></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
                        <a href="detail.jsp">
                            <img src="../images/featured2.jpg" class="img-fluid" alt="#">
                            <span class="featured-rating-green">9.5</span>
                            <div class="featured-title-box">
                                <h6>Joe’s Shanghai</h6>
                                <p>Restaurant </p> <span>• </span>
                                <p>3 Reviews</p> <span> • </span>
                                <p><span>$$$</span>$$</p>
                                <ul>
                                    <li><span class="icon-location-pin"></span>
                                        <p>1301 Avenue, Brooklyn, NY 11230</p>
                                    </li>
                                    <li><span class="icon-screen-smartphone"></span>
                                        <p>+44 20 7336 8898</p>
                                    </li>
                                    <li><span class="icon-link"></span>
                                        <p>https://burgerandlobster.com</p>
                                    </li>

                                </ul>
                                <div class="bottom-icons">
                                    <div class="closed-now">CLOSED NOW</div>
                                    <span class="ti-heart"></span>
                                    <span class="ti-bookmark"></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
                        <a href="detail.jsp">
                            <img src="../images/featured3.jpg" class="img-fluid" alt="#">
                            <span class="featured-rating">3.2</span>
                            <div class="featured-title-box">
                                <h6>Tasty Hand-Pulled Noodles</h6>
                                <p>Restaurant </p> <span>• </span>
                                <p>3 Reviews</p> <span> • </span>
                                <p><span>$$$</span>$$</p>
                                <ul>
                                    <li><span class="icon-location-pin"></span>
                                        <p>1301 Avenue, Brooklyn, NY 11230</p>
                                    </li>
                                    <li><span class="icon-screen-smartphone"></span>
                                        <p>+44 20 7336 8898</p>
                                    </li>
                                    <li><span class="icon-link"></span>
                                        <p>https://burgerandlobster.com</p>
                                    </li>

                                </ul>
                                <div class="bottom-icons">
                                    <div class="open-now">OPEN NOW</div>
                                    <span class="ti-heart"></span>
                                    <span class="ti-bookmark"></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
           
        </div>
    </section>
    
    <hr width = "60%" color = "#ccc">
    
    
    <!--  best 새로운 식당 표 -->
    
   <section class="main-block">
   <div class = "row">
   <div class= "container">
    <div class="card-body" >
    <div class="col-md-6" style="float: left;">
    <table class="table" style="margin-top:40px;">
      <thead  class="bg-warning text-white">
        <tr>
            <th colspan="1">번호</th>
            <th align="rigth" colspan="4" style = "text-align: center;" > 추천 글</th>
          
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td colspan="4">제목 길게 하세요</td>
          
        </tr>
        <tr>
          <th scope="row">2</th>
          <td colspan="4">Mark</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td colspan="4">Mark</td>
        </tr>
        <tr>
          <th scope="row">4</th>
          <td colspan="4">Mark</td>
        </tr>
        <tr>
          <th scope="row">5</th>
          <td colspan="4">Mark</td>
        </tr>
      </tbody>
    </table>
    </div>
</div>


<div class="card-body"  >
 
    <div class="col-md-6" style="float: left;">
    <table class="table">
      <thead  class="bg-warning text-white">
        <tr>
            <th colspan="1">번호</th>
            <th align="right" colspan="4" style = "text-align: center;" > Best 글</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td colspan="4">제목 길게 하세요 제발</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td colspan="4">Mark</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td colspan="4">Mark</td>
          <tr>
          <th scope="row">4</th>
          <td colspan="4">Mark</td>
        </tr>
        <tr>
          <th scope="row">5</th>
          <td colspan="4">Mark</td>
        </tr>
       
      </tbody>
    </table>
    </div>
    </div>
    </div>
    </div>
   
</section>
 
    
    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <script>
        $(window).scroll(function() {
            // 100 = The point you would like to fade the nav in.

            if ($(window).scrollTop() > 100) {

                $('.fixed').addClass('is-sticky');

            } else {

                $('.fixed').removeClass('is-sticky');

            };
        });
    </script>
</body>
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
       
   </footer>
<!-- Footer End-->
</html>