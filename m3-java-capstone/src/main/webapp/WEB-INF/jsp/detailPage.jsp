<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
						Acreage: <fmt:formatNumber maxFractionDigits="0"> <c:out value="${park.acreage}" /> </fmt:formatNumber> acres
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
						Visitors per Year: <fmt:formatNumber maxFractionDigits="0"><c:out value="${park.annualVisitorCount}" /></fmt:formatNumber> 
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
						<div id="tempConverter" class="btn-group btn-group-toggle" data-toggle="buttons">
							<label for="fahrenheit" class="btn btn-secondary active">
							<input type="radio" name="tempType" id="fahrenheit" value="true" autocomplete="on" checked > 				
								Fahrenheit
							</label> 
							<label for="celsius" class="btn btn-secondary"> 
							<input type="radio" name="tempType" id="celsius" value="false" autocomplete="off" > 
								Celsius
							</label>
							<input type="hidden" name="code" value="${day.weatherParkCode}">
						</div>
						<div>
							<input type="submit" value="Submit"/>
						</div>
					</form>
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
							<fmt:formatNumber value="${(day.high - 32) * (5/9)}" maxFractionDigits="0" var="temp" />
							<c:out value="High: ${temp}"/>
							&#x2103;
							<fmt:formatNumber value="${(day.low - 32) * (5/9)}" maxFractionDigits="0" var="temp" />
							<c:out value="Low: ${temp}" />
							&#x2103;
						</div>
					</c:if>
					<div class="">
						<div class="">
							<c:if test="${day.forecast == 'snow'}">
							Pack snowshoes!
							</c:if>
							<c:if test="${day.forecast == 'rain'}">
							Pack rain-gear and wear waterproof shoes!
							</c:if>
							<c:if test="${day.forecast == 'sunny'}">
							Pack sunblock!
							</c:if>
							<c:if test="${day.forecast == 'thunderstorms'}">
							Seek shelter and avoid hiking on exposed ridges!
							</c:if>
						</div>
						<div class="tempChoices">
							<c:if test="${day.high > 75}">
							Bring an extra gallon of water!
							</c:if>
							<c:if test="${day.low < 20}">
							Danger! Dress appropriately for frigid temperatures
							</c:if>
							<c:if test="${(day.high - day.low) > 20}">
							Wear breathable layers!
							</c:if>
						</div>
					</div>
					
				</div>
			</c:when>
			<c:otherwise>
				<div class="fourDays">
					<div class="fourDaysImage">
						<c:url value="/img/weather/${day.forecast}.png" var="imageUrl" />
						<img src="${imageUrl}" />
					</div>

					<c:if test="${isFahrenheit == true || isFahrenheit == null}">
						<div>
							<c:out value="High: ${day.high}" />
							&#x2109;
						</div>
						<div>
							<c:out value="Low: ${day.low}" />
							&#x2109;
						</div>
					</c:if>
					<!-- If false, convert to Celsius -->
					<c:if test="${isFahrenheit == false}">
						<div>
							<fmt:formatNumber value="${(day.high - 32) * (5/9)}" maxFractionDigits="0" var="temp" />
							<c:out value="High: ${temp}"/>
							&#x2103;
						</div>
						<div>
							<fmt:formatNumber value="${(day.low - 32) * (5/9)}" maxFractionDigits="0" var="temp" />
							<c:out value="Low: ${temp}" />
							&#x2103;
						</div>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</div>


<%@ include file="common/footer.jspf"%>