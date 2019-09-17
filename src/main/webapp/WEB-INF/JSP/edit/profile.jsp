<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>

<profit:edit-tab-header selected="profile" />

<div class="panel panel-default edit-profile">
	<div class="panel-body">
		<h1 class="text-center">${profileForm.fullName }</h1>
		<c:if test="${!profileForm.completed }">
		<hr />
		<h4 class="data-header">You should fill this form complete for Registration!</h4>
		</c:if>
		<profit:form-display-error-if-invalid formName="contactsForm" />
		<form:form commandName="profileForm" action="/edit?${_csrf.parameterName}=${_csrf.token}" method="post" cssClass="form-horizontal data-form" enctype="multipart/form-data">
			<form:hidden path="firstName"/>
			<form:hidden path="lastName"/>
			<form:hidden path="largePhoto"/>
			<form:hidden path="completed"/>
			
			<profit:form-has-error path="profilePhoto" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputPhoto" class="col-sm-2 control-label">Photo*</label>
				<div class="col-sm-5">
					<img id="currentPhoto" src="${profileForm.profilePhoto }" class="edit-photo" /><br /> 
					<input type="file" name="profilePhoto" id="profilePhoto" />
					<profit:form-error path="profilePhoto" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						1. Photo is important<br /> 
						2. Photo should be as for an official document<br /> 
						3. Photo Information<br /> 
						4. Photo should be not less than 400x400 <br /> 
						5. Please use jpeg format <br />
					</blockquote>
				</div>
			</div>
			<profit:form-has-error path="birthDay" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputBirthDay" class="col-sm-2 control-label">Date of birth*</label>
				<div class="col-sm-5">
					<form:input path="birthDay" class="form-control datepicker" data-date-format="yyyy-mm-dd" id="inputBirthDay" placeholder="Example: 1990-12-31" required="required" />
					<profit:form-error path="birthDay" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>Date: yyyy-mm-dd </blockquote>
				</div>
			</div>
			<profit:form-has-error path="country" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputCountry" class="col-sm-2 control-label">Country*</label>
				<div class="col-sm-5">
					<form:input path="country" class="form-control" id="inputCountry" placeholder="Example: Germany" required="required" />
					<profit:form-error path="country" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<profit:form-has-error path="city" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputCity" class="col-sm-2 control-label">City*</label>
				<div class="col-sm-5">
					<form:input path="city" class="form-control" id="inputCity" placeholder="Example: Hamburg" required="required" />
					<profit:form-error path="city" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<profit:form-has-error path="email" />
			<div class="form-group ${hasError != 'true'? 'has-error' : ''}">
				<label for="inputEmail" class="col-sm-2 control-label">Email*</label>
				<div class="col-sm-5">
					<form:input path="email" class="form-control" id="inputEmail" placeholder="Example: richard.hendricks@gmail.com" required="required" />
					<profit:form-error path="email" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						1.E-mail should be valid .<br /> 
						2.E-mail is important.<br /> 
						3.It is not recommended to use domain name of your current employee.<br /> 
						4.For Developers recommended to use their own domain name
					</blockquote>
				</div>
			</div>
			<profit:form-has-error path="phone" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputPhone" class="col-sm-2 control-label">Telephone*</label>
				<div class="col-sm-5">
					<form:input path="phone" class="form-control" id="inputPhone" placeholder="Example: +40501234567" required="required" />
					<profit:form-error path="phone" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>Telephone number should be working number. 
					Telephone number should be given in such format  <a href="https://ru.wikipedia.org/wiki/E.164" target="_blank">E.164</a>, for example: +40501234567</blockquote>
				</div>
			</div>
			<profit:form-has-error path="objective" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputObjective" class="col-sm-2 control-label">Desired Vacancy*</label>
				<div class="col-sm-5">
					<form:input path="objective" class="form-control" id="inputObjective" placeholder="Example: Junior java developer position" required="required" />
					<profit:form-error path="objective" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>Here You should write about you position you wish very short and precise.</blockquote>
				</div>
			</div>
			<profit:form-has-error path="summary" />
			<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
				<label for="inputSummary" class="col-sm-2 control-label">Your Qualification*</label>
				<div class="col-sm-5">
					<form:textarea path="summary" class="form-control" id="inputSummary" required="required" rows="7"
						placeholder="Example: Two Java professional courses with developing two web applications: blog and profile (Links to demo are provided)" />
					<profit:form-error path="summary" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						1. Please describe your practical experience.<br /> 
						2. Please describe only relevant practices for the desired vacancy.<br /> 
						3. If you don't have enough knowledge take additional courses.
					</blockquote>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
		</form:form>
	</div>
</div>

<content tag="js-init">
<script>
$(document).ready(function(){
	profit.createDatePicker();
	profit.createPhotoUploader();
});
</script>
</content>