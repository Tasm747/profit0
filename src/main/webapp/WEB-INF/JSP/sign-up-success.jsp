<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="CURRENT_PROFILE"/>

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-thumbs-o-up"></i> Registration successfull
		</h3>
	</div>
	<div class="panel-body">
		<p>After Registration Your profile would be accessible under this link: <a href="/${CURRENT_PROFILE.username }">${applicationHost}/${CURRENT_PROFILE.username }</a></p>
		<p>Your UID: <strong>${CURRENT_PROFILE.username }</strong>. Use this UID,to enter Your own Cabinet</p>
		<hr/>
		<div class="row">
			<div class="col-xs-12 text-center">
				<a href="/edit" class="btn btn-primary">Complete registration</a>
			</div>
		</div>
	</div>
</div>