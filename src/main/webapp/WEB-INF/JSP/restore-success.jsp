<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="CURRENT_PROFILE"/>

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-thumbs-o-up"></i> Your request was proceeded
		</h3>
	</div>
	<div class="panel-body">
		<p>Please check your e-mail,to restore your login!</p>
	</div>
</div>