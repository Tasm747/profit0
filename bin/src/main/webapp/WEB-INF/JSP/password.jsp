<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags" %> 

<div class="panel panel-info small-center-block">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-unlock-alt"></i>New password for account
		</h3>
	</div>
	<div class="panel-body edit-password">
	    <profit:form-display-error-if-invalid formName="passwordForm" />
		<form:form action="/edit/password" commandName="passwordForm" method="post">
			<div class="help-block">Give in a new password and save it </div>
			<profit:form-has-error path="password"/>
			<div class="form-group ${hasError != 'true'? 'has-error has-feedback' : ''}">
				<label class="control-label" for="password">New password</label> 
				<form:password path="password" id="password" cssClass="form-control" required="required"/>
				<profit:form-error path="password" />
			</div>
			
			<profit:form-has-error path="confirmPassword"/>
			<div class="form-group ${hasError != 'true'? 'has-error has-feedback' : ''}">
				<label class="control-label" for="confirmPassword">Repeat password</label> 
				<form:password path="confirmPassword" id="confirmPassword" cssClass="form-control" required="required"/>
				<profit:form-error path="confirmPassword" />
			</div>
			<button type="submit" class="btn btn-primary">Renew password</button>
		</form:form>
	</div>
</div>