<%@page import="comm.vo.CommentReplyVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="comm.vo.CommPageVO"%>
<%@page import="comm.vo.CommVO"%>
<%@page import="comm.vo.CommentPageVO"%>
<%@page import="comm.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
 
<%
    // 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
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
 
<script type="text/javascript">
        function changeView(value)
        {
            if(value == 0)    
                location.href='commList.dae?pageNum=${com_currentPage}';
            else if(value == 1)
                location.href='commReplyForm.dae?com_number=${commVO.com_number}&pageNum=${com_currentPage}';
        }
        
        function doAction(value)
        {
            if(value == 0) // 수정
                location.href="com_updateForm.dae?com_number=${commVO.com_number}&pageNum=${com_currentPage}";
            else if(value == 1) // 삭제
                location.href="com_deleteForm.dae?com_number=${commVO.com_number}";
        }
        
 
        var httpRequest = null;
        
        // httpRequest 객체 생성
        function getXMLHttpRequest(){
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
        }
        
        // 댓글 등록
        function writeCmt()
        {
            var form = document.getElementById("comment_writePro");
            
            var board = form.com_number.value
            var id = form.user_nickname.value
            var content = form.comment_content.value;
            
            if(!content)
            {
                alert("내용을 입력하세요.");
                return false;
            }
            else
            {    
                var param="com_number="+board+"&user_nickname="+id+"&comment_content="+content;
                    
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = checkFunc;
                httpRequest.open("POST", "comment_writePro.dae", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
                httpRequest.send(param);
            }
        }
        
        function checkFunc(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 1){ 
                    document.location.reload(); // 상세보기 창 새로고침
                }
            }
        }
    
    </script>

</head>
<%
   SimpleDateFormat sdf = 
   new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%-- <% 
	CommentReplyVO commentReplyVO = (CommentReplyVO)request.getAttribute("commentReplyVO");
	int comment_number = commentReplyVO.getComment_number();
	int comment_ref = commentReplyVO.getComment_ref();
	int comment_re_step = commentReplyVO.getComment_re_step();
	int comment_re_level = commentReplyVO.getComment_re_level();
%> --%>
<%-- <%
List<CommVO> comArticleList = (List<CommVO>)request.getAttribute("comArticleList");
CommPageVO comPageVO = (CommPageVO)request.getAttribute("comPageVO");
int com_currentPage = comPageVO.getCom_currentPage();
%> --%>
<%
	CommVO comArticle = (CommVO)request.getAttribute("comArticle");
    String com_pageNum = (String)request.getAttribute("com_pageNum");
 %>
<%
	CommentVO commentArticle = (CommentVO)request.getAttribute("commentArticle");
    String comment_pageNum = (String)request.getAttribute("comment_pageNum");
 %>
<body>

