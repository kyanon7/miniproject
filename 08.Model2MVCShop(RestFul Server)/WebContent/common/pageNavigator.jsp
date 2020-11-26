<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test = "${resultPage.currentPage == 1}">
		�� ����
	</c:when>
	<c:otherwise>
		<a href="javascript:fncGetList('${resultPage.currentPage-1}')">�� ����</a>
	</c:otherwise>
</c:choose>
<c:forEach var = "i" begin = "${resultPage.beginUnitPage}" end = "${resultPage.endUnitPage}" step = "1">
	<c:choose>
		<c:when test="${i == resultPage.currentPage}">
			<strong>${i}</strong>
		</c:when>
		<c:otherwise>
			<a href="javascript:fncGetList('${i}');">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:choose>
	<c:when test = "${resultPage.endUnitPage >= resultPage.maxPage}">
		���� ��
	</c:when>
	<c:otherwise>
		<a href="javascript:fncGetList('${resultPage.endUnitPage+1}')">���� ��</a>
	</c:otherwise>
</c:choose>