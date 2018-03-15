<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- What line 2 is doing is connecting this form to the object we have in our model in our controller.
 We'll have to change our form tag to form:form on lines 12 and its closing tag at the end. 
 
 What we're doing with changing '<input type="password" name="password" class="form-control">' to 
 '<form:input path="confirmedEmail" class="form-control"/> ' is handing over our properties to spring to let it deal with things and errors. --%>

<c:set var="pageTitle" value="Survey" />
<%@include file="common/header.jspf"%>

<h2>Survey</h2>

<c:url var="surveyUrl" value="/survey" />
<form:form action="${surveyUrl}" method="POST" modelAttribute="survey"
	id="survey">

	<select name="parkList" form="survey">
		<c:forEach var="parks" items="${parks}">
			<option value="${park.code}"><c:out value="${park.name}" /></option>
		</c:forEach>
	</select>

	<div class="form-group">
		<!-- form-group is bootstrap -->
		<label for="email">Email Address: </label>
		<form:input path="email" class="form-control" />
		<!-- form-control is bootstrap -->
		<form:errors path="email" cssClass="error" />
		<!-- This is formatting our error report/printout -->
	</div>

	<select name="stateList" form="survey">
			<option value="0">Select</option>
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="DC">District Of Columbia</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
		</select>

		<div class="form-group">
			<label for="activityLevel">Activity Level: </label>
			<form:input path="activityLevel" class="form-control" />
			<form:errors path="activityLevel" cssClass="error" />
		</div>

		<input type="submit" value="Submit Survey" class="btn btn-default" />
</form:form>

<%@include file="common/footer.jspf"%>
