
<%@ page import="ru.linkcounter.Client" %>

	<body>
		<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-client" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				<g:if test="${clientInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="client.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${clientInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.surname}">
				<li class="fieldcontain">
					<span id="surname-label" class="property-label"><g:message code="client.surname.label" default="Surname" /></span>
					
						<span class="property-value" aria-labelledby="surname-label"><g:fieldValue bean="${clientInstance}" field="surname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.patronymic}">
				<li class="fieldcontain">
					<span id="patronymic-label" class="property-label"><g:message code="client.patronymic.label" default="Patronymic" /></span>
					
						<span class="property-value" aria-labelledby="patronymic-label"><g:fieldValue bean="${clientInstance}" field="patronymic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="client.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clientInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="client.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${clientInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.icq}">
				<li class="fieldcontain">
					<span id="icq-label" class="property-label"><g:message code="client.icq.label" default="Icq" /></span>
					
						<span class="property-value" aria-labelledby="icq-label"><g:fieldValue bean="${clientInstance}" field="icq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="client.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${clientInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.info}">
				<li class="fieldcontain">
					<span id="info-label" class="property-label"><g:message code="client.info.label" default="Info" /></span>
					
						<span class="property-value" aria-labelledby="info-label"><g:fieldValue bean="${clientInstance}" field="info"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clientInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
