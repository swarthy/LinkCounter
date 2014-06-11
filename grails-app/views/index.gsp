<g:render template="/layouts/header"/>

<%@ page import="ru.seoTracker.Site" %>
<div class="top20"></div>

<div class="panel panel-warning">
    <div class="panel-heading">Внимание! У данных сайтов снизились метрики</div>

    <div class="panel-body">
        <div class="list-group">
            <g:each var="site" in="${Site.list()}">
                <g:if test="${site.getLastStatesDiff().pr < 0 || site.getLastStatesDiff().tcy < 0}">
                    <a href="${createLink(controller: 'Site', action: 'show', id: site.id)}"
                       class="list-group-item">${site.url} PageRank: ${site.getLastStatesDiff().prLast} (${site.getLastStatesDiff().pr > 0 ? "+" + site.getLastStatesDiff().pr : site.getLastStatesDiff().pr}), тИЦ: ${site.getLastStatesDiff().tcyLast} (${site.getLastStatesDiff().tcy > 0 ? "+" + site.getLastStatesDiff().tcy : site.getLastStatesDiff().tcy})</a>
                </g:if>
            </g:each>
        </div>
    </div>
</div>

<div class="panel panel-info">
    <div class="panel-heading">Статистика системы</div>

    <div class="panel-body">
        Клиентов зарегистрировано: ${ru.seoTracker.Client.count()}<br>
        Отслеживается сайтов: ${ru.seoTracker.Site.count()}
    </div>
</div>

<g:render template="/layouts/footer"/>