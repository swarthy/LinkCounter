<div class="form-group ${hasErrors(bean: siteInstance, field: 'url', 'has-error')}">
    <label for="url" class="col-sm-2 control-label">
        <g:message code="Client.url.label" default="Адрес"/>
    </label>

    <div class="col-sm-10">
        <input name="url" value="${siteInstance?.url}" class="form-control"
               data-bv-notempty="true"
               data-bv-notempty-message="Адрес не может быть пустым"
               data-bv-uri="true"
               data-bv-uri-message="Адрес задан некорректно"
               >
    </div>
    <input type="hidden" name="client" value="${client.id}">
</div>
