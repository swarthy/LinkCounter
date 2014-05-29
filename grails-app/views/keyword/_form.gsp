<%@ page import="ru.linkcounter.Keyword" %>



<div class="fieldcontain ${hasErrors(bean: keywordInstance, field: 'sites', 'error')} ">
	<label for="sites">
		<g:message code="keyword.sites.label" default="Sites" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: keywordInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="keyword.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${keywordInstance?.value}"/>

</div>

