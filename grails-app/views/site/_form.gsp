<%@ page import="ru.linkcounter.Site" %>



<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'keywords', 'error')} ">
	<label for="keywords">
		<g:message code="site.keywords.label" default="Keywords" />
		
	</label>
	<g:select name="keywords" from="${ru.linkcounter.Keyword.list()}" multiple="multiple" optionKey="id" size="5" value="${siteInstance?.keywords*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="site.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${ru.linkcounter.Project.list()}" optionKey="id" required="" value="${siteInstance?.project?.id}" class="many-to-one"/>

</div>

