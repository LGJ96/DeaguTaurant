<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="servicecenter.vo.OtoPageVO"%>
<%@page import="servicecenter.vo.OtoVO"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
    //2021-01-12 09:17%>


<%
List<OtoVO> otoArticleList = (List<OtoVO>)request.getAttribute("otoArticleList");
OtoPageVO otoPageVO = (OtoPageVO)request.getAttribute("otoPageVO");
int oto_count = otoPageVO.getOto_count();
int oto_currentPage = otoPageVO.getOto_currentPage();
int oto_startPage = otoPageVO.getOto_startPage();
int oto_number = otoPageVO.getOto_number();
int oto_endPage = otoPageVO.getOto_endPage();
int oto_pageCount = otoPageVO.getOto_pageCount();
%>

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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
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
    <%@include file ="/common/header-servicecenter.jsp" %>
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

  <!--============================= 1:1 문의 =============================-->


  <div class="col-md-12">
    <div class="row">
    <div class = "container">
        <div class="col-sm-12" align="center">
        <div id= "title-header2" >
                <h3><a href = "serviceCenterList.dae" style="color: gray"> 공지사항 </a>
        		
                <a> | </a> 
                
                <a href = "serviceCenterFaqList.dae" style="color: gray"> FAQ </a>
                
        	<c:if test="${loginUser.user_id != null }">
 				<c:if test="${loginUser.user_level == 9}">
 					<a> | </a>
		       		<a href = "serviceCenterOtoList.dae" style="color: black"> 1:1 문의 </a></h3>
		        </c:if>
		    </c:if>
		</div>
        
          <div class="card" id="title-content">
                
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                        <%
							if (oto_count == 0) {
						%>
						<table width="700" border="1" cellpadding="0" cellspacing="0">
						<tr>
						    <td align="center">
						    게시판에 저장된 글이 없습니다.
						    </td>
						</table>
						
						<%
							} else {
						%>
                            <thead class=" text-primary">
                                <th colspan="1">
                                    작성자
                                </th>
                                <th colspan="2" width="700">
                                    제목
                                </th>
                                <th colspan="6" class="text-right">
                                    작성 시간
                                </th>
                            </thead>
                            <%
								for (int i = 0 ; i < otoArticleList.size() ; i++) {
							          OtoVO otoArticle = (OtoVO)otoArticleList.get(i);
							%>
                            <tbody>
                                <tr>
                                    <td colspan="1">
                                        <%=otoArticle.getUser_nickname()%>
                                    </td>
                                    <td colspan="2" width="700">
                                    <%
										int wid=0; //공백 이미지의 픽셀값
										if(otoArticle.getCus_re_level()>0){
										wid=5*(otoArticle.getCus_re_level());
									%>
									 <a>ㄴ</a>
									<%}else{%>
										<a width="<%=wid%>"/>
									<%}%>
                                    	<a href="serviceCenterOtoContent.dae?cus_oto_number=<%=otoArticle.getCus_oto_number()%>&oto_pageNum=<%=oto_currentPage%>"
                                    	 style="color: black " title=""><%=otoArticle.getCus_oto_title()%></a>
				                                                      
                                    </td>
                                    <td colspan="6" class="text-right">
                                         <%= sdf.format(otoArticle.getCus_oto_date())%>
                                    </td>
                                </tr>
                                <%}%>
                                 
                            </tbody>
                        	<%}%>
                        </table>
                        <%
						    if (oto_count > 0) {
						        
						        if (oto_startPage > 10) { //첫번째 페이지 그룹이 아니면...  이전그룹의 startPage로 이동 %>
						        <a href="serviceCenterOtoList.dae?oto_pageNum=<%= oto_startPage - 10 %>">[이전]</a>
						<%      }
						        for (int i = oto_startPage ; i <= oto_endPage ; i++) {  %>
						        <a href="serviceCenterOtoList.dae?oto_pageNum=<%= i %>">[<%= i %>]</a>
						<%
						        }
						        if (oto_endPage < oto_pageCount) { //현재 페이지그룹이 마지막 페이지 그룹이 아닐때 다음 페이지그룹의 startPage로 이동 %>
						        <a href="serviceCenterOtoList.dae?oto_pageNum=<%= oto_startPage + 10 %>">[다음]</a>
						<%
						        }
						    }
						%>
                    </div>
                </div>
            </div>
         </div>      
      </div>
  </div>
<div>
</div>
</div>
</div>
 <!--============================= 1:1문의 =============================-->
<c:choose> 

<c:when test="${loginUser.user_id != null }">
<div class="col-md-11" style="text-align : right;">
 <div class="container">
 <button class="btn btn-warning"  
  onclick="window.open('oto_writeForm.dae','','width=430,height=500,location=no,status=no,scrollbars=yes');">1:1문의</button>
</div>
</div>
</c:when>

<c:when test="${loginUser.user_id == null }">
<div class="col-md-11" style="text-align : right;">
 <div class="container">
    <button class="btn btn-warning" type="button" onclick="alert('로그인하세요!')">1:1문의</button>
 </div>
</div>
</c:when>

</c:choose>
   <!--============================= FOOTER =============================-->
    <footer>
       <!-- Footer Start-->
       <%@include file ="/common/footer-home.jsp" %>
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