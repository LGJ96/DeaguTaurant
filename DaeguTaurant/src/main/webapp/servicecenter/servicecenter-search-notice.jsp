<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="servicecenter.vo.PageVO"%>
<%@ page import="servicecenter.vo.NoticeVO"%>
<%@page import="servicecenter.vo.FaqPageVO"%>
<%@page import="servicecenter.vo.FaqVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <%
List<NoticeVO> articleList = (List<NoticeVO>)request.getAttribute("articleList");
PageVO pageVO = (PageVO)request.getAttribute("pageVO");
int count = pageVO.getCount();
int currentPage = pageVO.getCurrentPage();
int startPage = pageVO.getStartPage();
int number = pageVO.getNumber();
int endPage = pageVO.getEndPage();
int pageCount = pageVO.getPageCount();
%> --%>

<%-- <%
List<FaqVO> faqArticleList = (List<FaqVO>)request.getAttribute("faqArticleList");
FaqPageVO faqPageVO = (FaqPageVO)request.getAttribute("faqPageVO");
int faq_count = faqPageVO.getFaq_count();
int faq_currentPage = faqPageVO.getFaq_currentPage();
int faq_startPage = faqPageVO.getFaq_startPage();
int faq_number = faqPageVO.getFaq_number();
int faq_endPage = faqPageVO.getFaq_endPage();
int faq_pageCount = faqPageVO.getFaq_pageCount();
%>   --%>
<%-- <% 
	int cus_notice_number = (int)request.getAttribute("cus_notice_number");
	String pageNum = (String)request.getAttribute("pageNum");
%> --%>

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
<title>DaeguTaruant</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
	rel="stylesheet">
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

