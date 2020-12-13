<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<div class="container">
		 
	<nav>
	<!-- ũ������ :  pagination-lg pagination-sm-->
		<ul class="pagination justify-content-center">
	
			<!--  <<== ���� nav -->
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				<li class="page-item disabled">	
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li class="page-item">
			</c:if>
				<a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		
		<!--  �߾�  -->
		<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
			
			<c:if test="${ resultPage.currentPage == i }">
				<!--  ���� page ����ų��� : active -->
				<li class="page-item active">
					<a class="page-link" href="javascript:fncGetList('${ i }');">${ i }<span class="visually-hidden">(current)</span></a>
				</li>
			</c:if>	
			
			<c:if test="${ resultPage.currentPage != i}">	
				<li class="page-item">
					<a class="page-link" href="javascript:fncGetList('${ i }');">${ i }</a>
				</li>
			</c:if>
		</c:forEach>
		
			<!--  ���� nav==>> -->
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				<li class="page-item disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li class="page-item">
			</c:if>
				<a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
</div>