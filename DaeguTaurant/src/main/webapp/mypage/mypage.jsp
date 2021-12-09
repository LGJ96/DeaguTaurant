<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>      
<%
	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	 String user_id = (String)session.getAttribute("user_id");
	String user_pw = (String)session.getAttribute("user_pw"); 
	
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
    <!--============================= HEADER =============================-->
    <%--  <%@include file ="/common/header.jsp" %> --%>
    
    <div class="dark-hg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="${pageContext.request.contextPath }/home_review/index.jsp"><img src="${pageContext.request.contextPath }/images/logo.png" alt="logo" /> </a>
                       
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              			<span class="icon-menu"></span>
            			</button>
            			
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                               
                             <li>
                                        
						<%
							if(user_id != null) {
									
						%> 
						
						
						<li><a href = "${pageContext.request.contextPath }/logout.dae" class="logout-text top-btn"  >로그아웃</a></li>
											
											
 						<li><a href = "${pageContext.request.contextPath }/mypage/mypage.jsp" class="btn btn-outline-light top-btn" id = "login-text"><%=loginUser.getUser_nickname()%></a></li>
 						
												
						<%
						}
							else{
						%>
						<li><a href="${pageContext.request.contextPath }/login/login.jsp" class="btn btn-outline-light top-btn" id = "login-text">
						<span class="ti-plus" ></span> 로그인</a></li>
								
						<%
						}
						%>
                            
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    
    </div>
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
                         <h2>마이페이지</h2>
                       
                    </div>
                </div>
        </div>
        </div>
    </div>
    </div>
    </div>
    <!--//END 마이페이지 헤더 -->

  <!--============================= 마이페이지 =============================-->

  <div class="content">
    <div class="row">
        <div class="col-xs-2" style="float: left;">
            <div id= "title-header" >
                <h2 class="card-title" >회원정보</h2>
             </div>
        </div>
        <!-- =======================회원정보조회============================= -->
        
    
        
        <div class="col-sm-9" style="float: right;">
            <div class="card" id="title-content">
                <div class="card-body">
                    <div style="text-align:left">
                    
                    <div class="grid-body">
                      <div class="item-wrapper">
                        <div class="row mb-3">
                          <div class="col-md-8 mx-auto" id = "info-text">
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType1">이름</label>
                              </div>
                              <div class="col-md-9 showcase_content_area">
                                <input type="text" class="form-control" id="inputType1" name="" readonly value="<%=loginUser.getUser_name()%>">
                              </div>
                            </div>
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType12">닉네임</label>
                              </div>
                              <div class="col-md-9 showcase_content_area">
                                <input type="email" class="form-control" id="inputType2" name="" readonly value="<%=loginUser.getUser_nickname()%>">
                              </div>
                            </div>
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType13">아이디</label>
                              </div>
                              <div class="col-md-9 showcase_content_area">
                                <input type="email" class="form-control" id="inputType3" name="" readonly value="<%=loginUser.getUser_id()%>"> 
                              </div>
                            </div>
                            
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType1">비밀번호 변경</label>
                              </div>
            
                              <div class="col-md-9 showcase_content_area">    
                                <button class="btn"  
  								onclick="window.open('modifyPw.jsp?user_id=${loginUser.user_id}',
  								'','width=510,height=240,location=no,status=no,scrollbars=yes,left = 1000, top = 500');">변경하기</button>
                               </div>
                            </div>
                           
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
<!-- ============================회원작성목록============================= -->
        <div class="col-xs-2" style="float: left;">
            <div id= "title-header" >
                <h2 class="card-title" > 회원 작성 목록 </h2>
             </div>
         </div>
         
