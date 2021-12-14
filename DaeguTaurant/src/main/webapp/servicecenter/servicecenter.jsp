<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "servicecenter.vo.PageVO"%>
<%@ page import = "servicecenter.vo.NoticeVO" %>
<%@page import="servicecenter.vo.FaqPageVO"%>
<%@page import="servicecenter.vo.FaqVO"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
    //2021-01-12 09:17%>

<%
List<NoticeVO> articleList = (List<NoticeVO>)request.getAttribute("articleList");
PageVO pageVO = (PageVO)request.getAttribute("pageVO");
int count = pageVO.getCount();
int currentPage = pageVO.getCurrentPage();
int startPage = pageVO.getStartPage();
int number = pageVO.getNumber();
int endPage = pageVO.getEndPage();
int pageCount = pageVO.getPageCount();
%>
<%-- <%
List<FaqVO> faqArticleList = (List<FaqVO>)request.getAttribute("faqArticleList");
FaqPageVO faqPageVO = (FaqPageVO)request.getAttribute("faqPageVO");
int faq_count = faqPageVO.getFaq_count();
int faq_currentPage = faqPageVO.getFaq_currentPage();
int faq_startPage = faqPageVO.getFaq_startPage();
int faq_number = faqPageVO.getFaq_number();
int faq_endPage = faqPageVO.getFaq_endPage();
int faq_pageCount = faqPageVO.getFaq_pageCount();
%> --%>
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

  <!--============================= 공지사항 =============================-->



    <div class="col-md-12">
    <div class="row" style = "min-height: 400px;">
    <div class = "container">
      
        <div class="col-sm-12" align="center">
         
             	<div id= "title-header2" >
                <h3><a href = "serviceCenterList.dae" style="color: black"> 공지사항 </a>
        		
                <a> | </a> 
                
                <a href = "serviceCenterFaqList.dae" style="color: gray"> FAQ </a>
                
		        	<c:if test="${loginUser.user_id != null }">
		 				<c:if test="${loginUser.user_level == 9}">
		 					<a> | </a>
				       		<a href = "serviceCenterOtoList.dae" style="color: gray"> 1:1 문의 </a></h3>
				        </c:if>
				    </c:if>
				</div>
                
        		
        		<c:if test="${loginUser.user_id != null }">
 					<c:if test="${loginUser.user_level == 9}">
			            <div class="col-md-11" style="text-align : right;">
			 				<div class="container">
			       				<button class="btn" onclick="location.href='notice_writeForm.dae';"  style="cursor:pointer" > 등록</button>
			            	</div>
			            </div>
			        </c:if>
			    </c:if>
           
            <div class="card" id="title-content">
                
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                        <%
							if (count == 0) {
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
                                    번호
                                </th>
                                <th colspan="2" width="700">
                                    제목
                                </th>
                                <th colspan="6" class="text-right">
                                    작성 시간
                                </th>
                            </thead>
                            <%
								for (int i = 0 ; i < articleList.size() ; i++) {
							          NoticeVO article = (NoticeVO)articleList.get(i);
							%>
                            <tbody>
                                <tr>
                                    <td colspan="1">
                                        <%=number--%>
                                    </td>
                                    <td colspan="2" width="750">
                                        <a href="#?cus_notice_number=<%=article.getCus_notice_number()%>&pageNum=<%=currentPage%>" style="color: black"
                                        id="show<%=article.getCus_notice_number()%>" onclick="if(hide<%=article.getCus_notice_number()%>.style.display=='none') {hide<%=article.getCus_notice_number()%>.style.display='';show<%=article.getCus_notice_number()%>.innerText='<%=article.getCus_notice_title()%>'} else {hide<%=article.getCus_notice_number()%>.style.display='none';show<%=article.getCus_notice_number()%>.innerText='<%=article.getCus_notice_title()%>'}">
										<%=article.getCus_notice_title()%> </a>
											<div id="hide<%=article.getCus_notice_number()%>" style="display: none">
					                           <div class="card" id="title-content">
					                              <div class="col-sm-15">
					                              	<div class="text-left">
					                                    <%=article.getCus_notice_content().replaceAll("\r\n", "<BR>")%>
					                              	</div>
					                              		<c:if test="${loginUser.user_id != null }">
 															<c:if test="${loginUser.user_level == 9}">
							                                  <div class="col-sm-2" style="float: right;">
							                                  
							                                     <%-- <form method="post" name="notice-delete" action="notice_deletePro.dae" onsubmit="return writeSave()">
																	<input type="hidden" name="cus_notice_number" value="<%=cus_notice_number%>">
																	<input type="hidden" name="pageNum" value="<%=pageNum%>"> --%>
																	
									                             <a href="#" type="button"  style="color:black" 
									                             onclick="window.open('notice_deleteForm.dae?cus_notice_number=<%=article.getCus_notice_number()%>&pageNum=<%=currentPage%>','','width=330,height=100,location=no,status=no,scrollbars=yes');">삭제</a>
							                             
								                                 <!-- <script language="javascript">
								                                    function showConfirm_delete() {
								                                       if (confirm("삭제 하시겠습니까?")){
								                                           alert("삭제 완료했습니다.");
								                                       	}else{
								                                           alert("취소 버튼을 눌렀습니다.");
								                                       	}
								                                    }
								                                  </script> -->
								                                  <!-- </form> -->
								                                  <a>|</a>
							                                  
							                                 	 <a href="notice_updateForm.dae?cus_notice_number=<%=article.getCus_notice_number()%>&pageNum=<%=currentPage%>"  type="button"  style="color:black" OnClick="showConfirm_modify();">수정</a>
					                                           </div>
					                                         </c:if>
					                                       </c:if>
					                                     </div>
					                                   </div>
					                               </div>	
				                                                      
                                    </td>
                                    <td colspan="6" class="text-right">
                                         <%= sdf.format(article.getCus_notice_date())%>
                                    </td>
                                </tr>
                                <%}%>
                                 
                            </tbody>
                        	<%}%>
                        </table>
                        <%
						    if (count > 0) {
						        
						        if (startPage > 10) { %>
						        <a href="serviceCenterList.dae?pageNum=<%= startPage - 10 %>">
						        <h8>[이전] </h8>
						        </a>
						<%      }
						        for (int i = startPage ; i <= endPage ; i++) {  %>
						        <a href="serviceCenterList.dae?pageNum=<%= i %>">
						       <h8>  [<%= i %>] </h8>
						        </a>
						<%
						        }
						        if (endPage < pageCount) { %>
						        <a href="serviceCenterList.dae?pageNum=<%= startPage + 10 %>">
						        <h8> [다음] </h8>
						        </a>
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
</div>

  <%-- <div class="col-md-12">
    <div class="row">
    <div class = "container">
        <div class="col-sm-12" align="center">
        <div id= "title-header1" >
                <h3> FAQ </h3>
        </div>
        
        <div class="col-md-11" style="text-align : right;">
 				<div class="container">
       				<button class="btn" onclick="location.href='faq_writeForm.dae';"  > 등록</button>
            </div>
            </div>
        
          <div id="accordion">
            <div class="card card-plain" id="title-content">

                <div>
                
                    <div class="table-responsive">
                    
                        <table class="table">
                          
                          <%
							if (faq_count == 0) {
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
                          
                            <tbody>
                            <%
								for (int j = 0 ; j < faqArticleList.size() ; j++) {
									FaqVO faqArticle = (FaqVO)faqArticleList.get(j);
							%>
                                <tr>
                                    <td>
                                        <button class="btn btn-block btn-outline-dark" data-toggle="collapse" data-target="#faq<%=faqArticle.getCus_faq_number()%>">
                                            
                                          <%=faqArticle.getCus_faq_title()%>
                                         </button>
                                         <div id="faq<%=faqArticle.getCus_faq_number()%>" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                <%=faqArticle.getCus_faq_content()%><br>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                            <%}%>
                                <tr>
                                    <td>
                                        <button class="btn btn-block btn-outline-dark" data-toggle="collapse" data-target="#faq2">
                                            
                                          회원탈퇴 하는 방법
                                         </button>
                                         <div id="faq2" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                im aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                            </div>
                                        </div>
                                    </td>   
                                </tr>   
                        </table>
                      </div>
                  </div>
            </div>
          </div>
         </div>      
      </div>
  </div>
<div>
</div>
</div> --%>
</div>
 <!--============================= 1:1문의 =============================-->
<c:choose> 

<c:when test="${loginUser.user_id != null }">
<div class="col-md-11" style="text-align : right;">
 <div class="container">
 <button class="btn btn-warning"  
  onclick="window.open('oto_writeForm.dae','','width=430,height=500, left=700,top =200,location=no,status=no,scrollbars=yes');">1:1문의</button>
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