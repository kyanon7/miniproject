<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->

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

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
		<div class="container-fluid">
			<a class="navbar-brand" href="/index.jsp">
				<img class="img" src="/images/bit-logo.svg" style="background-color: #ffffff;">&nbsp; Model2 MVC Shop</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
					data-bs-target="#navbarColor03" aria-controls="navbarColor03" 
					aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span></button>

			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="#">상품검색</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">최근 본 상품</a>
					</li>
				</ul>
			</div>

			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="#">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">로 그 인</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container bg-light p-5">
		<h1 class="display-3">Model2 MVC Shop</h1>
		<p class="lead">로그인 후 사용 가능...</p>
		<p class="lead">로그인 전 검색만 가능합니다.</p>
		<p class="lead">회원가입 하세요.</p>
		<hr class="my-4">
		<p class="text-center">
			<a class="btn btn-primary btn-lg" href="#" role="button">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-primary btn-lg" href="#" role="button">로 그 인</a>
		</p>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>

</html>