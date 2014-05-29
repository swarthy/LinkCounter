<g:render template="/layouts/header"/>

<%@ page import="ru.linkcounter.Client" %>

<h1 class="page-header">Клиенты</h1>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover table-responsive">
        <thead>
        <tr role="row">
            <g:sortableColumn property="surname" title="${message(code: 'client.surname.label', default: 'Фамилия')}"/>
            <g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Имя')}"/>
            <g:sortableColumn property="patronymic"
                              title="${message(code: 'client.patronymic.label', default: 'Отчество')}"/>
            <g:sortableColumn property="email" title="${message(code: 'client.email.label', default: 'Почта')}"/>
            <g:sortableColumn property="city" title="${message(code: 'client.city.label', default: 'Город')}"/>
            <g:sortableColumn property="phone" title="${message(code: 'client.phone.label', default: 'Телефон')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${clientInstanceList}" status="i" var="clientInstance">
            <tr>

                <td><g:link action="show"
                            id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: clientInstance, field: "name")}</td>

                <td>${fieldValue(bean: clientInstance, field: "patronymic")}</td>

                <td>${fieldValue(bean: clientInstance, field: "email")}</td>

                <td>${fieldValue(bean: clientInstance, field: "city")}</td>

                <td>${fieldValue(bean: clientInstance, field: "phone")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="row">
        <div class="col-sm-6"></div>

        <div class="col-sm-6">
            <div class="pagination" style="float: right">
                <g:paginate total="${clientInstanceCount ?: 0}"/>
            </div>
        </div>
    </div>

</div>
<g:render template="/layouts/footer"/>