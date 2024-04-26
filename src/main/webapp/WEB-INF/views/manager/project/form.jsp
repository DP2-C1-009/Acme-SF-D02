<%--
- form.jsp
-
- Copyright (C) 2012-2024 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" uri="http://acme-framework.org/"%>

<acme:form>
	<acme:input-textbox code="manager.project.form.label.code" path="code"/>
	<acme:input-textbox code="manager.project.form.label.title" path="title"/>
	<acme:input-textarea code="manager.project.form.label.pAbstract" path="pAbstract"/>
	<acme:input-integer code="manager.project.form.label.cost" path="cost"/>
	<acme:input-url code="manager.project.form.label.optional-link" path="optionalLink"/>
	<acme:input-checkbox code="manager.project.form.label.fatalErrors" path="fatalErrors"/>
	
	<jstl:choose>
	
	<jstl:when test="${_command == 'show' && draftMode == 'No'}">
		<acme:button code="manager.project.form.button.user-stories" action="/manager/user-story/list-by-projects?masterId=${id}"/>
	</jstl:when>
	
	<jstl:when test="${acme:anyOf(_command, 'show|update|delete|publish') && draftMode == 'Yes' || draftMode == 'S�'}">
		<acme:button code="manager.project.form.button.user-stories" action="/manager/user-story/list-by-projects?masterId=${id}"/>
		<acme:submit code="manager.project.form.button.update" action="/manager/project/update"/>
		<acme:submit code="manager.project.form.button.delete" action="/manager/project/delete"/>
		<acme:submit code="manager.project.form.button.publish" action="/manager/project/publish?masterId=${id}"/>
	</jstl:when>
	
	<jstl:when test="${_command == 'create'}">
		<acme:submit code="manager.project.form.button.create" action="/manager/project/create"/>
	</jstl:when>
	</jstl:choose>
</acme:form>