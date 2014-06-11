
<%@ page import="ru.seoTracker.SiteState" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteState.label', default: 'SiteState')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteState" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteState" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteState">
			
				<g:if test="${siteStateInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteState.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label">${siteStateInstance?.dateCreated}</span>
					
				</li>
				</g:if>
			
				<g:if test="${siteStateInstance?.pr}">
				<li class="fieldcontain">
					<span id="pr-label" class="property-label"><g:message code="siteState.pr.label" default="Pr" /></span>
					
						<span class="property-value" aria-labelledby="pr-label"><g:fieldValue bean="${siteStateInstance}" field="pr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteStateInstance?.site}">
				<li class="fieldcontain">
					<span id="site-label" class="property-label"><g:message code="siteState.site.label" default="Site" /></span>
					
						<span class="property-value" aria-labelledby="site-label"><g:link controller="site" action="show" id="${siteStateInstance?.site?.id}">${siteStateInstance?.site?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteStateInstance?.tcy}">
				<li class="fieldcontain">
					<span id="tcy-label" class="property-label"><g:message code="siteState.tcy.label" default="Tcy" /></span>
					
						<span class="property-value" aria-labelledby="tcy-label"><g:fieldValue bean="${siteStateInstance}" field="tcy"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:siteStateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${siteStateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
