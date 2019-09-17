<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>

<div class="panel panel-info small-center-block">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-user-plus"></i>Sign up Your personal Data
		</h3>
	</div>
	<div class="panel-body">
		<profit:form-display-error-if-invalid formName="profileForm" />
		<form:form action="/sign-up" commandName="profileForm" method="post">
			<sec:csrfInput/>
			<div class="help-block text-justify">
				Please note Your names could not be changed later! So give correct names! 
			</div>
			
			<profit:form-has-error path="firstName"/>
			<div class="form-group ${hasError != 'true' ? 'has-error has-feedback' : ''}">
				<label for="firstName">First name</label> 
				<form:input path="firstName" id="firstName" cssClass="form-control" placeholder="Example: Richard" required="required"/>
				<profit:form-error path="firstName" />
			</div>
			
			<profit:form-has-error path="lastName"/>
			<div class="form-group ${hasError != 'true' ? 'has-error has-feedback' : ''}">
				<label for="lastName">Family name</label> 
				<form:input path="lastName" id="lastName" cssClass="form-control" placeholder="Example: Hendricks" required="required"/>
				<profit:form-error path="lastName" />
			</div>
			
			<profit:form-has-error path="password"/>
			<div class="form-group ${hasError != 'true' ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="password">New password</label> 
				<form:password path="password" id="password" cssClass="form-control" required="required"/>
				<profit:form-error path="password" />
			</div>
			
			<profit:form-has-error path="confirmPassword"/>
			<div class="form-group ${hasError != 'true' ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="confirmPassword">Password confirmation</label> 
				<form:password path="confirmPassword" id="confirmPassword" cssClass="form-control" required="required"/>
				<profit:form-error path="confirmPassword" />
			</div>
			<button type="submit" class="btn btn-success">Sign up</button>
			<a href="/fbSignUp" class="btn btn-primary pull-right"><i class="fa fa-facebook"></i>&nbsp;&nbsp;Sign up with Facebook</a>
		</form:form>
	</div>
</div>