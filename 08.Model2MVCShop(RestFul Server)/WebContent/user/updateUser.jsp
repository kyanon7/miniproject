<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 정보 수정</title>
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- Optional theme -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncUpdateUser() {
		var name=$("input[name='userName']").val();
		
		if(name == null || name.length <1){
			alert("이름은  반드시 입력하셔야 합니다.");
			return;
		}
		
		var value = "";	
		if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
			var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
		}
		
		$("input:hidden[name='phone']").val( value );
		
		$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
	}

		$(function() {
			$("a[href='#']:contains('확인')").on("click" , function() {
				fncUpdateUser();
			});
		});	

		$(function() {
			
			$("input[name='email']").on("change" , function() {
					
				var email=$("input[name='email']").val();
			
				if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
				alert("이메일 형식이 아닙니다.");
				}
			});
			
		});	
		
		
		$(function() {
			$("a[href='#']:contains('취소')").on("click" , function() {
				$(self.location).attr("href", "/user/getUser?userId=${sessionScope.user.userId}");
			});
		});
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<form name="detailForm"  method="post" >

		<input type="hidden" name="userId" value="${user.userId}">
		<input type="hidden" name="phone">

		<div class="bd-example">
			<table class="table table-striped">
			<thead>
			<tr>
				<th scope="col" style="width: 20%;">회원정보수정</th>
				<th></th>
			</tr>
			</thead>
			<tr>
				<th scope="row">아이디</th>
				<td>${user.userId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="userName" value="${user.userName}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" value="${user.addr}"></td>
			</tr>
			<tr>
				<th>휴대전화번호</th>
				<td>
					<select name="phone1" style="width: 100px; height: 25px;">
						<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
						<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
						<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
						<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
						<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
					</select>
					<input type="text" name="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}">
					<input type="text" name="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${user.email}"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>${user.regDate}</td>
			</tr>
			</table>
		</div>

		<p class="text-end">
			<a class="btn btn-lg" href="#" role="button" style="background-color: #cecdcd;">확인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-lg" href="#" role="button" style="background-color: #cecdcd;">취소</a>
		</p>

	</form>

</body>
</html>