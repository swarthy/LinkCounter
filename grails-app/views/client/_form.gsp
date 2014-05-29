<%@ page import="ru.linkcounter.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="client.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${clientInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'surname', 'error')} required">
	<label for="surname">
		<g:message code="client.surname.label" default="Surname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="surname" required="" value="${clientInstance?.surname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'patronymic', 'error')} required">
	<label for="patronymic">
		<g:message code="client.patronymic.label" default="Patronymic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="patronymic" required="" value="${clientInstance?.patronymic}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="client.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${clientInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="client.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${clientInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'icq', 'error')} ">
	<label for="icq">
		<g:message code="client.icq.label" default="Icq" />
		
	</label>
	<g:field name="icq" type="number" value="${clientInstance.icq}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="client.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${clientInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'info', 'error')} ">
	<label for="info">
		<g:message code="client.info.label" default="Info" />
		
	</label>
	<g:textField name="info" value="${clientInstance?.info}"/>

</div>

