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

<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>



    <!--============================= HEADER =============================-->
   <%@include file ="/common/header.jsp" %>
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
                         <h2>커뮤니티 - 내용조회</h2>
                       
                    </div>
                </div>
            </div>
        </div>
     </div>
  </div>
</div>
    
    <!--//END 커뮤니티 헤더 -->
    
    <!-- 글쓰기 본문 -->
    
   <div class="container" >
    <div class="col-lg-12" align="right">
	 <a href="../comm/comm-write.jsp"><button class="btn btn-warning1" > 수정</button></a>
	 <a href="../comm/comm.jsp"><button class="btn btn-warning1" > 삭제</button></a>
	</div>
	 <div class="col-lg-12">
		<form method="post" action="writeAction.jsp">
		   <div class="row">
              <div class="col-md-12"> 
              	<div class = "cold-md-2" id = "title1">
              		자유/정보
              	</div>
                <div class = "col-md-10" id = "title2"  >
					내용
				</div>
			</div>
		</div>
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				
				</form>
	
			
			<div class="row" >
              <div class="col-md-12">
                <div class="form-group row " >
                
                  <div class="col-md-2" align="center" style = "font-size: 20px;" >
                    <label for="inputType1">댓글작성</label>
                  </div>
                  
                  <div id = "form-control2" style = "border: 1px solid #dddddd;">
                  
                   	<textarea class="form-control" id = "form-control1" name="bbsContent" maxlength="500" ></textarea>
                  	<button type="submit" class="btn btn-regist" style = "float: right;"> 등록 </button>
                  </div>
             </div>
             </div>
             
        <!-- 댓글 내용 조회 창 -->     
   
             <div id = "content-table">
             
          		<ul >
             		<li>
             			<div>
             			
             			<div class="comment_nick_box" >
             			<div class="comment_nick_info">
             			<h6 class="comment_nickname">
            				다 나가 아무도 들어오지마 댓글달지마 저리가
        				</h6>
        				</div>
        				</div>
        				
             			<div class="comment_text_box">
             			<p class="comment_text_view">
             			<span class="text_comment">댓글 길이 좀 한번 볼까 얼마나 길어지나</span>
             			</p>
             			</div>
             			
             			<div class="comment_info_box">
             			<span class="comment_info_date">2021.10.17. 00:05</span>
             			<a href="#" role="button" class="comment_info_button" style = "float: right; margin-right: 20px;">
        					수정  
    					</a>
             			<a href="#" role="button" class="comment_info_button" style = "float: right; margin-righ: 50px;">
        					삭제   |
    					</a>
    					</div>
             			
             			</div>
             
             		</li>
             		<li>
             			<div >
             			<div class="comment_nick_box">
             			<div class="comment_nick_info">
             			<h6 class="comment_nickname">
            				다 들어오지마! 꼼짝마 당장 뒤로 돌아가!!!!!!!!!!!!!!!!!!!!!!!!!!!!11111
        				</h6>
        				</div>
        				</div>
        				
             			<div class="comment_text_box">
             			<p class="comment_text_view"><!---->
             			<span class="text_comment">댓글 길이 다시 한번 볼까 어디까지 늘어나나 내가 지켜보겠어 딱 기다려</span></p><!----></div>
             			
             			<div class="comment_info_box">
             			<span class="comment_info_date">2021.10.17. 00:05</span>
             			<a href="#" role="button" class="comment_info_button" style = "float: right; margin-right: 20px;">
        					수정  
    					</a>
             			<a href="#" role="button" class="comment_info_button" style = "float: right; margin-righ: 50px;">
        					삭제   |
    					</a>
    					</div>
             			
             			</div>
             
             		</li>
            	</ul>
              </div>
             </div>
 
<!-- 목록 버튼 -->	

	<div class="col-lg-12" align="right">
	 <a href="../comm/comm.jsp"><button class="btn btn-warning" > 목록</button></a>
	</div>
	
	</div>
	</div>

</body>		
   <!--============================= FOOTER =============================-->
	<%@include file ="/common/footer.jsp" %>
	<!-- Footer End-->


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
</html>