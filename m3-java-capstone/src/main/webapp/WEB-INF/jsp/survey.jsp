<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- What line 2 is doing is connecting this form to the object we have in our model in our controller.
 We'll have to change our form tag to form:form on lines 12 and its closing tag at the end. 
 
 What we're doing with changing '<input type="password" name="password" class="form-control">' to 
 '<form:input path="confirmedEmail" class="form-control"/> ' is handing over our properties to spring to let it deal with things and errors. --%>

<c:set var="pageTitle" value="Survey" />
<%@include file="common/header.jspf"%>

<h2>Survey</h2>

<c:url var="surveyUrl" value="/submitSurvey" />
<form:form action="${surveyUrl}" method="POST" modelAttribute="survey"
	id="survey">

	<form:select path="surveyParkCode" name="surveyParkCode" form="survey">
		<c:forEach var="parkList" items="${parks}">
			<form:option value="${parkList.code.toUpperCase()}"><c:out value="${parkList.name}" /></form:option>
		</c:forEach>
	</form:select>

	<div class="form-group">
		<!-- form-group is bootstrap -->
		<label for="emailAddress">Email Address: </label>
		<form:input path="emailAddress" class="form-control" />
		<!-- form-control is bootstrap -->
		<form:errors path="emailAddress" cssClass="error" />
		<!-- This is formatting our error report/printout -->
	</div>

	<select name="state" form="survey">
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
		
		 <p>Please select your activity level:</p>
		  <div>
		    <input type="radio" id="activityChoice1"
		     name="activityLevel" value="inactive">
		    <label for="activityChoice1">Inactive</label>
		
		    <input type="radio" id="activityChoice2"
		     name="activityLevel" value="sedentary">
		    <label for="activityChoice2">Sedentary</label>
		
		    <input type="radio" id="activityChoice3"
		     name="activityLevel" value="active">
		    <label for="activityChoice3">Active</label>
		    
		    <input type="radio" id="activityChoice4"
		     name="activityLevel" value="extremely active">
		    <label for="activityChoice4">Extremely Active</label>
		  </div>		
		
		<input type="submit" value="Submit Survey" class="btn btn-default" />
</form:form>

<%@include file="common/footer.jspf"%>
