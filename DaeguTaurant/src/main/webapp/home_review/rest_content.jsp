<%@page import="vo.RestVO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//RestVO restVO = (RestVO)session.getAttribute("restVO");
%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Colorlib">
<meta name="description" content="#">
<meta name="keywords" content="#">
<!-- Favicons -->
<link rel="shortcut icon" href="#">
<!-- Page Title -->
<title>DaeguTaurant</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
	rel="stylesheet">
<!-- Simple line Icon -->
<link rel="stylesheet" href="./css/simple-line-icons.css">
<!-- Themify Icon -->
<link rel="stylesheet" href="./css/themify-icons.css">
<!-- Hover Effects -->
<link rel="stylesheet" href="./css/set1.css">
<!-- Swipper Slider -->
<link rel="stylesheet" href="./css/swiper.min.css">
<!-- Magnific Popup CSS -->
<link rel="stylesheet" href="./css/magnific-popup.css">
<!-- Main CSS -->
<link rel="stylesheet" href="./css/style.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css' />

</head>

<style>
.inner-star::before {
	color: #FF9600;
}

.outer-star {
	position: relative;
	display: inline-block;
	color: #CCCCCC;
}

.inner-star {
	position: absolute;
	left: 0;
	top: 0;
	width: 0%;
	overflow: hidden;
	white-space: nowrap;
}

.outer-star::before, .inner-star::before {
	content: '\f005 \f005 \f005 \f005 \f005';
	font-family: 'Font Awesome 5 free';
	font-weight: 900;
}
</style>

