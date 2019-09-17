<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>

<profit:edit-tab-header selected="info" />

<div class="panel panel-default edit-profile">
	<div class="panel-body">
		<h1 class="text-center">About me</h1>
		<hr />
		<h4 class="data-header">Some words about me,about my individual aspects... </h4>
		<profit:form-display-error-if-invalid formName="infoForm"/>
		<form:form commandName="infoForm" action="/edit/info" method="post" cssClass="form-horizontal data-form">
			<sec:csrfInput/>
			<profit:form-has-error path="info" />
			<div class="form-group row">
				<div class="col-sm-12">
					<form:textarea path="info" class="form-control" id="inputSummary" rows="7"
						placeholder="Example: Tell more about you!" />
					<profit:form-error path="info" />	
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 help-block">
					<blockquote>
						More Information:<br/>
						<i>Family,married with Children 
						Extra Skills in Software and Hardware Developing </i><br/>
						More Information!!!<br /> 
						
					</blockquote>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-xs-12 text-center">
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>