<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 목록 조회</title>
	
	
	<!-- Latest bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- Optional theme -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

	<script type="text/javascript">

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
	   	$("form").attr("method", "POST").attr("action", "/user/listUser").submit();
	}
	
	//===========================================//
	//==> 추가된부분 : "검색" ,  userId link  Event 연결 및 처리
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncGetList(1);
		});
	});
	
	//============= userId 에 회원정보보기  Event  처리(Click) =============	
	$(function() {
	
		$( "td:nth-child(2)" ).css("cursor","pointer").on("click" , function() {
			location.href ="/user/getUser?userId="+$(this).text().trim();
		});
					
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(2)" ).css("color" , "red");
	
	});	
		
	$(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {
 
				var userId = $(this).next().val();
				 
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
							},
								success : function(JSONData , status) {
 
									var displayValue = "<h6>"
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					 
			});

		//==> userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});

	</script>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<form name="detailForm" method="POST">
	<div class="container">

		<div class="h3 mt-4">
			회원목록조회
		</div>
		
		<div class="row">
			<p class="text-primary">
				전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
			</p>
			
		</div>

		<div class="container">
			<div class="row justify-content-end">
			  	<div class="col-2">
					<select class="form-select" name="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>회원명</option>
					</select>
				</div>

			  	<div class="col-4">
					<label class="visually-hidden" for="searchKeyword">검색어</label>
						<div class="input-group">
							<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						</div>
				  </div>
				  
				<div class="col-1">
					<button type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
		</div>
		

		<input type="hidden" id="currentPage" name="currentPage" value="0"/>

		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped" >
		
		<thead>
			<th align="center">No</th>
			<th align="left">회원 ID</th>
			<th align="left">회원명</th>
			<th align="left">이메일</th>
			<!-- <th align="left">간략정보</th> -->
		</thead>
		
		<tbody>
		
			<c:set var="i" value="0" />
			<c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="left">${ i }</td>
				<td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
				<td align="left">${user.userName}</td>
				<td align="left">${user.email}</td>
				<td align="left">
					<!-- <svg class="bi bi-chevron-right" width="22" height="22" viewBox="0 0 20 20" id="${user.userId}" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z"/></svg> -->
					<input type="hidden" value="${user.userId}">
				</td>
			</tr>
			</c:forEach>
		
		</tbody>
		
		

		</table>
		
		</div>
		
		
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	
</body>

</html>