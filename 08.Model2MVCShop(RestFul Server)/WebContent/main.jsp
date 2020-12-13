<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Model2MVCShop</title>
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- Optional theme -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		$( function() {
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				location.href = "/user/addUser"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				location.href = "/user/login"
			});
		});

		$( function() {
			$("a[href='#' ]:contains('상품검색')").on("click" , function() {
				location.href = "/product/listProduct?menu=search"
			});
		});

		$( function() {
			$("a[href='#' ]:contains('최근 본 상품')").on("click" , function() {
				popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			});
		});
		
	</script>
	
</head>
<!DOCTYPE html>
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<!--<style>
        body {
            padding-top : 70px;
        }
   	</style>-->
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

   	<div class="container bg-light p-5">
		<h1>Model2MVCShop </h1>
		<p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
		<hr class="my-4">
		<h3>나폴레옹은 이렇게 말했다.</h3>
		<p>"오늘 나의 불행은 언젠가 내가 잘못 보낸 시간의 보복이다."</p><br />
		<h3>"... 장벽은 절실하게 원하지 않는 사람들을 걸러내려고 존재합니다. 장벽은. 당신이 아니라 '다른' 사람들을 멈추게 하려고 거기 있는 것이지요."</h3><br />
		<p class="h3">혜광스님</p>
		<p>행복한 삶의 비결은.</p>
		<p>좋아하는 일을 하는 것이 아리라,</p>
		<p>지금 하는 일을 좋아하는 것입니다.</p>
	</div>
</body>

</html>