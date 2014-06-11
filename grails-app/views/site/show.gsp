<%@ page import="ru.seoTracker.Site" %>


<g:render template="/layouts/header"/>

<div class="top20"></div>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-bookmark fa-fw"></i> Сайт <a href="${siteInstance.url}">${siteInstance.url}</a>

        <div class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                    Действия
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li>
                        <a href="${createLink(action: 'saveState', id: siteInstance.id)}">Запросить метрики</a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#sendReportConfirm">Отправить отчет клиенту</a>
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
        PageRank сайта:
        <div id="sitePrChart"></div>
        Тематический индекс цитирования сайта:
        <div id="siteTcyChart"></div>
        Клиент: <g:link controller="client" action="show" id="${siteInstance.client.id}">${siteInstance.client}</g:link>
    </div>
</div>

<div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="Подтверждение удаления"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Подтверждение удаления сайта</h4>
            </div>

            <div class="modal-body">
                Вы уверены, что хотите удалить сайт из системы?
            </div>

            <div class="modal-footer">
                <g:form url="[resource: siteInstance, action: 'delete']" method="DELETE">
                    <button type="submit" class="btn btn-primary">Удалить сайт</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </g:form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="sendReportConfirm" tabindex="-1" role="dialog" aria-labelledby="Подтверждение отправки отчета"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Подтверждение отправки отчета</h4>
            </div>

            <div class="modal-body">
                Вы уверены, что хотите отправить отчет клиенту?
            </div>

            <div class="modal-footer">
                <a href="${createLink(action: 'sendStatsToClient', id: siteInstance.id)}"
                   class="btn btn-primary">Отправить отчет</a>
                <button class="btn btn-default" data-dismiss="modal">Отмена</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<script type="text/javascript">
    $(function () {

        var data = <g:applyCodec encodeAs="none">
                ${siteInstance.getStatesJSON()}
                </g:applyCodec>

                Morris.Line({
                    element: 'sitePrChart',
                    data: data,
                    xkey: 'date',
                    ykeys: ['pr'],
                    labels: ['Page Rank'],
                    pointSize: 2,
                    hideHover: 'auto',
                    resize: true,
                    smooth: false
                });

        Morris.Line({
            element: 'siteTcyChart',
            data: data,
            xkey: 'date',
            ykeys: ['tcy'],
            labels: ['тИЦ'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true,
            smooth: false
        });
    });
</script>

<g:render template="/layouts/footer"/>