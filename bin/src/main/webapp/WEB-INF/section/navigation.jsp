<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="CURRENT_PROFILE"/>

<nav class="navbar navbar-default resume-nav">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/welcome">ProfIT</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="/sign-in">Sign-in</a></li>
					<li><a href="/sign-up">Sign-up</a></li>
				</sec:authorize>
				<sec:authorize access="hasAuthority('USER')">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${CURRENT_PROFILE.fullName } <span class="caret"></span></a>
						<ul class="dropdown-menu profile-menu">
							<li><a href="/${CURRENT_PROFILE.username }"><i class="fa fa-eye"></i>My Profile</a></li>
							<li><a href="/edit"><i class="fa fa-pencil"></i>Edit</a></li>
							<li><a href="/edit/password"><i class="fa fa-unlock-alt"></i>Password</a></li>
							<li><a href="/remove"><i class="fa fa-trash-o"></i>Remove</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="javascript:profit.logout('${_csrf.token}');"><i class="fa fa-sign-out"></i>Logout</a></li>
						</ul></li>
				</sec:authorize>
			</ul>
			<form action="/search" method="get" class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input class="form-control" placeholder="Search" name="query" value="${query }">
				</div>
				<button type="submit" class="btn btn-primary">Search</button>
			</form>
		</div>
	</div>
</nav>