<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>

<profit:edit-tab-header selected="education" />

<div class="panel panel-default">
	<div class="panel-body">
		<h4 class="data-header">Education</h4>
		<h6 class="text-center help-block">(Sorted down)</h6>
		<hr />
		<profit:form-display-error-if-invalid formName="educationForm" />
		<form:form action="/edit/education" method="post" commandName="educationForm">
			<sec:csrfInput/>
			<div id="ui-block-container">
				<c:forEach var="education" items="${educationForm.items }" varStatus="status">
					<profit:edit-education-block index="${status.index}" education="${education }" />
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a href="javascript:profit.ui.addBlock();">+ Add School</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
				</div>
			</div>
		</form:form>
	</div>
</div>
<script id="ui-block-template" type="text/x-handlebars-template">
	<profit:edit-education-block index="{{blockIndex}}" />
</script>