<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%-- What line 2 is doing is connecting this form to the object we have in our model in our controller.
 We'll have to change our form tag to form:form on lines 12 and its closing tag at the end. 
 
 What we're doing with changing '<input type="password" name="password" class="form-control">' to 
 '<form:input path="confirmedEmail" class="form-control"/> ' is handing over our properties to spring to let it deal with things and errors. --%>

<c:set var="pageTitle" value="Survey"/>
<%@include file="common/header.jspf" %>

<h2>Survey</h2>

<c:url var="surveyUrl" value="/survey"/>
<form:form action="${surveyUrl}" method="POST" modelAttribute="survey" id="survey">

	<!-- Drop Down Menu: Favorite Park -->
	
	<select name="parkList" form="survey">
		<c:forEach var="parks" items="${parks}">
		<option value="${park.code}"><c:out value="${park.name}"/></option>
		</c:forEach>
	</select>

	<div class="form-group"><!-- form-group is bootstrap -->
		<label for="email">Email Address: </label>
		<form:input path="email" class="form-control"/> <!-- form-control is bootstrap -->
		<form:errors path="email" cssClass="error"/> <!-- This is formatting our error report/printout -->
	</div>
	
	<div class="form-group">
		<label for="state">State of Residence: </label>
		<form:input path="state" class="form-control"/>
		<form:errors path="state" cssClass="error"/>
	</div>
	
	<div class="form-group">
		<label for="activityLevel">Activity Level: </label>
		<form:input path="activityLevel" class="form-control"/> 
		<form:errors path="activityLevel" cssClass="error"/>
	</div>

	<input type="submit" value="Submit Survey" class="btn btn-default"/>

</form:form>

<%@include file="common/footer.jspf" %>
