<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<form action="#" method="POST" name = "searchform2" >
<div class="dark-hg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="home_review/index.jsp"><img src="images/logo.png" alt="logo" /> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
             			 <span class="icon-menu"></span>
            			</button>
				                     
				
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                     
                            <ul class="navbar-nav">
                            
                           <c:if test="${loginUser.user_level == 9}"> 
                            <li><input type="text" placeholder="검색창" class="btn" name ="searchword1" id="searchword1" 
                            onkeypress="if(event.keyCode == 13) enterkey()"></li>
                       		<li><button type="button" class="btn" onclick="search2()" style = "margin-right: 50px;">검색</button></li>
                        	</c:if>
                        	
                    	<c:if test="${loginUser.user_id != null }">
 
						<li><a href = "${pageContext.request.contextPath }/logout.dae" class="logout-text top-btn"  >로그아웃</a></li>
					
											
 						<li><a href = "${pageContext.request.contextPath }/mypage/mypage.jsp" class="btn btn-outline-light top-btn" id = "login-text">${loginUser.user_nickname }</a></li>
 								
						</c:if>					
					
						<c:if test="${loginUser.user_id == null }">
						<li><a href="${pageContext.request.contextPath }/login/login.jsp" class="btn btn-outline-light top-btn" id = "login-text">
						<span class="ti-plus" ></span> 로그인</a></li>
								
						</c:if>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
                        </form>

</body>


  <script>
    
    function search2(){
    	document.searchform2.target = "_self";
    	document.searchform2.action="service_Search.dae";
    	document.searchform2.submit();
    }
    </script> 

      <script>
    function enterkey() {
        if (window.event.keyCode == 13) {
        	
        	document.searchform2.action="service_Search.dae";
        }
    }

    </script>
    



</html>