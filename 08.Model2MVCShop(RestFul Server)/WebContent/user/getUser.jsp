<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>개인정보조회</title>
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- Optional theme -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
			$(function() {
				$("a[href='#' ]:contains('수정')").on("click" , function() {
					$(self.location).attr("href", "/user/updateUser?userId=${user.userId}");
				});
				
				$("a[href='#' ]:contains('확인')").on("click" , function() {
					$(self.location).attr("href", "../main.jsp");
				});
			});
	</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="bd-example">
        <table class="table table-striped">
		<thead>
		<tr>
			<th scope="col" style="width: 20%;">개인정보조회</th>
			<th></th>
		</tr>
		</thead>
		<tr>
            <th scope="row">아이디</th>
            <td>${user.userId}</td>
		</tr>
		<tr>
            <th>이름</th>
            <td>${user.userName}</td>
		</tr>
		<tr>
            <th>주소</th>
            <td>${user.addr}</td>
		</tr>
		<tr>
            <th>휴대전화번호</th>
            <td>${ !empty user.phone ? user.phone : ''}</td>
		</tr>
		<tr>
            <th>이메일</th>
            <td>${user.email}</td>
		</tr>
		<tr>
            <th>가입일자</th>
            <td>${user.regDate}</td>
		</tr>
        </table>
	</div>

	<p class="text-end">
		<a class="btn btn-lg" href="#" role="button" style="background-color: #cecdcd;">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="btn btn-lg" href="#" role="button" style="background-color: #cecdcd;">확인</a>
	</p>
	
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script> -->

</body>
</html>