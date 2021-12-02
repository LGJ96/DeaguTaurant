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
    <!--============================= HEADER =============================-->
   <%@include file ="/common/header.jsp" %>
    <!--//END HEADER -->
   

    <!--============================= 검색창, 검색버튼 =============================-->

   <div class="row d-flex justify-content-center"  style = "margin-bottom: 50px;">
     	
        <div class="col-md-8" align="right">
            <form class="form-wrap mt-4">
                <div class="btn-group" role="group" aria-label="Basic example">
               
                    <input type="text" placeholder="${searchword}" class="btn-group"/>
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
   		
   		 <c:if test="${searchword==null }" >
   		 <c:forEach begin="0" var="rest" items="${restList}" varStatus="status">
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
   		 <c:forEach begin="0" var="rest" items="${restsearchword}" varStatus="status"> 
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
  </div>
</div>
</form>

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

</body>
</html>