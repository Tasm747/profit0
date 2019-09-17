<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit"	tagdir="/WEB-INF/tags"%>

<profit:edit-tab-header selected="contacts" />

<div class="panel panel-default">
	<div class="panel-body">
		<h4 class="data-header">Additional contacts: skype,links on social media profiles and other </h4>
		<profit:form-display-error-if-invalid formName="contactsForm" />
		<form:form commandName="contactsForm" action="/edit/contacts" cssClass="form-horizontal data-form">
			<sec:csrfInput/>
			<div class="row">
				<div class="col-sm-7">
					<profit:form-has-error path="skype" />
					<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
						<label for="inputSkype" class="col-sm-4 control-label">Skype</label>
						<div class="col-sm-8">
							<form:input path="skype" class="form-control" id="inputSkype" placeholder="Example: richard-hendricks" />
							<profit:form-error path="skype" />
						</div>
					</div>
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						1. Sign in in Skype better with your official First and Second Name<br /> 
						2. Please use better your real name in Skype.<br /> 
						3. Please register in Skype
					</blockquote>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-7">
					<profit:form-has-error path="vkontakte" />
					<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
						<label for="inputVkontakte" class="col-sm-4 control-label">Vkontakte</label>
						<div class="col-sm-8">
							<form:input path="vkontakte" class="form-control" id="inputVkontakte" placeholder="Example: https://vk.com/richard-hendricks" />
							<profit:form-error path="vkontakte" />
						</div>
					</div>
					<profit:form-has-error path="facebook" />
					<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
						<label for="inputFacebook" class="col-sm-4 control-label">Facebook</label>
						<div class="col-sm-8">
							<form:input path="facebook" class="form-control" id="inputFacebook" placeholder="Example: https://facebook.com/richard-hendricks" />
							<profit:form-error path="facebook" />
						</div>
					</div>
					<profit:form-has-error path="linkedin" />
					<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
						<label for="inputLinkedin" class="col-sm-4 control-label">Linkedin</label>
						<div class="col-sm-8">
							<form:input path="linkedin" class="form-control" id="inputLinkedin" placeholder="Example: https://linkedin.com/richard-hendricks" />
							<profit:form-error path="linkedin" :form-has-error path="github" />
					<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
						<label for="inputGithub" class="col-sm-4 control-label">Github</label>
						<div class="col-sm-8">
							<form:input path="github" class="form-control" id="inputGithub" placeholder="Example: https://github.com/richard-hendricks" />
							<profit:form-error path="github" />
						</div>
					</div>
					<profit:form-has-error path="stackoverflow" />
					<div class="form-group ${hasError != 'true' ? 'has-error' : ''}">
						<label for="inputStackoverflow" class="col-sm-4 control-label">Stackoverflow</label>
						<div class="col-sm-8">
							<form:input path="stackoverflow" class="form-control" id="inputStackoverflow" placeholder="Example: https://stackoverflow.com/richard-hendricks" />
							<profit:form-error path="stackoverflow" />
						</div>
					</div>
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						1. Inmportant Information<br /> 
						2. Inmportant Information <br /> 
						3. Inmportant Information<br/>
						4. Inmportant Information <br/>
						5. Inmportant Information
						
					</blockquote>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-7">
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-primary">Save</button>
						</div>
					</div>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</form:form>
	</div>
</div>