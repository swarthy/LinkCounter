<%@ page import="ru.linkcounter.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="project.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${ru.linkcounter.Client.list()}" optionKey="id" required="" value="${projectInstance?.client?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'sites', 'error')} ">
	<label for="sites">
		<g:message code="project.sites.label" default="Sites" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.sites?}" var="s">
    <li><g:link controller="site" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="site" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'site.label', default: 'Site')])}</g:link>
</li>
</ul>


</div>

