<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="EUC-KR">
		<title>판매 목록 조회</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

	/*
	function fncGetList(currentPage){
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	*/
	
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage);
		$("form").attr("method", "POST").attr("action", "/purchase/listSale").submit();
	}
	
	$(function() {
		
		$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
			fncGetList(1);
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			console.log($(this).find('div').text());
			var tranNo = $(this).find('div').text().trim();
			location.href ="/purchase/getPurchase?tranNo="+tranNo;
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		//$("h7").css("color" , "red");
	})
	
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">판매 목록 조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			</select>
			<input type="text" name="searchKeyword" value='${! empty search.searchKeyword ? search.searchKeyword : ""}' class="ct_input_g" style="width:200px; height:19px" />
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetList('1');">검색</a> -->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">등록일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
			
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var = "i" value = "0" />
	<c:forEach var = "purchase" items = "${list}">
		<c:set var = "i" value = "${i+1}" />
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
			<td align="left">
			<!-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a></td> -->
			${purchase.purchaseProd.prodName}
			<div style="display:none">${purchase.tranNo}</div>
			</td>
			<td></td>
			<td align="left">${purchase.purchaseProd.price}</td>
			<td></td>
			<td align="left">${purchase.purchaseProd.regDate}</td>
			<td></td>
			<td align="left">
			<c:choose>
				<c:when test = "${purchase.tranCode == 000}">
					현재 구매완료 상태입니다. <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">배송하기</a>
				</c:when>
				<c:when test = "${purchase.tranCode == 001}">
					현재 배송중입니다.
				</c:when>
				<c:when test = "${purchase.tranCode == 002}">
					구매확정
				</c:when>
				<c:otherwise>
					문제가 있습니다.
				</c:otherwise>
			</c:choose></td>
			<td align="left"><%--${product.proTrancode}--%></td>			
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="0"/>
			<%--
			<% if(resultPage.getCurrentPage() == 1){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetList('<%= resultPage.getCurrentPage()-1 %>')">◀ 이전</a>
			<% } %>

			<%	for(int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++){	%>
					<% if(i == resultPage.getCurrentPage()){ %>
						<strong><%= i %></strong>
					<% }else{ %>
						<a href="javascript:fncGetList('<%= i %>');"><%= i %></a>
					<% } %>
			<% 	}  %>
	
			<% if(resultPage.getEndUnitPage() >= resultPage.getMaxPage()){ %>
					다음 ▶
			<% }else{ %>
					<a href="javascript:fncGetList('<%= resultPage.getEndUnitPage()+1 %>')">다음 ▶</a>
			<% } %>
			--%>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
</form>
</div>
</body>
</html>