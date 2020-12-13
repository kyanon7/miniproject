<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	//============= logout Event  처리 =============
	$(function() {
		$( "a:contains('회원정보조회')" ).on("click" , function() {
			$(self.location).attr("href", "/user/listUser");
		}); 
	
		$( "a:contains('개인정보조회')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});

		$( "a:contains('판매상품등록')" ).on("click" , function() {
			$(self.location).attr("href","../product/addProductView.jsp");
		});

		$( "a:contains('판매상품검색')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});

		$( "a:contains('상품검색')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=search");
		});

		$( "a:contains('구매이력조회')" ).on("click" , function() {
			$(self.location).attr("href","/purchase/listPurchase");
		});

		$( "a:contains('판매이력조회')" ).on("click" , function() {
			$(self.location).attr("href","/purchase/listSale");
		});

		$( "a[href='#' ]:contains('최근 본 상품')" ).on("click" , function() {
			popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});

		$( "a:contains('로그아웃')" ).on("click" , function() {
			$(self.location).attr("href","/user/logout");
		});
	});
	
</script>

<!-- ToolBar Start /////////////////////////////////////-->
	   
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#8CABD9;">
	<div class="container-fluid">
		<a class="navbar-brand" href="/index.jsp">
			<img class="img" src="/images/bit-logo.svg" style="background-color: #ffffff;">&nbsp; Model2 MVC Shop</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
				data-bs-target="#navbarColor03" aria-controls="navbarColor03" 
				aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span></button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button" 
					id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
						회원관리</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<c:if test="${ !empty user }">
							<li><a class="dropdown-item" href="#">개인정보조회</a></li>
						</c:if>
						<c:if test="${ !empty user && user.role == 'admin' }">
							<li><a class="dropdown-item" href="#">회원정보조회</a></li>
						</c:if>
					</ul>
				</div>
				
				<c:if test="${user.role == 'admin'}">
					<div class="dropdown">
						<a class="btn dropdown-toggle" href="#" role="button" 
						id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							판매상품관리</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="#">판매상품등록</a></li>
							<li><a class="dropdown-item" href="#">판매상품검색</a></li>
						</ul>
					</div>
				</c:if>

				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button" 
					id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
						상품구매</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<c:choose>
							<c:when test="${ !empty user && user.role == 'user' }">
								<li><a class="dropdown-item" href="#">구매이력조회</a></li>
							</c:when>
							<c:when test="${ !empty user && user.role == 'admin' }">
							<li><a class="dropdown-item" href="#">판매이력조회</a></li>
							</c:when>
						</c:choose>
						<li>
							<a class="dropdown-item" href="#">상품검색</a>
						</li>
					</ul>
				</div>

				<div>
					<li class="nav-item">
						<a class="nav-link" href="#">최근 본 상품</a>
					</li>
				</div>
			</ul>
		</div>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link" href="#">로그아웃</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- ToolBar End /////////////////////////////////////-->