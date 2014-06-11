<g:render template="/layouts/header"/>


<h3 class="page-header">Добавление сайта</h3>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${siteInstance}">
    <div class="panel panel-danger">
        <div class="panel-heading"></div>

        <div class="panel-body">
            <g:eachError bean="${siteInstance}" var="error">
                <div><g:message error="${error}"/></div>
            </g:eachError>
        </div>
    </div>
</g:hasErrors>
<g:form url="[resource: siteInstance, action: 'save']" class="form-horizontal">
    <g:render template="form"/>
    <div class="pull-right">
        <button type="submit"
                class="btn btn-primary">${message(code: 'default.button.create.label', default: 'Создать')}</button>
        <button type="reset"
                class="btn btn-default">${message(code: 'default.button.reset.label', default: 'Сброс')}</button>
    </div>
</g:form>

<g:render template="/layouts/footer"/>