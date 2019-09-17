<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<%@ attribute name="formName" 		required="true"  type="java.lang.String" %>

<spring:hasBindErrors name="${formName }">
	<div class="alert alert-danger">Please,fix the errors before saving data!</div>
</spring:hasBindErrors>