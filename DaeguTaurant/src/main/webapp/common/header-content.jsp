<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	String user_pw = (String)session.getAttribute("user_pw");
	String user_nickname = (String)session.getAttribute("user_nickname");
 	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
%>   
<!DOCTYPE html>
<html>
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
                                              
						<%
							if(user_id != null) {
									
						%> 
						<li><a href = "${pageContext.request.contextPath }/logout.dae" class="logout-text top-btn"  >로그아웃</a></li>
											
											
 						<li><a href = "${pageContext.request.contextPath }/mypage/mypage.jsp" class="btn btn-outline-light top-btn" id = "login-text"><%=loginUser.getUser_nickname()%></a></li>
 								
												
						<%
						}
							else{
						%>
						<li><a href="./login/login.jsp" class="btn btn-outline-light top-btn" id = "login-text">
						<span class="ti-plus" ></span> 로그인</a></li>
								
						<%
						}
						%>
                             <li>
                             
                             </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>

<body>

</body>
</html>