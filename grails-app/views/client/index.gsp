<g:render template="/layouts/header"/>

<%@ page import="grails.converters.JSON; ru.seoTracker.Client" %>

<div class="top20"></div>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-users fa-fw"></i> Список клиентов
        <div class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                    Действия
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li>
                        <a href="${createLink(action: 'create')}">Добавить клиента</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel-body">
        <table id="clientsTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>${message(code: 'client.surname.label', default: 'Фамилия')}</th>
                <th>${message(code: 'client.name.label', default: 'Имя')}</th>
                <th>${message(code: 'client.patronymic.label', default: 'Отчество')}</th>
                <th>${message(code: 'client.email.label', default: 'Почта')}</th>
                <th>${message(code: 'client.city.label', default: 'Город')}</th>
                <th>${message(code: 'client.phone.label', default: 'Телефон')}</th>
                <th>${message(code: 'client.icq.label', default: 'ICQ')}</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#clientsTable').dataTable({
            <g:applyCodec encodeAs="none">
            "data": ${Client.list().collect { it.toJSONArray() } as JSON},
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
                $(row).children(":first").wrapInner("<a href='show/"+data[7]+"'></a>");
            }
        });
    });
</script>

<g:render template="/layouts/footer"/>