<!-- ============================회원 글 작성목록============================= -->     
        <div class="col-sm-9" style="float: right;">
            <div id="accordion">
            <div class="card card-plain" id="title-content">
               
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                        <button class="btn btn-block btn-outline-dark" data-toggle="collapse" data-target="#faq1">
                                            
                                          글 작성 목록
                                         </button>
                                         <div id="faq1" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                <div class="col-sm-13" style="float: center;">
                                          <div class="card" id="title-content">
                                              
                                              
                                                  <div class="table-responsive">
                                                      <table class="table">
                                                          <thead class=" text-primary">
                                                              <th>
                                                                  번호
                                                              </th>
                                                              <th colspan="2">
                                                                  제목
                                                              </th>
                                                              <th  class="text-right">
                                                                  작성 시간
                                                              </th>
                                                          </thead>
                                                          <tbody>
                                                              <tr>
                                                          <div>
                                                          
                                                                  <td >
                                                                      1
                                                                  </td>
                                                                  
                                                                  <td colspan="2">
                                                                  <a href="comm_content.jsp" title="회원 글 목록1">
                                                                      대구 달서구 양식 맛집 목록입니다!
                                                                  </td>
                                                                  </a>
                                                                  
                                                                  <td class="text-right">
                                                                      2021.11.04 15:37
                                                                  </td>
                                                              
                                                              </tr>
                                                               <tr>
                                                                  <td>
                                                                      2
                                                                  </td>
                                                                  <td colspan="2">
                                                                  <a href="comm_content.jsp" title="회원 글 목록1">
                                                                      대구 중구 양식 맛집 목록입니다!
                                                                  </td>
                                                                  </a>
                                                                  <td class="text-right">
                                                                      2021.11.05 16:37
                                                                  </td>
                                                              </tr>
                                                              <tr>
                                                                  <td>
                                                                      3
                                                                  </td>
                                                                  <td colspan="2">
                                                                  <a href="comm_content.jsp" title="회원 글 목록1">
                                                                      대구 북구 양식 맛집 목록입니다!
                                                                  </td>
                                                                  </a>
                                                                  <td class="text-right">
                                                                      2021.11.06 17:37
                                                                  </td>
                                                              </tr>
                                                             
                                                          </tbody>
                                                      </table>
                                                  </div>
                                              
                                          </div>
                                      </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
