<%@page import="vo.RestPageVO"%>
<%@page import="vo.RestVO"%>
<%@page import="java.util.List"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

 <%-- <%
List<RestVO> restCountList = (List<RestVO>)request.getAttribute("restCountList");

RestPageVO restpageVO = (RestPageVO)request.getAttribute("restpageVO");
int rest_number = restpageVO.getRest_number();
int rest_count = restpageVO.getRest_count(); 
int rest_currentPage = restpageVO.getRest_currentPage();
int rest_pageCount = restpageVO.getRest_pageCount();
int rest_startPage = restpageVO.getRest_startPage();
int rest_endPage = restpageVO.getRest_endPage();

%>  --%>
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
    <!--============================= HEADER =============================-->
   <%@include file ="/common/header.jsp" %>
    <!--//END HEADER -->
   

    <!--============================= 검색창, 검색버튼 =============================-->

   <div class="row d-flex justify-content-center"  style = "margin-bottom: 50px;">
     	
        <div class="col-md-8" align="right">
           <form class="form-wrap mt-4" action="#" method="POST" name = "searchform1">
                <div class="btn-group" role="group" aria-label="Basic example">
               
                    <input type="text" placeholder="검색" class="btn-group" name ="searchword" id="searchword"/>
                    <button type="button" class="btn-form2" onclick="search1()">검색</button>
      	
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
                  	<input type="checkbox" id="nam" name ="nam">
   					<label for="cb1"  id = "t1"  style = "margin-right: 10px;" >남구</label>
   					
                    <input type="checkbox" id="dalseo" name ="dalseo">
   					<label for="cb2"  id = "t1" style = "margin-right: 10px;">달서구</label>
   					
   					<input type="checkbox" id="dalseong" name ="dalseong">
   					<label for="cb3"  id = "t1" style = "margin-right: 10px;">달성군</label>
   					
   					<input type="checkbox" id="dong" name ="dong">
   					<label for="cb4"  id = "t1" style = "margin-right: 10px;">동구</label>
   					
   					<input type="checkbox" id="buk" name ="buk">
   					<label for="cb5"  id = "t1"style = "margin-right: 10px;" >북구</label>
   					
   					<input type="checkbox" id="seo" name ="seo">
   					<label for="cb6"  id = "t1" style = "margin-right: 10px;">서구</label>
   					
   					<input type="checkbox" id="suseong" name ="suseong">
   					<label for="cb7"  id = "t1"style = "margin-right: 10px;" >수성구</label>
   					
   					<input type="checkbox" id="jung" name ="jung">
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
   		
   		 <c:if test="${searchword==null }">
   		
   		<c:forEach begin="0" end = "8" var="rest" items="${restListt}" varStatus="status">
   		<table id=search-menu>
         <tr>
            <td>
            <a href = "${pageContext.request.contextPath }/rest_content.dae?res_id=${rest.res_id}" >
             <img id = "img2" src ="${pageContext.request.contextPath }/images/res_pic/${rest.res_pic}.jpg"/>
              <span class="point">${rest.res_score}</span>
               <span class="point1">지역 : ${rest.res_Addr1}</span>
               <span class="point2">테마 : ${rest.res_category}</span>
               <span class="point3">조회수 :${rest.res_readcount }</span>
              <br>
              ${rest.res_name}
             </a>
            </td>
         </tr>
      	</table> 
      	</c:forEach>
   		</c:if>
   		 
   		 <c:if test="${searchword != null}">
   		 <c:forEach begin="0"   var="rest" items="${restsearchword}" varStatus="status"> 
   		<table id=search-menu>
         <tr>
            <td>
            <a href = "${pageContext.request.contextPath }/rest_content.dae?res_id=${rest.res_id}" >
             <img id = "img2" src ="${pageContext.request.contextPath }/images/res_pic/${rest.res_pic}.jpg"/>
              <span class="point">${rest.res_score}</span>
               <span class="point1">지역 : ${rest.res_Addr1}</span>
               <span class="point2">테마 : ${rest.res_category}</span>
               <span class="point3">조회수 :${rest.res_readcount }</span>
              <br>
              ${rest.res_name}
             </a>
            </td>
         </tr>
      	</table> 
      	</c:forEach>
   		</c:if>
    
   	</div>
   	
	 <div class="col-md-12">
      <div class="container"  id = "page">
   		<div class="row">
   		
 		<c:if test="${not empty restpageVO}">
 
   		<c:if test="${restpageVO.rest_count > 0 }">

       <c:if test="${restpageVO.rest_startPage > 10 }">
        <a href="rest_Searchlist.dae?rest_pageNum=${restpageVO.rest_startPage - 10 }">[이전]</a>
        </c:if>

       <c:forEach begin = "${restpageVO.rest_startPage }" end ="${restpageVO.rest_endPage }" var = "i">
        <a href="rest_Searchlist.dae?rest_pageNum=${i }">[${i }]</a>
		</c:forEach>

      	<c:if test="${restpageVO.rest_endPage < restpageVO.rest_pageCount  }">
        <a href="rest_Searchlist.dae?rest_pageNum=${restpageVO.rest_startPage + 10 }">[다음]</a>
        </c:if>

	</c:if>
	</c:if>
	</div>
	</div>
  </div>  
      	
		
  
  </div>
</div>

  <!--============================= FOOTER =============================-->
    <%@include file ="/common/footer.jsp" %>
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
    
    function search1(){
    	document.searchform1.target = "_self";
    	document.searchform1.action="rest_Search.dae";
    	document.searchform1.submit();
    }
    </script> 

</body>
</html>