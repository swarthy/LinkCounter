<g:render template="/layouts/header"/>

<%@ page import="grails.converters.JSON; ru.seoTracker.Site" %>

<div class="top20"></div>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-users fa-fw"></i> Список сайтов

    </div>

    <div class="panel-body">
        <table id="clientsTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>${message(code: 'site.url.label', default: 'Адрес')}</th>
                <th>${message(code: 'site.pr.label', default: 'PageRank')}</th>
                <th>${message(code: 'site.tcy.label', default: 'тИЦ')}</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#clientsTable').dataTable({
            <g:applyCodec encodeAs="none">
            "data": ${Site.list().collect { it.toJSONArray() } as JSON},
            </g:applyCodec>
            "language": {
                "emptyTable": "Нет записей",
                "info": "Показаны записи с _START_ по _END_ из _TOTAL_.",
                "infoEmpty": "",
                "infoFiltered": "",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Показывать _MENU_ записей",
                "loadingRecords": "Загрузка...",
                "processing": "Обработка...",
                "search": "<i class='glyphicon glyphicon-search'></i> ",
                "zeroRecords": "Совпадений не найдено",
                "paginate": {
                    "first": "Начало",
                    "last": "Конец",
                    "next": "Вперед",
                    "previous": "Назад"
                },
                "aria": {
                    "sortAscending": ": сортировка по возрастанию",
                    "sortDescending": ": сортировка по убыванию"
                }
            },
            "scrollX": true,
            "fnRowCallback": function (row, data, index) {
                $(row).children(":first").wrapInner("<a href='show/"+data[3]+"'></a>");
            }
        });
    });
</script>

<g:render template="/layouts/footer"/>