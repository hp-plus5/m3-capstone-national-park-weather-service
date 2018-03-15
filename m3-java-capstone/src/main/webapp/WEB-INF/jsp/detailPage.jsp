<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="National Park Geek" />
<%@ include file="common/header.jspf"%>


<div class="listBigDiv">
	<div id="listToyImg">
		<c:url value="/img/parks/${param.code}.jpg" var="imageUrl" />
		<img src="${imageUrl}" alt="${param.name}" />
	</div>
	<!-- listToyImg -->

	<div>
		<c:out value="${park.name}" />
	</div>

	<div>
		<c:out value="${park.description}" />
	</div>




	<div id="accordion">
		<div class="card">
			<div class="card-header" id="headingOne">
				<h4 class="mb-0">
			<%-- 	if(class="btn btn-link" == true && click) {
					class="btn btn-link collapsed"
					 aria-expanded == ""true";
				 } else if (btn btn-link == false) && click)
					 class="btn btn-link"
					 aria-expanded == "false";} --%>
					<button class="btn btn-link"<%-- add "collapsed" --%> data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" <%-- false --%> aria-controls="collapseOne">
						Basic Information
					</button>
				</h4>
			</div>
			
	<div id="collapseOne" class="collapse show" <%-- no "show" --%> aria-labelledby="headingOne" data-parent="#accordion">
	<div class="card-body">
	
	<div>
		<c:out value="${park.state}"/>
	</div>

	<div>
		<c:out value="${park.acreage} acres" />
	</div>

	<div>
		<c:out value="${park.elevationInFeet} feet" />
	</div>

	<div>
		<c:out value="${park.milesOfTrail} miles of trail" />
	</div>

	<div>
		<c:out value="${park.numberOfCampsites} campsites" />
	</div>

	<div>
		<c:out value="${park.climate}" />
	</div>

	<div>
		<c:out value="${park.yearFounded}" />
	</div>

	<div>
		<c:out value="${park.annualVisitorCount} visitors per year" />
	</div>
	<div>
		<c:out value="$${park.entryFee} entry fee" />
	</div>

	<div>
		<c:out value="${park.numberOfAnimalSpecies} animal species found in the park" />
	</div>
	
	
			</div> <!-- card-body -->
		</div> <!-- collapseOne -->
	</div> <!-- /card -->
</div> <!-- /accordion -->


<div>
	<c:out value="${param.inspirationalQuote}" />
</div>

<div>
	<c:out value="${param.inspirationalQuoteSource}" />
</div>

</div>
<!-- bigdiv -->


<div id="weather">
<c:forEach var="weather" items="${weather}" begin="${weather[0]}" end="${weather[4]}" >
	<div>
		<c:url value="/img/weather/${weather.forecast}.png" var="imageUrl" />
		<img src="${imageUrl}" />
	</div>
	
	<div>
		<c:out value="${weather.low}" />
	</div>
	
	<div>
		<c:out value="${weather.high}" />
	</div>
</c:forEach>
	
</div>


<%@ include file="common/footer.jspf"%>