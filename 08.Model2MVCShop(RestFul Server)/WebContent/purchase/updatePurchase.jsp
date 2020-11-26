<%@ page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<title>���� ���� ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

function fncPurchase(){
	//Form ��ȿ�� ����
 	var receiverName = document.detailForm.receiverName.value;
	var receiverPhone = document.detailForm.receiverPhone.value;
	var divyAddr = document.detailForm.divyAddr.value;
	var divyDate = document.detailForm.divyDate.value;

	if(receiverName == null || receiverName.length<1){
		alert("������ �̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("������ ����ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("������ �ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(divyDate == null || divyDate.length<1){
		alert("��� ������� �Է����ּ���.");
		return;
	}
		
	document.detailForm.action='/purchase/updatePurchase';
	document.detailForm.submit();
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" method="post">

<input type="hidden" name="tranNo" value="${purchase.tranNo}"/>
<input type="hidden" name="userId" value="${purchase.buyer.userId}"/>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif" width="15" height="37"/></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� ���� ����</td>
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
		<td width="104" class="ct_write">���� ���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		
		<!-- <select name="paymentOption" class="ct_input_g" style="width:80px">
			<option value="000" selected>���� ����</option>
			<option value="001">ī�� ����</option>
		</select> -->
		
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
			</c:choose>
		
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ �̸�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" value="${purchase.receiverName}"
						class="ct_input_g" style="width: 100px; height: 25px" maxLength="50"/>
		</td>
	</tr>
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ ����ó</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverPhone" value="${purchase.receiverPhone}"
						class="ct_input_g" style="width: 200px; height: 25px" maxLength="50"/>
		</td>
	</tr>
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ �ּ� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="divyAddr" value="${purchase.divyAddr}"
						class="ct_input_g" style="width: 300px; height: 25px" maxLength="50"/>
		</td>
	</tr>
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ ��û����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="divyRequest" value="${purchase.divyRequest}"
						class="ct_input_g" style="width: 300px; height: 25px" maxLength="70"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="divyDate" value="${purchase.divyDate}" 	
						class="ct_input_g" style="width: 100px; height: 25px" maxLength="10" minLength="6">
						<img src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)" />
		</td>
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
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:fncPurchase();">�����ϱ�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:history.go(-1)">���</a>
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