<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>



    <!--============================= HEADER =============================-->
   <%@include file ="/common/header-content.jsp" %>
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
   <c:if test = "${loginUser.user_nickname == comArticle.user_nickname or loginUser.user_level == 9}">
	 <a href="comm_updateForm.dae?com_number=${comArticle.com_number}&com_pageNum=${commPageVO.com_currentPage}"><button class="btn btn-warning1"  style="cursor:pointer"> 수정</button></a>
	 <a href="comm_deletePro.dae?com_number=${comArticle.com_number}&com_pageNum=${commPageVO.com_currentPage}"><button class="btn btn-warning1"  style="cursor:pointer"> 삭제</button></a>
	</c:if>
	</div>
	 <div class="col-lg-12">
		<form method="post" action="writeAction.jsp">
		   <div class="row">
              <div class="col-md-12"> 
              	<div class = "cold-md-2" id = "title1">
              		<!-- 자유/정보 -->${comArticle.com_subject}<%-- <%=comArticle.getCom_subject() %> --%>
              	</div>
                <div class = "col-md-2" id = "title2"  >
					<!-- 작성자 -->${comArticle.user_nickname}<%-- <%=comArticle.getUser_nickname() %> --%>
				</div>
                <div class = "col-md-8" id = "title2"  >
					<!-- 제목 -->${comArticle.com_title}<%-- <%=comArticle.getCom_title() %> --%>
				</div>
			</div>
		</div>
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td>
							<div contentEditable="true" style = "text-align: left;">
							  ${fn:replace(comArticle.com_content, cn, br)}<br>
							  <img src = "images/${comArticle.com_pic}.jpg"
               				   class = "productImage" width = "300px;" height = "300px;"/>
							</div>
							<%-- <textarea class="form-control" readonly placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=comArticle.getCom_content() %></textarea> --%>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				</form>
	
                <form method="post" name="writeform" action="comment_writePro.dae" onsubmit="return writeSave()">
				<input type="hidden" name="comment_number" value="${commentReplyVO.comment_number}">
				<input type="hidden" name="comment_ref" value="${commentReplyVO.comment_ref}">
				<input type="hidden" name="comment_re_step" value="${commentReplyVO.comment_re_step}">
				<input type="hidden" name="comment_re_level" value="${commentReplyVO.comment_re_level}">
				<input type="hidden" name="user_nickname" value="${loginUser.user_nickname}<%-- <%=loginUser.getUser_nickname()%> --%>">
				<input type="hidden" name="com_number" value="<%=comArticle.getCom_number()%>">
				<input type="hidden" name="com_pageNum" value="<%=com_pageNum%>">
				
				<input type="hidden" name="com_number" value="${commentArticle.com_number}">
			<div class="row" >
              <div class="col-md-12">
                <div class="form-group row " >
                  <div class="col-md-2" align="center" style = "font-size: 20px;" >
                    <label for="inputType1">댓글작성</label>
                  </div>
                  
                  <div id = "form-control2" style = "border: 1px solid #dddddd;">
                  
                   	<textarea class="form-control" id = "form-control1" name="comment_content" maxlength="500" ></textarea>
                  	<!-- <button type="submit" class="btn btn-regist" style = "float: right;"> 등록 </button> -->
                  	<button type="submit" class="btn btn-regist" style = "float: right; cursor:pointer"> 등록 </button>
                  </div>
         	    </div>
          	   </div>
             </div>
                  </form>
             
        <!-- 댓글 내용 조회 창 -->     
		 	
		<form method="post" name="updateform" action="comment_updatePro.dae" onsubmit="return writeSave()">
		<input type="hidden" name="comment_number" value="${commentArticle.comment_number}">
		<input type="hidden" name="comment_ref" value="${commentReplyVO.comment_ref}">
		<input type="hidden" name="comment_re_step" value="${commentReplyVO.comment_re_step}">
		<input type="hidden" name="comment_re_level" value="${commentReplyVO.comment_re_level}">
		<input type="hidden" name="com_number" value="${commentArticle.com_number}">
		<input type="hidden" name="com_number" value="${comArticle.com_number}">
		<input type="hidden" name="com_pageNum" value="<%=com_pageNum%>">
		<input type="hidden" name="comment_pageNum" value="${comment_pageNum }">
		<input type="hidden" name="user_nickname" value="${loginUser.user_nickname}<%-- <%=loginUser.getUser_nickname()%> --%>">
             <div id = "content-table" class="col-lg-12">
            		<c:if test="${empty commentArticleList}">
							<table width="1000" border="1" cellpadding="0" cellspacing="0">
								    <td align="center">
								     <h14>작성된 댓글이 없습니다.</h14>
								    </td>
							</table>
					</c:if>
             			<div>
             			<c:if test="${not empty commentArticleList}">
             				<c:set var = "number" value = "${commentPageVO.comment_number }"></c:set>
							<c:forEach var = "commentArticle" items = "${commentArticleList }">
             			<c:if test="${commentArticle.com_number == comArticle.com_number}">
							<c:set var = "number" value = "${commPageVO.comment_number -1}"></c:set>
          				<ul>
             			<li>
             			<div class="comment_nick_box" >
             			<div class="comment_nick_info">
             			<h6 class="comment_nickname">
            				${commentArticle.user_nickname }
        				</h6>
        				</div>
        				</div>
        				
             			<div class="comment_text_box">
             			<p class="comment_text_view">
             			<span class="text_comment" >${fn:replace(commentArticle.comment_content, cn, br) }</span>
             			</p>
             			</div>
             			
             			<c:if test = "${loginUser.user_nickname == commentArticle.user_nickname or loginUser.user_level == 9}">
             			
             			<div class="comment_info_box">
             			<span class="comment_info_date">${commentArticle.comment_date }</span>
             			
				
             			
             			<%-- <a href="#?comment_number=${commentArticle.comment_number}" style = "float: right; margin-righ: 50px; color: black"
                                        id="show${commentArticle.comment_number}" onclick="if(hide${commentArticle.comment_number}.style.display=='none') {hide${commentArticle.comment_number}.style.display='';show${commentArticle.comment_number}.innerText='취소'} else {hide${commentArticle.comment_number}.style.display='none';show${commentArticle.comment_number}.innerText='수정'}">
										수정 </a>
										
    					<div id="hide${commentArticle.comment_number}" style="display: none">
        					<div class="card" id="title-content">
					          <div class="col-sm-15">
					              <div class="text-left">
					                  <textarea class="form-control" id = "form-control1" name="comment_content" maxlength="450" >${commentArticle.comment_content}</textarea>
					                  <button type="submit" class="btn btn-regist" style = "float: right;" 
					                  onclick="location.href='comment_updatePro.dae?com_number=${comArticle.com_number}&com_pageNum=${commPageVO.com_currentPage}#?&comment_number=${commentArticle.comment_number}';"  > 수정 </button>
					              </div>
					          </div>
					        </div>
    					</div> --%>
    					
             			<a onclick="window.open('comment_updateForm.dae?comment_number=${commentArticle.comment_number}','','width=430,height=280,location=no,status=no,scrollbars=yes');" role="button" class="comment_info_button" style = "float: right; margin-righ: 50px; cursor:pointer">
        					수정
    					</a>
             			<a href="comment_deletePro.dae?com_number=${comArticle.com_number}&com_pageNum=${commPageVO.com_currentPage}&comment_number=${commentArticle.comment_number}" role="button" class="comment_info_button" style = "float: right; margin-righ: 50px; color: black; cursor:pointer">
        					삭제   |
    					</a>
    					
    					</div>
    					</c:if>
             			</li>
            			</ul>
             			</c:if>
    					</c:forEach>
             			</c:if>
             			</div>
             
              </div>
             </form>
 
<!-- 목록 버튼 -->	

	<div class="col-lg-12" align="right">
	 <a href="commList.dae"><button class="btn btn-warning" > 목록</button></a>
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