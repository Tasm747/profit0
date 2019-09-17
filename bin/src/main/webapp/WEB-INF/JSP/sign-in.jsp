<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="profit" 	tagdir="/WEB-INF/tags"%>

<div class="panel panel-info small-center-block">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-sign-in"></i> Login in Your own cabinet 
		</h3>
	</div>
	<div class="panel-body">
		<form action="/sign-in-handler" method="post">
			<sec:csrfInput/>
			<c:if test="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION != null}">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }
					<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
				</div>
			</c:if>
			<div class="help-block">You can use Your UID or Email or Phone to login</div>
			<div class="form-group">
				<label for="uid">Login</label> <input id="uid" name="uid" class="form-control" placeholder="UID or Email or Phone" required autofocus>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input id="password" type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			<div class="form-group">
				<label><input type="checkbox" name="remember-me" value="true"> Remember me</label>
			</div>
			<hr/>
			<div class="form-group">
			<button type="submit" class="btn btn-success">Enter</button>
			
			<a href="/fbLogin" class="btn btn-primary pull-right"><i class="fa fa-facebook"></i>&nbsp;&nbsp;Sign in with Facebook</a>
			</div>
			<hr/>
			<div class="text-center">
			<a href="/restore" >Restore Login</a>
			</div>
		</form>
	</div>
</div>