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
   <table width="400" border="1" cellspacing="0" cellpadding="0"
   align="center">
    <tr>
    <td align="center" colspan="2">
      <div>리뷰작성하기</div> 
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
     <textarea name="content" rows="13" cols="40" class="form-control" placeholder="매장에 대한 리뷰를 작성해주세요.(필수)"></textarea></td>
  </tr> 
  <tr>
    <td  align="left" width="100%">
       <label type="file" class ="input-file-button" for="imageFile">
         업로드
      <input type="file" size="40" maxlength="30" id="imageFile" name="imageFile " style = "display:none" accept="image/*">
      </label>
      </td>
  </tr>
  
  <tr>      
 <td colspan=2 " align="center"> 
  <input type="button" value="등록" style="color:white" class="btn btn-check"
  OnClick="showConfirm1();">
     <script language="javascript">
       function showConfirm1() {
          if (confirm("리뷰 등록을 하시겠습니까?")){
               alert("리뷰 등록을 완료했습니다.");
               window.close();
            } 
         else{
                alert("취소 버튼을 눌렀습니다.");
            }
          }
      </script>
  <a href="../home_review/index.jsp" onclick="window.close();" type="button"  style="color:white" class="btn btn-check">취소</a>
</td></tr>
  
</form>      
</table> 

</body>
</html>