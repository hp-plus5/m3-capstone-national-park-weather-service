<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="National Park Geek" />
<%@ include file="common/header.jspf"%>

<c:forEach var="park" items="${parks}">

	<div class="allParkInfo">
	
		<div class="parkImage">
			<c:url value="/details" var="detailPageUrl">
				<c:param name="code" value ="${park.code}"/>
			</c:url>
			<a href="${detailPageUrl}">			
				<c:url value="/img/parks/${park.code}.jpg" var="imageUrl" />
				<img src="${imageUrl}" alt="${park.name}" />
			</a>	
		</div> <!-- parkImage -->

		<div class="parkText">
			<div class="parkName">
				<c:out value="${park.name}" />
			</div>

			<div class="parkDescription">
				<c:out value="${park.description}" />
			</div>
			
			
		</div><!-- parkText -->
	</div><!-- allParkInfo -->

</c:forEach>

<%@ include file="common/footer.jspf"%>