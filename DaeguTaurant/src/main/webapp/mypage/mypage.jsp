<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp>
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
    <div class="dark-hg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="../home_review/index.jsp"><img src="../images/logo.png" alt="logo" /> </a>
                       
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="icon-menu"></span>
            </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                               
                                <li><a href="../login/login.jsp" class="btn btn-outline-light top-btn" id ="login-text"><span class="ti-plus"></span> 로그인</a></li>
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
                                <input type="text" class="form-control" id="inputType1" name="" readonly value="이름">
                              </div>
                            </div>
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType12">닉네임</label>
                              </div>
                              <div class="col-md-9 showcase_content_area">
                                <input type="email" class="form-control" id="inputType2" name="" readonly value="닉네임">
                              </div>
                            </div>
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType13">아이디(이메일)</label>
                              </div>
                              <div class="col-md-9 showcase_content_area">
                                <input type="email" class="form-control" id="inputType3" name="" readonly value="아이디"> 
                              </div>
                            </div>
                            
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType1">새 비밀번호</label>
                              </div>
            
                              <div class="col-md-9 showcase_content_area">
                                <input type="password" class="form-control" id="inputType4" >
                              </div>
                            </div>
            
                            <div class="form-group row showcase_row_area">
                              <div class="col-md-3 showcase_text_area">
                                <label for="inputType1">비밀번호 확인</label>
                              </div>
                              <div class="col-md-7 showcase_content_area">
                                <input type="password" class="form-control" id="inputType5" > 
                              </div>
                              <div class="col-md-2 showcase_content_area">
                                <button a href="../home_review/index.jsp" type="submit" class="btn btn-check" onclick="showConfirm1();"> 변경하기 </button>
                                <script language="javascript">
									 function showConfirm1() {
									 if (confirm("비밀번호를 변경하시겠습니까?"))
									  {
									   alert("비밀번호를 변경했습니다.");
									  } 
									 else {
									   alert("취소 버튼을 눌렀습니다.");
									 }
									 }
								</script>
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
       <a href="../home_review/index.jsp" button class="btn btn-warning" onclick="showConfirm();">회원탈퇴</a></button>
       <script language="javascript">
		 function showConfirm() {
			 if (confirm("회원 탈퇴 하시겠습니까?"))
			  {
			   alert("회원 탈퇴를 완료했습니다..");
			  } else {
			   alert("취소 버튼을 눌렀습니다.");
			  }
			 }
		 </script>
   </div>

    <!--============================= FOOTER =============================-->
    <footer>
       <!-- Footer Start-->
       <div class="main-block dark-bg ">
           <div class="container">
               <div class="row d-flex justify-content-between">
               
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                      <div class="copyright mb-30">
                         <!-- logo -->
                           <a href="../home_review/index.jsp"><img src="../images/logo.png" alt="logo"></a>
                      
                         <div class="footer-pera">
                              <p><script>document.write(new Date().getFullYear());</script> 대구토랑 | 2021-12-16 </p>
                         </div>
                      </div>
                   </div>
                   
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h6>제작자</h6>
                               <ul id = "footer-maker">
                                   <li >김수빈</li>
                                   <li>박태림</li>
                                   <li>이광준</li>
                                   <li>장용성</li>
                               </ul>
                           </div>
                       </div>
                   </div>
                  
                   <div class="col-xl-3 col-lg-3 col-md-4  col-sm-5">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h6>찾아오시는 길</h6>
                               <ul id = "footer-maker" >
                                   <li>대구 수성구 알파시티</li>
                                   <li>스마트융합인재개발원</li>
                               </ul>
                             
                            </div>
                       </div>
                    </div>
                           
                     <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                          	 <a href="../servicecenter/servicecenter.jsp" target="_blank">고객센터</a>
                               <ul id = "footer-maker" >
                                   <li>공지사항</li>
                                   <li>FAQ</li>
                                   <li>1:1문의</li>
                               </ul>
                           
                                
                           </div>
                       </div>
                   </div>
                       </div>
                   </div>
               </div>
       <!-- Footer End-->
   </footer>




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

</body>
</html>