<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit" tagdir="/WEB-INF/tags"%>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="CURRENT_PROFILE"/>
<c:set var="showEdit" value="${CURRENT_PROFILE.id == profile.id }" />
</sec:authorize>

<div id="profile-${profile.id }" class="row profile" >
	<div class="col-xs-12 col-sm-6 col-md-4">
		<profit:profile-name profile="${profile }" showEdit="${showEdit }"/>
		<div class="hidden-xs">
			<c:if test="${fn:length(profile.languages) > 0}">
			<profit:profile-languages languages="${profile.languages }" showEdit="${showEdit }" />
			</c:if>
			<c:if test="${fn:length(profile.hobbies) > 0}">
			<profit:profile-hobbies hobbies="${profile.hobbies }" showEdit="${showEdit }" />
			</c:if>
			<c:if test="${profile.info != null}">
			<profit:profile-info profile="${profile }" showEdit="${showEdit }"/>
			</c:if>
		</div>
	</div>
	<div class="col-xs-12 col-sm-6 col-md-8">
		<profit:profile-objective profile="${profile }" showEdit="${showEdit }" />
		<c:if test="${fn:length(profile.skills) > 0}">
		<profit:profile-skills skills="${profile.skills }" showEdit="${showEdit }" />
		</c:if>
		<c:if test="${fn:length(profile.practics) > 0}">
		<profit:profile-practics practics="${profile.practics }" showEdit="${showEdit }" />
		</c:if>
		<c:if test="${fn:length(profile.certificates) > 0}">
		<profit:profile-certificates certificates="${profile.certificates }" showEdit="${showEdit }" />
		</c:if>
		<c:if test="${fn:length(profile.courses) > 0}">
		<profit:profile-courses courses="${profile.courses }" showEdit="${showEdit }" />
		</c:if>
		<c:if test="${fn:length(profile.educations) > 0}">
		<profit:profile-education educations="${profile.educations }" showEdit="${showEdit }" />
		</c:if>
		
	</div>
	<div class="col-xs-12 visible-xs">
		<c:if test="${fn:length(profile.languages) > 0}">
		<profit:profile-languages languages="${profile.languages }" showEdit="${showEdit }" />
		</c:if>
		<c:if test="${fn:length(profile.hobbies) > 0}">
		<profit:profile-hobbies hobbies="${profile.hobbies }" showEdit="${showEdit }" />
		</c:if>
		<c:if test="${profile.info != null}">
		<profit:profile-info profile="${profile }" showEdit="${showEdit }"/>
		</c:if>
	</div>
</div>

<c:if test="${fn:length(profile.certificates) > 0}">
<content tag="js-init">
<script>
$(document).ready(function(){
	profit.initCertificateViewer();
});
</script>
</content>
</c:if>