<!-- ============================회원 문의 목록============================= -->

                                <tr>
                                    <td>
                                        <button class="btn btn-block btn-outline-dark" data-toggle="collapse" data-target="#faq2">
                                            
                                          회원 문의 목록
                                         </button>
                                         <div id="faq2" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                <div class="col-sm-13" style="float: center;">
                                          <div class="card" id="title-content">
                                              
                                              
                                                  <div class="table-responsive">
                                                      <table class="table">
                                                          <thead class=" text-primary">
                                                              <th colspan="1">
                                                                  번호
                                                              </th>
                                                              <th colspan="2">
                                                                  제목
                                                              </th>
                                                              <th  class="text-right">
                                                                  작성 시간
                                                              </th>
                                                          </thead>
                                                          <tbody>
                                                              <tr>
                                                                  <td>
                                                                      1
                                                                  </td>
                                                                  <td colspan="2">
                                                                      
				                                                   <a href=#none id="show_OTO_1" onclick="if(hide_OTO_1.style.display=='none') {hide_OTO_1.style.display='';show_OTO_1.innerText='비밀번호 찾기 문의'} else {hide_OTO_1.style.display='none';show_OTO_1.innerText='비밀번호 찾기 문의'}">
				                                                   비밀번호 찾기 문의</a>
				                                                      <div id="hide_OTO_1" style="display: none">
				                                                         <div class="card" id="title-content">
				                                                            <div class="col-sm-13">
				                                                               <div class="text-left">
				                                                               글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인<br />
				                                                               비밀번호를 찾고 싶습니다.<br />
				                                                               </div>
				                                                                  <div class="col-sm-2" style="float: right;">
				                                                                  
						                                                              <a href="mypage.jsp"  type="button"  style="color:black" OnClick="showConfirm_delete();">삭제</a>
						                                                                 <script language="javascript">
						                                                                   function showConfirm_delete() {
						                                                                      if (confirm("삭제 하시겠습니까?")){
						                                                                           alert("삭제 완료했습니다.");
						                                                                        } 
						                                                                     else{
						                                                                            alert("취소 버튼을 눌렀습니다.");
						                                                                        }
						                                                                      }
						                                                                  </script>
						                                                              <a>|</a>
						                                                              <a href="mypage.jsp" onclick="window.close();" type="button" style="color:black">취소</a>
				                                                               </div>
				                                                            </div>
				                                                         </div>
				                                                      </div>
				                                                            
				                                                   </div>
                                                                  <td class="text-right">
                                                                      2021.11.04 15:37
                                                                  </td>
                                                              
                                                              </tr>
                                                               <tr>
                                                                  <td>
                                                                      2
                                                                  </td>
                                                                  <td colspan="2">
                                                                      
				                                                   <a href=#none id="show_OTO_2" onclick="if(hide_OTO_2.style.display=='none') {hide_OTO_2.style.display='';show_OTO_2.innerText='식당 찾기 문의'} else {hide_OTO_2.style.display='none';show_OTO_2.innerText='식당 찾기 문의'}">
				                                                   식당 찾기 문의</a>
				                                                      <div id="hide_OTO_2" style="display: none">
				                                                         <div class="card" id="title-content">
				                                                            <div class="col-sm-12">
				                                                               <div class="text-left">
				                                                               글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인<br />
				                                                               식당 위치가 정확하지 않습니다.<br />
				                                                               </div>
				                                                                  <div class="col-sm-2" style="float: right;">
				                                                                  
						                                                              <a href="mypage.jsp"  type="button"  style="color:black" OnClick="showConfirm_delete();">삭제</a>
						                                                                 <script language="javascript">
						                                                                   function showConfirm_delete() {
						                                                                      if (confirm("삭제 하시겠습니까?")){
						                                                                           alert("삭제 완료했습니다.");
						                                                                        } 
						                                                                     else{
						                                                                            alert("취소 버튼을 눌렀습니다.");
						                                                                        }
						                                                                      }
						                                                                  </script>
						                                                              <a>|</a>
						                                                              <a href="mypage.jsp" onclick="window.close();" type="button" style="color:black">취소</a>
				                                                               </div>
				                                                            </div>
				                                                         </div>
				                                                      </div>
				                                                            
				                                                   </div>
                                                                  <td class="text-right">
                                                                      2021.11.05 16:37
                                                                  </td>
                                                              
                                                              </tr>
                                                               <tr>
                                                                  <td>
                                                                      3
                                                                  </td>
                                                                  <td colspan="2">
                                                                      
				                                                   <a href=#none id="show_OTO_3" onclick="if(hide_OTO_3.style.display=='none') {hide_OTO_3.style.display='';show_OTO_3.innerText='회원 탈퇴 문의'} else {hide_OTO_3.style.display='none';show_OTO_3.innerText='회원 탈퇴 문의'}">
				                                                   회원 탈퇴 문의</a>
				                                                      <div id="hide_OTO_3" style="display: none">
				                                                         <div class="card" id="title-content">
				                                                            <div class="col-sm-12">
				                                                               <div class="text-left">
				                                                               글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인글 길이 확인<br />
				                                                               회원 탈퇴하고 싶습니다.<br />
				                                                               </div>
				                                                                  <div class="col-sm-2" style="float: right;">
				                                                                  
						                                                              <a href="mypage.jsp"  type="button"  style="color:black" OnClick="showConfirm_delete();">삭제</a>
						                                                                 <script language="javascript">
						                                                                   function showConfirm_delete() {
						                                                                      if (confirm("삭제 하시겠습니까?")){
						                                                                           alert("삭제 완료했습니다.");
						                                                                        } 
						                                                                     else{
						                                                                            alert("취소 버튼을 눌렀습니다.");
						                                                                        }
						                                                                      }
						                                                                  </script>
						                                                              <a>|</a>
						                                                              <a href="mypage.jsp" onclick="window.close();" type="button" style="color:black">취소</a>
				                                                               </div>
				                                                            </div>
				                                                         </div>
				                                                      </div>
				                                                            
				                                                   </div>
                                                                  <td class="text-right">
                                                                      2021.11.06 17:37
                                                                  </td>
                                                              
                                                              </tr>
                                                             
                                                          </tbody>
                                                      </table>
                                                  </div>
                                              
                                          </div>
                                      </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

