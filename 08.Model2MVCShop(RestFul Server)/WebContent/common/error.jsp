<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Defalt Exception Page</title>
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- Optional theme -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
</head> 

<body class="app app-404-page">   	
   
    <div class="container mb-5">
	    <div class="row">
		    <div class="col-12 col-md-11 col-lg-7 col-xl-6 mx-auto">
			    <div class="app-branding text-center mb-5">
		            <a class="app-logo" href="../index.jsp"><img class="logo-icon mr-2" src="../assets/images/bit-logo.svg" alt="logo"><span class="logo-text">Model2 MVC Shop</span></a>
	
		        </div><!--//app-branding-->  
			    <div class="app-card p-5 text-center shadow-sm">
					<h1 class="page-title mb-4">예외 발생<br>
						<span class="font-weight-light"><%-- <%	Exception exception = (Exception)request.getAttribute("exception");	%> --%></span></h1>
				    <div class="mb-4">
					    <%-- <%="Java Code을 이용한 예외 Message 보기 ::" +  exception.getMessage() %><br/>
							EL을 이용한 예외 Message 보기 :: ${ exception.message }<br/> --%>
				    </div>
				    <a class="btn app-btn-primary" href="../index.jsp">Go to home page</a>
			    </div>
		    </div><!--//col-->
	    </div><!--//row-->
    </div><!--//container-->
   
    
    <footer class="app-footer">
	    <div class="container text-center py-3">
	         <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
        <small class="copyright visually-hidden">Designed with <i class="fas fa-heart" style="color: #fb866a;"></i> by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
	       
	    </div>
    </footer><!--//app-footer-->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
      integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>