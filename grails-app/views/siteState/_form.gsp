<%@ page import="ru.seoTracker.SiteState" %>



<div class="fieldcontain ${hasErrors(bean: siteStateInstance, field: 'pr', 'error')} required">
	<label for="pr">
		<g:message code="siteState.pr.label" default="Pr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pr" type="number" value="${siteStateInstance.pr}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteStateInstance, field: 'site', 'error')} required">
	<label for="site">
		<g:message code="siteState.site.label" default="Site" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="site" name="site.id" from="${ru.seoTracker.Site.list()}" optionKey="id" required="" value="${siteStateInstance?.site?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteStateInstance, field: 'tcy', 'error')} required">
	<label for="tcy">
		<g:message code="siteState.tcy.label" default="Tcy" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tcy" type="number" value="${siteStateInstance.tcy}" required=""/>

</div>

