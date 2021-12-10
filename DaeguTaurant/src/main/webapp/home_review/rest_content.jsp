<%@page import="vo.RestVO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<img src="${pageContext.request.contextPath }/images/res_pic/${restVO.res_pic }.jpg"
						class="img-fluid" alt="#" style="width: 100%;  height: 400px;">
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
							
							<c:if test="${loginUser.user_id != null }">
 								<c:if test="${loginUser.user_level == 9}"> 
 								 <input type="button" value="식당수정" 
									onclick="document.location.href='rest_Update.dae?res_id=${restVO.res_id}'"/>
								</c:if> 
							</c:if>  

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
									<span>${totalScore}</span>
								</div>
								<div class="review-btn">
								<c:if test="${loginUser.user_id != null }">
									<button class="btn btn-outline-danger"
										onclick="window.open('restReviewwrite.dae?','','width=430,height=500,location=no,status=no,scrollbars=yes');">평점및리뷰등록</button>
								</c:if>	
								<c:if test="${loginUser.user_id == null }">
									<button class="btn btn-outline-danger"
										onclick="alert('로그인 후 이용해 주세요')">평점및리뷰등록</button>
								</c:if>
							
									<span> ${restpageVO.rest_count} reviews</span>
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

					 <div class="col-md-12">
						<div class="card" id="page-content">
							<div class="card-body">
								<div class="contact-info">
									<div id="map" style="width:100%;height:400px;"></div>
						
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=300939836ca1a99c440ffdda27726c12&libraries=services"></script>
										
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										        
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										var loca = "${restVO.res_Addr2 }";
											//"${restVO.res_Addr2 }";
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch(loca, function(result, status) {
										
										    // 정상적으로 검색이 완료됐으면 
										     if (status === kakao.maps.services.Status.OK) {
										
										        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										
										        // 결과값으로 받은 위치를 마커로 표시합니다
										        var marker = new kakao.maps.Marker({
										            map: map,
										            position: coords
										        });
										
										        // 인포윈도우로 장소에 대한 설명을 표시합니다
										        var infowindow = new kakao.maps.InfoWindow({
										            content: '<div class = "balloon" >${restVO.res_name}</div>'
										            /* content: '<div style="width:150px;text-align:center;padding:6px 0;">식당</div>' */
										        });
										        infowindow.open(map, marker);
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										    } 
										});    
										</script>	
							
						</div>
					</div>
				</div>
			</div> 
	
			<!-- ====================== 리 뷰 ======================== -->
	 <form action="#" method="Get" name="reviewlikecount" > 

			<div id="reviewListFocusId">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="card" id="page-content">
							<div class="card-body">
							
								<h5>리뷰(${restpageVO.rest_count})</h5>
								<hr>
 						<c:forEach var="review1" items="${reviewList}" varStatus="status">
 						
								<div class="customer-review_wrap">

								<div class="customer-img">
								<p>닉네임 :${review1.rev_writer}</p>
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
													<p class="customer-text">${review1.rev_content }</p>
												
													<ul>
														<li><img src="${pageContext.request.contextPath }/images/rev_pic/${review1.rev_pic }.jpg"
														
															class="img-fluid1" alt="#"></li>
													</ul>
												 

													<span>좋아요</span> 
													
											
													<input type="hidden" name="rev_id" value="${review1.rev_id}">
													<input type="button" name="likey" value="♥" onclick="location.href='restReviewlike.dae?rev_id=${review1.rev_id }'"/> <!-- </a> -->
													${review1.rev_like}
													
												
													<p>${review1.rev_notice_date }</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							
						</div>

                    

						
						</div>

					</div>
				</div>
			</div>
									
	<div class="col-md-12">
      <div class="container"  id = "page">
   		<div class="row">
   		
 		
 	<c:if test="${not empty restpageVO}">
   		<c:if test="${restpageVO.rest_count > 0 }">

       <c:if test="${restpageVO.rest_startPage > 10 }">
        <a href="rest_content.dae?&res_id=${restVO.res_id}&rest_pageNum=${restpageVO.rest_startPage - 10 }">
        <p>[이전]</p>
        </a>
        </c:if>

       <c:forEach begin = "${restpageVO.rest_startPage }" end ="${restpageVO.rest_endPage }" var = "i">
        <a href="rest_content.dae?res_id=${restVO.res_id}&rest_pageNum=${i }">
       <p>[${i }]</p>
        </a>
		</c:forEach>

      	<c:if test="${restpageVO.rest_endPage < restpageVO.rest_pageCount  }">
        <a href="rest_content.dae?res_id=${restVO.res_id}&rest_pageNum=${restpageVO.rest_startPage + 10 }">
        <p>[다음]</p>
        </a>
        </c:if>

	</c:if>
	</c:if>
	
	</div>
  </div>
</div>
</div>		
			
	
</form>
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
 	
	
    
</body>
</html>