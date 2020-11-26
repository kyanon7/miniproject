<%@ page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<title>
<c:choose>
	<c:when test = "${sessionScope.user.role == 'user'}">
		���� �� ����
	</c:when>
	<c:when test = "${sessionScope.user.role == 'admin'}">
		�Ǹ� ��ǰ ����
	</c:when>
</c:choose>
</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

<!--
function fncPurchase(){
	document.detailForm.action='/purchase/updatePurchase';
	document.detailForm.submit();
}
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- <form name="detailForm" method="post">

<input type="hidden" id="tranNo" name="tranNo" value="${purchase.tranNo}"/> -->

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif" width="15" height="37"/></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:choose>
						<c:when test = "${sessionScope.user.role == 'user'}">
							���� �� ����
						</c:when>
						<c:when test = "${sessionScope.user.role == 'admin'}">
							�Ǹ� ��ǰ ����
						</c:when>
					</c:choose></td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${purchase.purchaseProd.prodNo}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			������ ���̵� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���� ���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:choose>
				<c:when test = "${purchase.paymentOption == 000}">
					���� ����
				</c:when>
				<c:when test = "${purchase.paymentOption == 001}">
					ī�� ����
				</c:when>
				<c:otherwise>
					������ �ֽ��ϴ�.
				</c:otherwise>
			</c:choose></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ �̸�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.receiverName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ ����ó</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.receiverPhone}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ �ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.divyAddr}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���� ��û����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.divyRequest}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
		<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.divyDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	</tr>
		<tr>
		<td width="104" class="ct_write">�ֹ���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.orderDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<c:if test = "${sessionScope.user.role == 'user' && purchase.tranCode == '000'}">
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
							<!-- <a href="javascript:fncPurchase();">����</a> -->
							<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo}">����</a>
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
					</c:if>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<c:choose>
							<c:when test="${sessionScope.user.role == 'user'}">
								<a href="/purchase/listPurchase">Ȯ��</a>
							</c:when>
							<c:when test="${sessionScope.user.role == 'admin'}">
								<a href="/purchase/listSale">Ȯ��</a>
							</c:when>
						</c:choose>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>