<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<link href="../css/signup.css" rel="stylesheet">

	<style>

		.form-select-phone {
			margin-top: 13px;
			height: 49px !important;
			display: inline-block;
			width: 100%;
			padding: 0.375rem 1.75rem 0.375rem 0.75rem;
			font-size: 1rem;
			font-weight: 400;
			line-height: 1.5;
			color: #212529;
			vertical-align: middle;
			background-color: #fff;
			background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
			background-repeat: no-repeat;
			background-position: right 0.75rem center;
			background-size: 16px 12px;
			border: 1px solid #ced4da;
			border-radius: 0.25rem;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
		}

		.form-control-phone {
			margin-top: 13px;
			height: 49px !important;
			display: inline-block;
			width: 39.35%;
			padding: 0.375rem 0.75rem;
			font-size: 1rem;
			font-weight: 400;
			line-height: 1.5;
			color: #212529;
			background-color: #fff;
			background-clip: padding-box;
			border: 1px solid #ced4da;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			border-radius: 0.25rem;
			transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}
	</style>

	<script type="text/javascript">

		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
		
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input[name='password2']").focus();
				return;
			}
			
			var value = "";
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			
			$("input:hidden[name='phone']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
		$(function() {
			$( "button:contains('가입 확인')" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		$(function() {
			 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
					$("form")[0].reset();
			});
		});	
	
		$(function() {
			 
			$("input:text[name='ssn']").change(function() {
				var ssn1, ssn2; 
				var nByear, nTyear; 
				var today; 

				ssn = document.detailForm.ssn.value;
				if(!PortalJuminCheck(ssn)) {
					alert("잘못된 주민번호입니다.");
					return false;
				}
			});
			
			$("input[name='email']").on("change", function() {
				
				var email=$("input[name='email']").val();
			    
				if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
					alert("이메일 형식이 아닙니다.");
					return false;
			    }
			});
			
			$("select[name='phone1']").change(function() {
				$("input[name='phone2']").focus();
			});
		});
		

		function PortalJuminCheck(fieldValue){
			var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
			if (!pattern.test(num)) return false; 
			num = RegExp.$1 + RegExp.$2;

			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}

		$(function() {
			$("td.ct_btn:contains('ID중복확인')").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});

	</script>
</head>

	<div class="container mt-5">
		<form name="detailForm" method="post">
			<div class="row d-flex justify-content-center">
				<div class="col-md-6">
					<div class="card p-4 py-5">
						<p class="h2">회원가입</hp>
						<div class="d-flex flex-row">
							<span class="mr-2">이미 아이디가 있으시다면?&nbsp;</span> 
							<a href="loginView.jsp" class="signin-link">여기를 눌러 로그인</a>
						</div>
						<div class="signup mt-3"> 
							<input type="text" name="userId" class="form-control" placeholder="아이디" required autofocus> 
							<input type="password" name="password" class="form-control" placeholder="비밀번호" required> 
							<input type="password" name="password2" class="form-control" placeholder="비밀번호 확인" required>
							<input type="text" name="userName" class="form-control" placeholder="이름" required>
							<input type="text" name="ssn" class="form-control" placeholder="주민번호 -제외, 13자리 입력">
							<input type="text" name="addr" class="form-control" placeholder="주소">
							<input type="text" name="email" class="form-control" placeholder="이메일">
								<select name="phone1" class="form-select-phone form-select-lg mb-3" style="width: 100px; height: 25px;">
									<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
									<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
									<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
									<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
									<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
								</select>-
								<input type="text" name="phone2" class="form-control-phone" placeholder="휴대전화번호">-
								<input type="text" name="phone3" class="form-control-phone" placeholder="-제외 입력">
								<input type="hidden" name="phone"/>
						</div>
						<div class="mt-2">
							<button class="w-100 btn btn-lg btn-primary">가입 확인</button>
						</div>
						<div class="mt-2"><p class="text-center"><a href="../index.jsp" class="primary">돌아가기</a></p></div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>