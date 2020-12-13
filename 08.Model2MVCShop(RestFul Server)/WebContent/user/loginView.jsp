<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- Optional theme -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
	</style>
	
	<script type="text/javascript">
		
		$( function() {
			$("button:contains('Login')").on("click" , function() {

				var id=$("#userId").val();
				var pw=$("#password").val();

				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("input:text").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("input:password").focus();
					return;
				}

				$("form").attr("method","POST").attr("action","/user/login").submit();
			});
		});
		
	</script>
    
    <!-- Custom styles for this template -->
    <link href="../css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
	<main class="form-signin">
		<form>
			<a href="/index.jsp"><img class="mb-4" src="../images/bit-logo.svg" alt="" width="72" height="57"></a>
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<label for="inputUserId" class="visually-hidden">Id</label>
			<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디" required autofocus>
			<label for="inputPassword" class="visually-hidden">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" required>
			<button class="w-100 btn btn-lg btn-primary">Login</button>
			<p class="mt-5 mb-3 text-muted">&copy; 1990-2020</p>
		</form>
	</main>
  </body>
</html>