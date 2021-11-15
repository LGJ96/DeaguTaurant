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
   
    
    <!-- 글쓰기 본문 -->
    
   <div class="container" style = "margin-top : 50px;" align="center"  >
	 <div class="col-md-5">
		
		<input type="text"  placeholder="문의 제목" name="qTitle" maxlength="100" id = "qtitle" style = "width : 100">
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
						<tr>
							<td><textarea class="form-control" placeholder="문의 내용" name="qContent" maxlength="100" style="height: 200px;"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
					</div>
			
<!-- 글쓰기 버튼 생성 -->
	<div align="center">
 	<input type="submit" class="btn btn-warning"  value="등록">
 	<script language="javascript">
       function showConfirm1() {
          if (confirm("1:1문의를 등록하시겠습니까?")){
               alert("등록 완료.");
               window.close();
            } 
         else{
                alert("취소");
            }
          }
      </script>
	<a href="../servicecenter/servicecenter.html" onclick="window.close();" type="button" class="btn btn-warning">취소</a>

	</div>
		

</body>
</html>