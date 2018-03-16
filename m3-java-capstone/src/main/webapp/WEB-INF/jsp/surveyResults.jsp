<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="National Park Geek" />
<%@ include file="common/header.jspf"%>

<c:forEach var="surveyParkCode" items="${survey}">
	<div class="allParkInfo">
		<div class="allParkImages">
			<c:url value="/details" var="detailPageUrl">
				<c:param name="code" value ="${surveyParkCode.key}"/>
			</c:url>
			<a href="${detailPageUrl}">			
				<c:url value="/img/parks/${surveyParkCode.key.toLowerCase()}.jpg" var="imageUrl" />
				<img src="${imageUrl}" />
			</a>	
		</div>

		<div class="allParkTexts">
		<c:forEach var="currentPark" items="${parks}">
			<c:if test="${currentPark.code == surveyParkCode.key.toLowerCase()}">
			<div class="allParkNames">
				Park: <c:out value="${currentPark.name} " />
			</div>
			</c:if>
		</c:forEach>
			<div class="allParkNames">
				 Number of Votes: <c:out value="${surveyParkCode.value}" />
			</div>			
		</div>
	</div>
</c:forEach>

<%@ include file="common/footer.jspf"%>