<!-- ============================회원 리뷰 목록============================= -->     
                                 <tr>
                                    <td>
                                        <button class="btn btn-block btn-outline-dark" data-toggle="collapse" data-target="#faq3">
                                            
                                          회원 리뷰 목록
                                         </button>
                                         <div id="faq3" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                <div class="col-sm-13" style="float: center;">
                                          <div class="card" id="title-content">
                                              
                                              
                                                  <div class="table-responsive">
                                                      <table class="table">
                                                          <thead class=" text-primary">
                                                              <th colspan="1">
                                                                  번호
                                                              </th>
                                                              <th colspan="2">
                                                                  제목
                                                              </th>
                                                              <th class="text-right">
                                                                  작성 시간
                                                              </th>
                                                          </thead>
                                                          <tbody>
                                                              <tr>
                                                                  <td>
                                                                      1
                                                                  </td>
                                                                  <td colspan="2">
                                                                      
				                                                   <a href=#none id="show_reveiw_1" onclick="if(hide_reveiw_1.style.display=='none') {hide_reveiw_1.style.display='';show_reveiw_1.innerText='대구 달서구 상인동 홍콩반점'} else {hide_reveiw_1.style.display='none';show_reveiw_1.innerText='대구 달서구 상인동 홍콩반점'}">
				                                                   대구 달서구 상인동 홍콩반점</a>
				                                                      <div id="hide_reveiw_1" style="display: none">
				                                                         <div class="card" id="title-content">
				                                                            <div class="col-sm-12">
				                                                               
																				    <table class="col-md-12" border="1" cellspacing="0" cellpadding="0">
																				    <tr>
																				    <td align="center" colspan="2">
																				      <div>리뷰수정하기</div> 
																				   </td>
																				   </tr>
																				    
																				<br>
																				
																				   <tr>
																				    <td align="center" colspan="2">
																				      <div class="star-rating space-x-4 mx-auto">
																				         <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
																				         <label for="5-stars" class="star pr-4">★</label>
																				         <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
																				         <label for="4-stars" class="star">★</label>
																				         <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
																				         <label for="3-stars" class="star">★</label>
																				         <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
																				         <label for="2-stars" class="star">★</label>
																				         <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
																				         <label for="1-star" class="star">★</label>
																				      </div> 
																				   </td>
																				   </tr>
																				   
																				  <tr>
																				    <td align="center" width="100%">
																				     <textarea name="content" rows="13" cols="40" class="form-control" placeholder="매장에 대한 리뷰를 작성해주세요.(필수)"></textarea>
																				     </td>
																				  </tr> 
																				  <tr>
																				    <td width="100%">
																				  	<div style='width:100px;float: left;'>
																				       <label type="file" class ="input-file-button" for="imageFile">
																				         업로드
																				      <input type="file" size="40" maxlength="30" id="imageFile" name="imageFile " style = "display:none" accept="image/*">
																				      </label></div>
																				      
																				      <div style='width:200px;float: right;'>
																				  <input type="button" value="삭제" style="color:white" class="btn btn-check"
																				  OnClick="showConfirm_delete();">
																				     <script language="javascript">
																				       function showConfirm_delete() {
																				          if (confirm("리뷰 삭제를 하시겠습니까?")){
																				               alert("리뷰 삭제를 완료했습니다.");
																				            } 
																				         else{
																				                alert("취소 버튼을 눌렀습니다.");
																				            }
																				          }
																				      </script>
																				  <input type="button" value="수정" style="color:white" class="btn btn-check"
																				  OnClick="showConfirm_modify();">
																				     <script language="javascript">
																				       function showConfirm_modify() {
																				          if (confirm("리뷰 수정을 하시겠습니까?")){
																				               alert("리뷰 수정을 완료했습니다.");
																				            } 
																				         else{
																				                alert("취소 버튼을 눌렀습니다.");
																				            }
																				          }
																				      </script>
																				  <a href="mypage.jsp" onclick="window.close();" type="button"  style="color:white" class="btn btn-check">취소</a>
																				  </div>
																				  </td>
																				  </tr>
																				  
																				  
																				</form>      
																				</table>    
				                                                            </div>
				                                                         </div>
				                                                      </div>
				                                                            
				                                                   </div>
                                                                  <td class="text-right">
                                                                      2021.11.04 15:37
                                                                  </td>
                                                              
                                                              </tr>
                                                               <tr>
                                                                  <td>
                                                                      2
                                                                  </td>
                                                                  <td colspan="2">
                                                                      
				                                                   <a href=#none id="show_reveiw_2" onclick="if(hide_reveiw_2.style.display=='none') {hide_reveiw_2.style.display='';show_reveiw_2.innerText='대구 수성구 알파시티 맘스터치'} else {hide_reveiw_2.style.display='none';show_reveiw_2.innerText='대구 수성구 알파시티 맘스터치'}">
				                                                   대구 수성구 알파시티 맘스터치</a>
				                                                      <div id="hide_reveiw_2" style="display: none">
				                                                         <div class="card" id="title-content">
				                                                            <div class="col-sm-12">
				                                                               
																				    <table class="col-md-12" border="1" cellspacing="0" cellpadding="0">
																				    <tr>
																				    <td align="center" colspan="2">
																				      <div>리뷰수정하기</div> 
																				   </td>
																				   </tr>
																				    
																				<br>
																				
																				   <tr>
																				    <td align="center" colspan="2">
																				      <div class="star-rating space-x-4 mx-auto">
																				         <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
																				         <label for="5-stars" class="star pr-4">★</label>
																				         <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
																				         <label for="4-stars" class="star">★</label>
																				         <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
																				         <label for="3-stars" class="star">★</label>
																				         <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
																				         <label for="2-stars" class="star">★</label>
																				         <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
																				         <label for="1-star" class="star">★</label>
																				      </div> 
																				   </td>
																				   </tr>
																				   
																				  <tr>
																				    <td align="center" width="100%">
																				     <textarea name="content" rows="13" cols="40" class="form-control" placeholder="매장에 대한 리뷰를 작성해주세요.(필수)"></textarea>
																				     </td>
																				  </tr> 
																				  <tr>
																				    <td width="100%">
																				  	<div style='width:100px;float: left;'>
																				       <label type="file" class ="input-file-button" for="imageFile">
																				         업로드
																				      <input type="file" size="40" maxlength="30" id="imageFile" name="imageFile " style = "display:none" accept="image/*">
																				      </label></div>
																				      
																				      <div style='width:200px;float: right;'>
																				  <input type="button" value="삭제" style="color:white" class="btn btn-check"
																				  OnClick="showConfirm_delete();">
																				     <script language="javascript">
																				       function showConfirm_delete() {
																				          if (confirm("리뷰 삭제를 하시겠습니까?")){
																				               alert("리뷰 삭제를 완료했습니다.");
																				            } 
																				         else{
																				                alert("취소 버튼을 눌렀습니다.");
																				            }
																				          }
																				      </script>
																				  <input type="button" value="수정" style="color:white" class="btn btn-check"
																				  OnClick="showConfirm_modify();">
																				     <script language="javascript">
																				       function showConfirm_modify() {
																				          if (confirm("리뷰 수정을 하시겠습니까?")){
																				               alert("리뷰 수정을 완료했습니다.");
																				            } 
																				         else{
																				                alert("취소 버튼을 눌렀습니다.");
																				            }
																				          }
																				      </script>
																				  <a href="mypage.jsp" onclick="window.close();" type="button"  style="color:white" class="btn btn-check">취소</a>
																				  </div>
																				  </td>
																				  </tr>
																				  
																				  
																				</form>      
																				</table>    
				                                                            </div>
				                                                         </div>
				                                                      </div>
				                                                            
				                                                   </div>
                                                                  <td class="text-right">
                                                                      2021.11.05 16:37
                                                                  </td>
                                                              
                                                              </tr>
                                                              <tr>
                                                                  <td>
                                                                      3
                                                                  </td>
                                                                  <td colspan="2">
                                                                      
				                                                   <a href=#none id="show_reveiw_3" onclick="if(hide_reveiw_3.style.display=='none') {hide_reveiw_3.style.display='';show_reveiw_3.innerText='대구 북구 팔거역 버거킹'} else {hide_reveiw_3.style.display='none';show_reveiw_3.innerText='대구 북구 팔거역 버거킹'}">
				                                                   대구 북구 팔거역 버거킹</a>
				                                                      <div id="hide_reveiw_3" style="display: none">
				                                                         <div class="card" id="title-content">
				                                                            <div class="col-sm-12">
				                                                               
																				    <table class="col-md-12" border="1" cellspacing="0" cellpadding="0">
																				    <tr>
																				    <td align="center" colspan="2">
																				      <div>리뷰수정하기</div> 
																				   </td>
																				   </tr>
																				    
																				<br>
																				
																				   <tr>
																				    <td align="center" colspan="2">
																				      <div class="star-rating space-x-4 mx-auto">
																				         <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
																				         <label for="5-stars" class="star pr-4">★</label>
																				         <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
																				         <label for="4-stars" class="star">★</label>
																				         <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
																				         <label for="3-stars" class="star">★</label>
																				         <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
																				         <label for="2-stars" class="star">★</label>
																				         <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
																				         <label for="1-star" class="star">★</label>
																				      </div> 
																				   </td>
																				   </tr>
																				   
																				  <tr>
																				    <td align="center" width="100%">
																				     <textarea name="content" rows="13" cols="40" class="form-control" placeholder="매장에 대한 리뷰를 작성해주세요.(필수)"></textarea>
																				     </td>
																				  </tr> 
																				  <tr>
																				    <td width="100%">
																				  	<div style='width:100px;float: left;'>
																				       <label type="file" class ="input-file-button" for="imageFile">
																				         업로드
																				      <input type="file" size="40" maxlength="30" id="imageFile" name="imageFile " style = "display:none" accept="image/*">
																				      </label></div>
																				      
																				      <div style='width:200px;float: right;'>
																				  <input type="button" value="삭제" style="color:white" class="btn btn-check"
																				  OnClick="showConfirm_delete();">
																				     <script language="javascript">
																				       function showConfirm_delete() {
																				          if (confirm("리뷰 삭제를 하시겠습니까?")){
																				               alert("리뷰 삭제를 완료했습니다.");
																				            } 
																				         else{
																				                alert("취소 버튼을 눌렀습니다.");
																				            }
																				          }
																				      </script>
																				  <input type="button" value="수정" style="color:white" class="btn btn-check"
																				  OnClick="showConfirm_modify();">
																				     <script language="javascript">
																				       function showConfirm_modify() {
																				          if (confirm("리뷰 수정을 하시겠습니까?")){
																				               alert("리뷰 수정을 완료했습니다.");
																				            } 
																				         else{
																				                alert("취소 버튼을 눌렀습니다.");
																				            }
																				          }
																				      </script>
																				  <a href="mypage.jsp" onclick="window.close();" type="button"  style="color:white" class="btn btn-check">취소</a>
																				  </div>
																				  </td>
																				  </tr>
																				  
																				  
																				</form>      
																				</table>    
				                                                            </div>
				                                                         </div>
				                                                      </div>
				                                                            
				                                                   </div>
                                                                  <td class="text-right">
                                                                      2021.11.06 17:37
                                                                  </td>
                                                              
                                                              </tr>
                                                             
                                                          </tbody>
                                                      </table>
                                                 	 </div>
                                              
		                                          </div>
		                                      </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </div>
        </div>
        
    </div>
    