<body>
	<!--============================= HEADER =============================-->
	 <%@include file ="/common/header-content.jsp" %> 
    <!--//END HEADER -->


	<!--============================= BOOKING =============================-->
	<div>
		<!-- Swiper -->

		<div class="swiper-container">

			<div class="swiper-wrapper" style="width: 100%; height: 400px;">

			 	 <div class="swiper-slide">

					<img src="./images/res_pic/${restVO.res_pic }.jpg"
						class="img-fluid" alt="#" style="width: 100%;  height: 400px;">

				</div> 
			 	 <%-- <div class="swiper-slide">

					<img src="./images/res_pic/${restVO.res_pic }.jpg"
						class="img-fluid" alt="#" style="width: 100%;  height: 400px;">

				</div>  --%>
				

			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination swiper-paginFation-white"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next swiper-button-white"></div>
			<div class="swiper-button-prev swiper-button-white"></div>
		</div>
	</div>
	<!--//END BOOKING -->

	<!--============================= RESERVE A SEAT =============================-->
	<section class="reserve-block">
		<div class="container">
			<div class="card" id="page-content">
				<div class="card-body">
					<div class="row">
						<div class="col-md-9">
							<h5>${restVO.res_name }</h5>
							<p>조회수 : ${restVO.res_readcount }</p>

							<div class='RatingStar_res1'>
								<div class='RatingScore_res1'>
									<div class='outer-star'>
										<div class='inner-star' float="right;"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="reserve-seat-block">
								<div class="reserve-rating">
									<span>4.5</span>
								</div>
								<div class="review-btn">
									<button class="btn btn-outline-danger"
										onclick="window.open('home_review/reviewWrite.jsp','','width=430,height=500,location=no,status=no,scrollbars=yes');">평점및리뷰등록</button>
									<span>34 reviews</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--//END RESERVE A SEAT -->



		<!--============================= 상세정보 =============================-->
		<section class="light-bg booking-details_wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12 responsive-wrap">
						<div class="card" id="page-content">
							<div class="card-body">
								<div style="text-align: left">
									<table class="info no_menu">
										<caption>식당 상세 정보</caption>

										<tbody>

											<tr class="only-desktop">
											<tr>
												<th  width="25%"> 지역  </th>
												<td><span>${restVO.res_Addr1 }</span></td>
											</tr>

											<tr>
												<th> 카테고리 </th>
												<td><span> ${restVO.res_category }</span></td>
											</tr>

											<tr>
												<th> 메뉴 </th>
												<td class="menu_td">
												<span><pre>${restVO.res_mainmenu }</pre></span> 
															<!-- <span class="Restaurant_MenuPrice">13,000원</span> -->
													
												</td>
											</tr>
											<tr>
												<th style="vertical-align: top;">영업시간</th>
												<td>${restVO.res_hours }</td>
											</tr>

											<tr class="only-desktop">
												<th>전화번호  </th>
												<td>${restVO.res_number }</td>
											</tr>

											<th>주소  </th>
											<td>${restVO.res_Addr2 }<br/> </td>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- ============================== MAP ============================== -->

					<div class="col-md-6">
						<div class="card" id="page-content">
							<div class="card-body">
								<div class="contact-info">
									<img src="./images/map.jpg" class="img-fluid" alt="#">
								</div>
								<a href="#" class="btn btn-outline-danger btn-contact">네이버 지도 이동</a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- ====================== 리 뷰 ======================== -->

			<div id="reviewListFocusId"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="card" id="page-content">
							<div class="card-body">
								<h5>34 Reviews</h5>
								<hr>
 						<c:forEach var="review" items="${reviewList}" varStatus="status">
								<div class="customer-review_wrap">

								<div class="customer-img">
										
								<p>닉네임 : ${userVO.user_nickname }</p>
								</div>
									<div class="customer-content-wrap">
										<div class="customer-content">

											<div class="customer-review"></div>
											<div class="row">
												<div class="col-md-7 responsive-wrap">
													<div class='RatingStar_review1'>
														<div class='RatingScore_review1'>
															<div class='outer-star'>
																<div class='inner-star'></div>
															</div>
														</div>
													</div>

													
												</div>
											</div>

										</div>
										<div class="container">
											<div class="row">
												<div class="col-md-12 responsive-wrap">
													<p class="customer-text">여기 왕돈까스 너무 맛있고 푸짐합니다. 직원들도
														친절하거 서비스가 좋아서 인기있는 최고의 돈까스 식당입니다.</p>
													<p class="customer-text">오픈형 주방이라서 청결함을 유지하고 있고 조리과정을 볼
														수 있어서 너무 좋습니다! 바삭한 일식 돈까스의 느낌이라서 너무 맛있는 맛집입니다.</p>
													<ul>
														<li><img src="./images/review-img1.jpg"
															class="img-fluid" alt="#"></li>
														<li><img src="./images/review-img2.jpg"
															class="img-fluid" alt="#"></li>
														<li><img src="./images/review-img3.jpg"
															class="img-fluid" alt="#"></li>
													</ul>
													<span>좋아요(10)</span> <a href="#"><span
														class="icon-heart"></span></a>
													<p>2일 전</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>

							<hr>
							<hr>

						
						</div>

					</div>
				</div>
			</div>
		</section>
	</section>



	<!--============================= FOOTER =============================-->

	<%@include file ="/common/footer-home.jsp" %>
	<!-- Footer End-->




	<!-- jQuery, Bootstrap JS. -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<!-- Magnific popup JS -->
	<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.js"></script>
	<!-- Swipper Slider JS -->
	<script src="${pageContext.request.contextPath }/js/swiper.min.js"></script>
	
	<script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 2,
            slidesPerGroup: 1,
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
    
	<!-- 리뷰 업로드 -->
	<script>
 	ratings = {RatingScore_res1: 3} 
	totalRating = 5;table = document.querySelector('.RatingStar_res1');
	function rateIt() {
		for (rating in ratings) {
			ratingPercentage = ratings[rating] / totalRating * 100;ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
	star = table.querySelector(`.${rating} .inner-star`);
	numberRating = table.querySelector(`.${rating} .numberRating`);
	star.style.width = ratingRounded;numberRating.innerText = ratings[rating];
		}
	}rateIt()
	</script>
	
	<!-- 1번 리뷰자 -->
	<script>
	ratings = {RatingScore_review1: 5} 
	totalRating = 5;
	table = document.querySelector('.RatingStar_review1');
	function rateIt() {for (rating in ratings) {
		ratingPercentage = ratings[rating] / totalRating * 100;ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
	    star = table.querySelector(`.${rating} .inner-star`);
	    numberRating = table.querySelector(`.${rating} .numberRating`);
	    star.style.width = ratingRounded;numberRating.innerText = ratings[rating];}}rateIt()
	</script>
	
	<!-- 2번 리뷰자 -->
	<script>ratings = {RatingScore_review2: 2} 
    totalRating = 5;
    table = document.querySelector('.RatingStar_review2');
    function rateIt() {for (rating in ratings) {
    	ratingPercentage = ratings[rating] / totalRating * 100;ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
        star = table.querySelector(`.${rating} .inner-star`);
		numberRating = table.querySelector(`.${rating} .numberRating`);
        star.style.width = ratingRounded;numberRating.innerText = ratings[rating];}}rateIt()
 	</script>
 	
	  <script >
     $(window).bind("pageshow", function (event) {
    	if (event.originalEvent.persisted) {
    		// 뒤로가기로 페이지 로드 시
    		document.myForm.submit();
    	}
    	else {
    		// 새로운 페이지 로드 시
    		document.myForm.submit();
    	} 
    });
    
    </script>
    
</body>
</html>