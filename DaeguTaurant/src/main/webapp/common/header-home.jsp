
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
 <%-- <%
	String user_id = (String)session.getAttribute("user_id");
	String user_pw = (String)session.getAttribute("user_pw");
	String user_nickname = (String)session.getAttribute("user_nickname");
 	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
%>   --%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>  


<!DOCTYPE html>
<html>
<body>
<div class="nav-menu">
        <div class="bg transition">
            <div class="container-fluid fixed">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="${pageContext.request.contextPath }/home_review/index.jsp"><img src="${pageContext.request.contextPath }/images/logo.png" alt="logo" /> </a>

                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" 
                            			aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                			<span class="icon-menu"></span>
             				 </button>
                            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            
                            
                                <ul class="navbar-nav" >  
                                                       
                                   
						
						<c:if test="${loginUser.user_id != null }">
 
						<li><a href = "${pageContext.request.contextPath }/logout.dae" class="logout-text top-btn"  >로그아웃</a></li>
					
											
<li><a href = "${pageContext.request.contextPath }/myreviewlist.dae?user_id=${loginUser.user_id}" class="btn btn-outline-light top-btn" id = "login-text">${loginUser.user_nickname }</a></li> 								
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
    </div>

</body>
</html>