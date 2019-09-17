<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>
<sec:authentication property="principal" var="CURRENT_PROFILE" />
<div class="panel panel-warning">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-exclamation-circle"></i> Delete account - No roll back operation!
		</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-xs-12 text-center">
				<h4>Delete account <strong>Could not be called back!</strong>. Please, confirm delete: <strong>${CURRENT_PROFILE.username }</strong>!</h4>
				<hr/>
				<form action="/remove" method="post">
					<sec:csrfInput/>
					<input type="submit" value="Confirm delete" class="btn btn-danger" />
				</form>
			</div>
		</div>
	</div>
</div>