<body>
	<!--============================= HEADER =============================-->
	<%@include file="/common/header-servicecenter.jsp"%>
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
								<h2>고객센터</h2>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!--//END 고객센터 헤더 -->

		<!--============================= 공지사항 =============================-->



		<div class="col-md-12">
			<div class="row">
				<div class="container">

					<div class="col-sm-12" align="center">

						<c:if test="${loginUser.user_id != null }">
							<c:if test="${loginUser.user_level == 9}">
								<div class="col-md-11"
									style="text-align: right; margin-top: 20px;">
									<div class="container">
										<button class="btn"
											onclick="location.href='notice_writeForm.dae';">
											등록</button>
									</div>
								</div>
							</c:if>
						</c:if>

						<div class="card" id="title-content">

							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<c:if test="${count== 0}">
											<table width="700" border="1" cellpadding="0" cellspacing="0">
												<tr>
													<td align="center">게시판에 저장된 글이 없습니다.</td>
											</table>
										</c:if>

									<c:if test="${count != 0}">
										<thead class=" text-primary">
 											<th colspan="1"width="80"> 번호</th>
											<th colspan="2" width="600">제목</th>
											<th colspan="12" class="text-right">작성 시간</th>
										</thead>


										<c:forEach var="notice" items="${noticesearchword}" varStatus="status">
											<tbody>
												<tr>
												<td colspan="1">${notice.cus_notice_number} </td>

												<td colspan="12">${notice.cus_notice_title} </td>
	
													<td colspan="12" class="text-right">
													<fmt:formatDate value="${notice.cus_notice_date }" pattern="yyy-MM-dd HH:mm" /></td>
												</tr>
												 <tr>
													<td colspan="12"><pre>${notice.cus_notice_content}</pre> </td>
													<td colspan="12">
													<c:if test="${loginUser.user_id != null }">
														<c:if test="${loginUser.user_level == 9}">
														<div class="col-sm-12" style="float: right;">

															<a href="#" type="button" style="color: black"
																onclick="window.open('notice_deleteForm.dae?cus_notice_number=${notice.cus_notice_number }&pageNum=${searchPageVO.sea_currentPage }','','width=330,height=100,location=no,status=no,scrollbars=yes');">삭제</a>


															<a>|</a>
														<a href="notice_updateForm.dae?cus_notice_number=${notice.cus_notice_number }&pageNum=${searchPageVO.sea_currentPage }"
													type="button" style="color: black" OnClick="showConfirm_modify();">수정</a>
											</div>
									</c:if>
									</c:if> 
								</td>
							<tr> 
						</tbody>
					</c:forEach>
					
										<c:forEach var="faq" items="${faqsearch}" varStatus="status">
											<tbody>
												<tr>
											
												<td colspan="12">${faq.cus_faq_title} </td>
	
													<td colspan="12" class="text-right">
													<fmt:formatDate value="${faq.cus_faq_date }" pattern="yyy-MM-dd HH:mm" /></td>
												</tr>
												 <tr>
												 	<td colspan="1">${faq.cus_faq_number} </td>
													<td colspan="12"><pre>${faq.cus_faq_content}</pre> </td>
													<td colspan="12">
													<c:if test="${loginUser.user_id != null }">
														<c:if test="${loginUser.user_level == 9}">
														<div class="col-sm-12" style="float: right;">

															<a href="#" type="button" style="color: black"
																onclick="window.open('faq_deleteForm.dae?cus_faq_number=${faq.cus_faq_number }&pageNum=${searchPageVO.sea_currentPage }','','width=330,height=100,location=no,status=no,scrollbars=yes');">삭제</a>


														<!-- 	<a>|</a> -->
														<a href="faq_updateForm.dae?cus_faq_number=${faq.cus_faq_number }&pageNum=${searchPageVO.sea_currentPage }"
													type="button" style="color: black" OnClick="showConfirm_modify();">수정</a>
											</div>
									</c:if>
									</c:if> 
								</td>
							<tr> 
						</tbody>
					</c:forEach>
					
										<c:forEach var="oto" items="${otosearchword}" varStatus="status">
											<tbody>
												<tr>
											
												<td colspan="6">${oto.cus_oto_title} </td>
	
													<td colspan="6" class="text-right">
													<fmt:formatDate value="${oto.cus_oto_date }" pattern="yyy-MM-dd HH:mm" /></td>
												</tr>
												 <tr>
												 	
													<td colspan="6"><pre>${oto.cus_oto_content}</pre> </td>
													<td colspan="12">
													<c:if test="${loginUser.user_id != null }">
														<c:if test="${loginUser.user_level == 9}">
														<div class="col-sm-8" style="float: right;">

															<a href="#" type="button" style="color: black"
																onclick="window.open('oto_deleteForm.dae?cus_oto_number=${oto.cus_oto_number }&pageNum=${searchPageVO.sea_currentPage }','','width=330,height=100,location=no,status=no,scrollbars=yes');">삭제</a>


															<a>|</a>
														<a href="oto_updateForm.dae?cus_oto_number=${oto.cus_oto_number }&pageNum=${searchPageVO.sea_currentPage }"
													type="button" style="color: black" OnClick="showConfirm_modify();">수정</a>
											</div>
									</c:if>
									</c:if> 
								</td>
							<tr> 
						</tbody>
					</c:forEach>
				</c:if>
			</table>
									
									
					<c:if test="count > 0 ">

       				<c:if test="${startPage > 10 }">
       				 <a href="serviceCenterList.dae?pageNum=${startPage - 10 }">[이전]</a>
        			</c:if>
    				<c:forEach begin = "${startPage }" end ="${startPage }" var = "i">
        			<a href="serviceCenterList.dae?pageNum=${i }">[${i }]</a>
					</c:forEach>

      				<c:if test="${article.endPage < pageCount  }">
        			<a href="serviceCenterList.dae?pageNum=${startPage + 10 }">[다음]</a>
       				 </c:if>

</c:if>
								</div>
							</div>
						</div>
                    <tbody>
               </tbody>
              </table>
            </div>
          </div>
       </div>
     </div>
   </div>
</div>
</div>
</div>

	<!--============================= FOOTER =============================-->
	<footer>
		<!-- Footer Start-->
		<%@include file="/common/footer-home.jsp"%>
		<!-- Footer End-->
	</footer>




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