</div>

     <!--=============================== 회원탈퇴 =============================-->
   <div>
        <!-- Swiper -->
        <div class="row d-flex justify-content-center">
            <div class="col-md-12">
                <div class="slider-title_box">
                    <div class="row">
                     
             		<div class="container" style = "margin-bottom: 20px;" >
   		
          			<button type="button" class="btn btn-warning" onclick="showConfirm();">회원탈퇴</button>
  			 </div>
        </div>
    </div>
    </div>
    </div>
  
  
  
  
    <script>
		 function showConfirm() {
				/*alert 확인 버튼만,confirm 확인 취소 버튼 둘다 */
			  if (confirm("회원 탈퇴 하시겠습니까?")==true) {    //확인을 누른다면                 
				window.open("../user_infoDelete.dae?user_id=<%=user_id%>", "user_idDeleteWindow",
				"width=300,height=200 left = 580, top=610");		
			  }   
			  else { 
			   return false;
			  } 
			 }
		 </script>

    <!--============================= FOOTER =============================-->
    <%@include file ="/common/footer-center.jsp" %>
    <!-- Footer End-->
  




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src="../js/jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="../js/swiper.min.js"></script>
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
  
   <!--  <script >
      function showConfirm1() {
             
    	
        var user_pw1 = document.getElementById("user_pw1");
        var user_pw2 = document.getElementById("user_pw2");

        if (user_pw1.value == ""){
           alert("비밀번호를 입력해주세요");
           form.user_pw1.focus();
           return false;
      }
        else if (user_pw2.value == ""){
          alert("비밀번호를 한번 더 입력해주세요");
          form.user_pw2.focus();
          return false;
     }
                                   
      	if(user_pw1.value != user_pw2.value){
          form.user_pw1.focus();
          form.user_pw2.focus();
          return false;
   	}
  }
	</script> -->


</body>
</html>