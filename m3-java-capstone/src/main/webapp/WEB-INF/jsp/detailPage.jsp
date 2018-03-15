<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="National Park Geek" />
<%@ include file="common/header.jspf"%>


<div id="detailLargestDiv">
	<div class="detailImage">
		<c:url value="/img/parks/${param.code}.jpg" var="imageUrl" />
		<img src="${imageUrl}" alt="${param.name}" />
	</div>
	<div class="detailText">
		<div class="detailName">
			<h2>
				<c:out value="${park.name}" />
			</h2>
		</div>
		<div class="detailDescription">
			<c:out value="${park.description}" />
		</div>
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
					<button class="btn btn-link"
						<%-- add "collapsed" --%> data-toggle="collapse"
						data-target="#collapseOne" aria-expanded="true"
						<%-- false --%> aria-controls="collapseOne">Basic
						Information</button>
				</h4>
			</div>

			<div id="collapseOne" class="collapse show"
				<%-- no "show" --%> aria-labelledby="headingOne"
				data-parent="#accordion">
				<div class="card-body">

					<div>
						<c:out value="State: ${park.state}" />
					</div>

					<div>
						<c:out value="Acreage: ${park.acreage} acres" />
					</div>

					<div>
						<c:out value="Elevation: ${park.elevationInFeet} feet" />
					</div>

					<div>
						<c:out value="Miles of Trail: ${park.milesOfTrail}" />
					</div>

					<div>
						<c:out value="Number of Campsites: ${park.numberOfCampsites}" />
					</div>

					<div>
						<c:out value="Climate: ${park.climate}" />
					</div>

					<div>
						<c:out value="Year Founded: ${park.yearFounded}" />
					</div>

					<div>
						<c:out value="Visitors per Year: ${park.annualVisitorCount}" />
					</div>
					<div>
						<c:out value="Entry Fee: $${park.entryFee}" />
					</div>

					<div>
						<c:out
							value="Animal species found in the park: ${park.numberOfAnimalSpecies}" />
					</div>


				</div>
				<!-- card-body -->
			</div>
			<!-- collapseOne -->
		</div>
		<!-- /card -->
	</div>
	<!-- /accordion -->


	<div>
		<c:out value='"${park.inspirationalQuote}"' />
	</div>

	<div>
		<c:out value="- ${park.inspirationalQuoteSource}" />
	</div>

</div>
<!-- bigdiv -->


<div id="weather">
	<c:forEach var="day" items="${weather}">
		<c:choose>
			<c:when test="${day.fiveDayForecastValue == 1}">
				<div class="firstDay">
					<c:url var="detailsUrl" value="/details"/>
					<form action="${detailsUrl}" method="POST">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> <input
								type="radio" name="tempType" id="isFahrenheit" value="true"
								autocomplete="off" checked> Fahrenheit
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="tempType" id="isCelsius" value="false" autocomplete="off">
								Celsius
							</label>
						</div>
					
					<h3>Today</h3>
					<div class="firstDayImage">
						<c:url value="/img/weather/${day.forecast}.png" var="imageUrl" />
						<img src="${imageUrl}" />
					</div>
					<!-- Check isFahrenheit (set in the HomeController) if true, Fahrenheit-->
					<c:if test="${isFahrenheit == true || isFahrenheit == null}">
						<div>
							<c:out value="High: ${day.high}" />
							&#x2109;
							<c:out value="Low: ${day.low}" />
							&#x2109;
						</div>
					</c:if>
					<!-- If false, convert to Celsius -->
					<c:if test="${isFahrenheit == false}">
						<div>
							<c:out value="High: ${(day.high - 32)*(5/9)}" />
							&#x2103;
							<c:out value="Low: ${(day.low - 32)*(5/9)}" />
							&#x2103;
						</div>
					</c:if>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="fourDays">
					<div class="fourDaysImage">
						<c:url value="/img/weather/${day.forecast}.png" var="imageUrl" />
						<img src="${imageUrl}" />
					</div>

					<div>
						<c:out value="High: ${day.high}" />
						&#x2109;
						<!-- Celsius = &#x2103; -->

					</div>

					<div>
						<c:out value="Low: ${day.low}" />
						&#x2109;
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</div>


<%@ include file="common/footer.jspf"%>