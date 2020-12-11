<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>ȸ�� ��� ��ȸ</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" 
			integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" 
			integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" 
			integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" 
			integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>


	<style>
		body {
				padding-top : 50px;
		}
	</style>

	<script type="text/javascript">

	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
	   	$("form").attr("method", "POST").attr("action", "/user/listUser").submit();
	}
	
	//===========================================//
	//==> �߰��Ⱥκ� : "�˻�" ,  userId link  Event ���� �� ó��
	$(function() {
		$( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1);
		});
	});
	
	//============= userId �� ȸ����������  Event  ó��(Click) =============	
	$(function() {
	
		$( "td:nth-child(2)" ).css("cursor","pointer").on("click" , function() {
			location.href ="/user/getUser?userId="+$(this).text().trim();
		});
					
		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( "td:nth-child(2)" ).css("color" , "red");
	
	});	
		
	$(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
																+"���̵� : "+JSONData.userId+"<br/>"
																+"��  �� : "+JSONData.userName+"<br/>"
																+"�̸��� : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"����� : "+JSONData.regDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					 
			});

		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> �Ʒ��� ���� ������ ������ ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});

	</script>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info">
			<h3>ȸ�������ȸ</h3>
		</div>
		
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6 text-left">
				<p class="text-primary">
					��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
				</p>
			</div>
			
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
				
					<div class="form-group">
					<select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>ȸ��ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>ȸ����</option>
					</select>
					</div>
					
					<div class="form-group">
					<label class="sr-only" for="searchKeyword">�˻���</label>
					<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
									value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>
					
					<button type="button" class="btn btn-default">�˻�</button>
					
					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="0"/>
					
				</form>
			</div>
			
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped" >
		
		<thead>
			<tr>
			<th align="center">No</th>
			<th align="left">ȸ�� ID</th>
			<th align="left">ȸ����</th>
			<th align="left">�̸���</th>
			<th align="left">��������</th>
			</tr>
		</thead>
		
		<tbody>
		
			<c:set var="i" value="0" />
			<c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : ȸ������ Ȯ��">${user.userId}</td>
				<td align="left">${user.userName}</td>
				<td align="left">${user.email}</td>
				<td align="left">
					<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
					<input type="hidden" value="${user.userId}">
				</td>
			</tr>
			</c:forEach>
		
		</tbody>
		
		</table>
		<!--  table End /////////////////////////////////////-->
		
		</div>
		<!--  ȭ�鱸�� div End /////////////////////////////////////-->
		
		
		<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>