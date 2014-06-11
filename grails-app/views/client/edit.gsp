<%@ page import="ru.seoTracker.Client" %>
<g:render template="/layouts/header"/>


<h3 class="page-header">Редактирование клиента ${clientInstance}</h3>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${clientInstance}">
    <div class="panel panel-danger">
        <div class="panel-heading"></div>

        <div class="panel-body">
            <g:eachError bean="${clientInstance}" var="error">
                <div><g:message error="${error}"/></div>
            </g:eachError>
        </div>
    </div>
</g:hasErrors>
<g:form url="[resource: clientInstance, action: 'update']" method="PUT" class="form-horizontal">
    <g:hiddenField name="version" value="${clientInstance?.version}"/>
    <g:render template="form"/>
    <div class="pull-right">
        <button type="submit"
                class="btn btn-primary">${message(code: 'default.button.update.label', default: 'Сохранить')}</button>
        <button type="reset"
                class="btn btn-default">${message(code: 'default.button.reset.label', default: 'Сброс')}</button>
    </div>
</g:form>
</div>
</body>
</html>
