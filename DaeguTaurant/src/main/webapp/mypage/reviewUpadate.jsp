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
<form action="${pageContext.request.contextPath }/reviewupdatePro.dae" method="POST" name="restreviewupdate"  onsubmit="return writeSave()" > 

<input type="hidden" name="rev_res_id" value="${restVO.res_id}"/>
<input type="hidden" name="user_id" value="${loginUser.user_id}"/>
<input type="hidden" name="user_nickname" value="${loginUser.user_nickname}"/>


 <input type="hidden" name="rev_id" value="${reviewarticle.getRev_id()}">

   <table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
    <tr>
    <td align="center" colspan="2">
      <div>리뷰수정</div> 
   </td>
   </tr>
    
<br>
  
   
   <tr>
   	<td align="center" colspan="2">
     <div class="star-rating space-x-4 mx-auto">
 
     <select name = "review" title ="평점" id = "review" class = "col-sm-3" >
     		<option value = "${reviewarticle.res_score}"style='background-color:#ababab' > ${reviewarticle.res_score}-지금평점 </option> 
			<option value = "5.0" > 5 </option>
			<option value = "4.0"> 4 </option>
			<option value = "3.0" > 3 </option>
			<option value = "2.0" > 2 </option>
			<option value = "1.0" > 1 </option>
	</select>
  	 </div>
   	</td>
   </tr>
    
  
  <tr>
    <td align="center" width="100%">
     <textarea rows="13" cols="40" class="form-control"  id = "rev_content" name ="rev_content">${reviewarticle.getRev_content()}</textarea></td>
  </tr> 
  <%-- <tr>
    <td  align="left" width="100%">
      
      <input type="file" size="40" maxlength="30" id="rev_pic" name="rev_pic"  accept="image/*" value ="${reviewarticle.rev_pic}">
     
      </td>
  </tr> --%>
  
  <tr>      
 <td colspan=2 " align="center"> 
   <input type="submit" value="수정"  class="btn btn-check" >
  
    <input type="button" class="btn btn-check" value="취소"
 	 OnClick="window.close();">
  
  </td></tr>
  
  
</table> 
</form> 
<script >

 
/* function showConfirm2() {
    if (confirm("리뷰 수정 하시겠습니까?") == true){
   	document.restreviewupdate.action="reviewupdatePro.dae;
       document.restreviewupdate.submit();
      
       
         window.close();
      } 
   else{
          alert("취소 버튼을 눌렀습니다.");
      }
    } */
</script>  
   
</body>




</html>