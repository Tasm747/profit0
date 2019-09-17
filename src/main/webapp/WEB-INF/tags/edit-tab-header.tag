<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ attribute name="selected" required="true" type="java.lang.String" %>

<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" ${selected == 'profile'     ? 'class="active"' : ''}><a href="/edit">Main</a></li>
	<li role="presentation" ${selected == 'contacts'    ? 'class="active"' : ''}><a href="/edit/contacts">Contacts</a></li>
	<li role="presentation" ${selected == 'skills'      ? 'class="active"' : ''}><a href="/edit/skills">Technical skills</a></li>
	<li role="presentation" ${selected == 'practics'    ? 'class="active"' : ''}><a href="/edit/practics">Practical experience</a></li>
	<li role="presentation" ${selected == 'certificates'? 'class="active"' : ''}><a href="/edit/certificates">Certificates</a></li>
	<li role="presentation" ${selected == 'courses'	 	? 'class="active"' : ''}><a href="/edit/courses">Courses</a></li>
	<li role="presentation" ${selected == 'education'   ? 'class="active"' : ''}><a href="/edit/education">Education</a></li>
	<li role="presentation" ${selected == 'languages'   ? 'class="active"' : ''}><a href="/edit/languages">Languages</a></li>
	<li role="presentation" ${selected == 'hobbies'     ? 'class="active"' : ''}><a href="/edit/hobbies">Hobbies</a></li>
	<li role="presentation" ${selected == 'info'   	 	? 'class="active"' : ''}><a href="/edit/info">Information</a></li>
</ul>