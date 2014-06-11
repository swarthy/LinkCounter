<%@ page import="ru.seoTracker.Client" %>

<g:render template="/layouts/header"/>
<div class="top20"></div>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>

<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-user fa-fw"></i> Страница клиента
        <div class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                    Действия
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li>
                        <a href="${createLink(controller: 'Site', action: 'create', id: clientInstance.id)}">Добавить сайт</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#deleteConfirm">Удалить</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel-body">

        <div class="col-sm-8">
            <div class="panel panel-default">
                <div class="panel-heading">Сайты</div>

                <div class="panel-body">

                    <table class="table">
                        <thead>
                        <tr>
                            <th>Адрес</th>
                            <th>PageRank</th>
                            <th>тИЦ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${clientInstance.sites}">
                            <tr>
                                <td><a href="${createLink(resource: it, action: 'show' )}">${it.url}</a></td>
                                <td><i class="glyphicon glyphicon-arrow-<g:if test="${it.getLastStatesDiff().pr < 0}">down</g:if><g:else>up</g:else>"></i>${Math.abs(it.getLastStatesDiff().pr)}</td>
                                <td><i class="glyphicon glyphicon-arrow-<g:if test="${it.getLastStatesDiff().tcy < 0}">down</g:if><g:else>up</g:else>"></i>${Math.abs(it.getLastStatesDiff().tcy)}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>


        <div class="col-sm-4 pull-right">
            <div class="panel panel-default">
                <div class="panel-heading">Личные данные
                    <div class="pull-right">
                        <a href="${createLink(action: 'edit', id: clientInstance.id)}"
                           class="btn btn-default btn-xs"><i
                                class="glyphicon glyphicon-pencil"></i></a>
                    </div>
                </div>

                <div class="panel-body">
                    <div class="row">
                        <span class="col-sm-3">
                            <g:message code="client.surname.label" default="Фамилия"/>
                        </span>

                        <span class="col-sm-2">
                            <g:fieldValue bean="${clientInstance}" field="surname"/>
                        </span>
                    </div>

                    <div class="row">
                        <div class="col-sm-3">
                            <g:message code="client.name.label" default="Имя"/>
                        </div>

                        <div class="col-sm-2">
                            <g:fieldValue bean="${clientInstance}" field="name"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-3">
                            <g:message code="client.patronymic.label" default="Отчество"/>
                        </div>

                        <div class="col-sm-2">
                            <g:fieldValue bean="${clientInstance}" field="patronymic"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-3">
                            <g:message code="client.email.label" default="E-Mail"/>
                        </div>

                        <div class="col-sm-2">
                            <a href='mailto:<g:fieldValue bean="${clientInstance}" field="email"/>'><g:fieldValue bean="${clientInstance}" field="email"/></a>
                        </div>
                    </div>

                    <g:if test="${clientInstance?.city}">
                        <div class="row">
                            <div class="col-sm-3">
                                <g:message code="client.city.label" default="Город"/>
                            </div>

                            <div class="col-sm-2">
                                <g:fieldValue bean="${clientInstance}" field="city"/>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${clientInstance?.phone}">
                        <div class="row">
                            <div class="col-sm-3">
                                <g:message code="client.phone.label" default="Телефон"/>
                            </div>

                            <div class="col-sm-2">
                                <g:fieldValue bean="${clientInstance}" field="phone"/>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${clientInstance?.icq}">
                        <div class="row">
                            <div class="col-sm-3">
                                <g:message code="client.icq.label" default="ICQ"/>
                            </div>

                            <div class="col-sm-2">
                                <g:fieldValue bean="${clientInstance}" field="icq"/>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${clientInstance?.info}">
                        <div class="row">
                            <div class="col-sm-3">
                                <g:message code="client.info.label" default="Инфо"/>
                            </div>

                            <div class="col-sm-2">
                                <g:fieldValue bean="${clientInstance}" field="info"/>
                            </div>
                        </div>
                    </g:if>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="Подтверждение удаления"
         aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">Подтверждение удаления</h4>
                </div>

                <div class="modal-body">
                    Вы уверены, что хотите удалить данные о клиенте? Это действие необратимо и повлечет за собой удаление всех сайтов, которые принадлежат клиенту.
                </div>

                <div class="modal-footer">
                    <g:form url="[resource: clientInstance, action: 'delete']" method="DELETE">
                        <button type="submit" class="btn btn-primary">Удалить клиента</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                    </g:form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

</div>



<g:render template="/layouts/footer"/>