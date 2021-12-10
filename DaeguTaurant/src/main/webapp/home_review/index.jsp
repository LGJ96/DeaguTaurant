<%@page import="vo.RestVO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!--============================= HEADER(로고, 로그인 버튼) =============================-->
    <%@include file ="/common/header-home.jsp" %>
    <!-- END HEADER -->

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
                        <div class="row d-flex justify-content-center" id = "aaa">
                            <div class="col-md-10">
                                 <form class="form-wrap mt-4" action="#" method="POST" name = "searchform">
                                    <div class="btn-group" role="group" aria-label="Basic example" onkeypress="if(event.keyCode == 13) enterkey()">
                                        <input type="text" placeholder="검색창" class="btn-group" name ="searchword" id="searchword" 
                                           />
                                        <button type="button" class="btn-form1" onclick="search()">SEARCH</button>
                                    </div>
                                </form>
                                
                                <div class="slider-link">
                                
                                    <a href="${pageContext.request.contextPath }/rest_Searchlist.dae" id="regtheme">지역/테마</a>
                                    
                                    <c:if test="${loginUser.user_id != null }">
                                    <a href="${pageContext.request.contextPath }/comm/comm.jsp">커뮤니티</a>
                                    
                                   	</c:if>
                                    <c:if test="${loginUser.user_id == null }">
                                    <a href="#" onClick="alert('로그인 후 이용해 주세요')"> 커뮤니티</a>
                                   	</c:if>
                                   
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
                
 <c:if test="${loginUser.user_id != null }">
 	<c:if test="${loginUser.user_level == 9}"> 
		<div class = "container" align="right" style = "margin-top: 20px;">
		<a href="home_review/restaurant_register.jsp" >
		<h6>식당 등록</h6>
		</a>
		</div>
</c:if> 
</c:if> 
	 	 <form action="${pageContext.request.contextPath }/restIndex.dae" method="POST" name="myForm"> 
    <section class="main-block1 light-bg">
   
   	 	
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="styled-heading">
                        <h3>추천 식당</h3>
                    </div>
                </div>
            </div>
            <div class="row">
             <c:forEach begin="0" end ="6" var="rest" items="${restList}" varStatus="status">
                <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
                   
                         <a href = "${pageContext.request.contextPath }/rest_content.dae?res_id=${rest.res_id}" >
                  			<img src ="${pageContext.request.contextPath }/images/res_pic/${rest.res_pic }.jpg" class = "index" />
              
                            <span class="featured-rating-orange">${rest.res_totalscore }</span>
                            <div class="featured-title-box">
                                <h6>${rest.res_name }</h6>
                                <p>${rest.res_category }</p> <span>• </span>
                                <p>조회수 : ${rest.res_readcount }</p> <span> • </span>
                              <!--   <p><span>$$$</span>$$</p> -->
                                <ul>
                                    <li><span class="icon-location-pin"></span>
                                        <p>${rest.res_Addr2 }</p>
                                    </li>
                                    <li><span class="icon-screen-smartphone"></span>
                                        <p>${rest.res_number }</p>
                                    </li>
                                  <!--   <li><span class="icon-link"></span>
                                        <p>https://burgerandlobster.com</p>
                                    </li> -->

                                </ul>
                               
                        	</div>
                        	
                        </a>
                    
                    </div>
              
                </div>
             </c:forEach>
            </div>
        </div>
       
    </section>
   
   <!-- ===================밑줄============================== -->
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
           <!--  <th colspan="1">번호</th> -->
            <th align="rigth" colspan="6" style = "text-align: center;" > Best 식당</th>
          
        </tr>
      </thead>
      <tbody>
        <tr>
         <!--  <th scope="row"></th> -->
            <td colspan="6"> 
       		<c:forEach begin="0" end ="6" var="rest" items="${restList}" varStatus="status">
                
                <a href = "${pageContext.request.contextPath }/rest_content.dae?res_id=${rest.res_id}" >
                  <div >
                      <h7>${rest.res_name }</h7>
              	 </div>     	
                </a>
                <hr>
                    
             </c:forEach>
        </td>
          
        </tr>
       <!--  <tr>
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
        </tr> -->
      </tbody>
      </a>
    </table>
    </div>
</div>


<div class="card-body"  >
 
    <div class="col-md-6" style="float: left;">
    <table class="table">
      <thead  class="bg-warning text-white">
        <tr>
          
            <th align="right" colspan="6" style = "text-align: center;" > New 식당</th>
        </tr>
      </thead>
     
      <tbody>
        <tr>
         <!--  <th scope="row"></th> -->
            <td colspan="6"> 
       		<c:forEach begin="84" end ="88" var="rest" items="${restList}" varStatus="status">
                
                <a href = "${pageContext.request.contextPath }/rest_content.dae?res_id=${rest.res_id}" >
                  <div >
                      <h7>${rest.res_name }</h7>
              	 </div>     	
                </a>
                <hr>
                    
             </c:forEach>
        </td>
          
        </tr>
       
      </tbody>
    </table>
    </div>
    </div>
    </div>
    </div>
     </form>
</section>
 
<%@include file ="/common/footer-home.jsp" %>

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
       
        function search(){
        	var searchinputv = document.getElementById("searchword").value;
        	/* document.searchform.target = "_self";
        	document.searchform.action="rest_Searchlist.dae";
        	document.searchform.submit(); */
        	
        	
        	 if(searchinputv == "" ){
        		document.searchform.target = "_self";
             	document.searchform.action="rest_Searchlist.dae";
             	document.searchform.submit();
        		
        	}
        	else{
        		document.searchform.target = "_self";
            	document.searchform.action="rest_Search.dae";
            	document.searchform.submit();
        	} 
        }
        
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
    
  <script>
    function enterkey() {
        if (window.event.keyCode == 13) {
        	
        	document.searchform.action="rest_Search.dae";
       
       }
   }

    </script> 
    
    
</body>
 
</html>