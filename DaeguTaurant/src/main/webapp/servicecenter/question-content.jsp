<%@page import="java.util.List"%>
<%@page import="vo.UserVO"%>
<%@page import="servicecenter.vo.OtoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
<%
   SimpleDateFormat sdf = 
   new SimpleDateFormat("yyyy-MM-dd HH:mm");
   List<OtoVO> otoArticleList = (List<OtoVO>)request.getAttribute("otoArticleList");
   OtoVO otoArticle = (OtoVO)request.getAttribute("otoArticle");
   String oto_pageNum = (String)request.getAttribute("oto_pageNum");
   
      
  	  int cus_oto_number = otoArticle.getCus_oto_number();
	  int cus_ref=otoArticle.getCus_ref();
	  int cus_re_step=otoArticle.getCus_re_step();
	  int cus_re_level=otoArticle.getCus_re_level();
	  String User_nickname=otoArticle.getUser_nickname();
%>

<body>
    <!--============================= HEADER =============================-->
    <%@include file ="/common/header-servicecenter.jsp" %>
    <!--//END HEADER -->
    <!--============================= 1:1문의 내용 헤더 =============================-->
    <div>
        <!-- Swiper -->
        <div class="row d-flex justify-content-center">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                        <div class="col-md-12">
                         <div class="dark-cbg">
                         <h2>1:1 문의 내용</h2>
                       
                    </div>
                </div>
            </div>
        
    
    <!--//END 1:1문의 내용 헤더 -->

    
    <!-- 글쓰기 본문 -->
    
   <div class="container" >
    <div class="col-lg-12" align="right">
	
	 <!-- <a href="../comm/comm.html"><button class="btn btn-warning1" > 삭제</button></a> -->
	 <a href="#" type="button"  style="color:black" 
	 onclick="window.open('oto_deleteForm.dae?cus_oto_number=<%=otoArticle.getCus_oto_number()%>&pageNum=<%=oto_pageNum%>','','width=330,height=100,location=no,status=no,scrollbars=yes');">
	 <button class="btn btn-warning1" >삭제</button></a>
	</div>
	 <div class="col-lg-12">
		<form method="post" action="writeAction.jsp">
		
		<div style = "border: 1px solid #dddddd " >
	
		<input type="text"  readonly value="<%=otoArticle.getUser_nickname()%>" name="bbsWriter" maxlength="100" id = "qtitle" >
		</div>
		<div style = "border: 1px solid #dddddd " >
	
		<input type="text"  readonly value="<%=otoArticle.getCus_oto_title() %>" name="bbsTitle" maxlength="100" id = "qtitle" >
		</div>
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td><div border: 1px solid #dddddd" class="text-left" readonly name="bbsContent" maxlength="2048" style = "height: 350px;"><%=otoArticle.getCus_oto_content().replaceAll("\r\n", "<BR>") %></div></td>
						</tr>
					</tbody>
				</table>
				</form>
			<div class="col-lg-12">
               
			</div>
		</div>
		
	<!-- 목록 버튼 -->	
 
	<div class="col-lg-12" align="right">
	 <a href="serviceCenterOtoList.dae"><button class="btn btn-warning" > 목록</button></a>
	<button type="submit" class="btn btn-warning"
	onclick="window.open('oto_writeForm.dae?cus_oto_number=<%=cus_oto_number %>&cus_ref=<%=cus_ref %>&cus_re_step=<%=cus_re_step%>&cus_re_level=<%=cus_re_level%>','','width=430,height=500,location=no,status=no,scrollbars=yes');"> 
	답변 등록 </button>
                 
	</div>
	
	
	</div>
	
	</div>
	</div>

</body>		
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