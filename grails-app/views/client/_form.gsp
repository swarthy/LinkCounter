<%@ page import="ru.seoTracker.Client" %>


<div class="form-group ${hasErrors(bean: clientInstance, field: 'surname', 'has-error')}">
    <label for="surname" class="col-sm-2 control-label">
        <g:message code="client.surname.label" default="Фамилия"/>
    </label>

    <div class="col-sm-10">
        <input name="surname" value="${clientInstance?.surname}" class="form-control"
               data-bv-notempty="true"
               data-bv-notempty-message="Фамилия не может быть пустой">
    </div>

</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'name', 'has-error')}">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="client.name.label" default="Имя"/>
    </label>

    <div class="col-sm-10">
        <input name="name" required value="${clientInstance?.name}" class="form-control"
               data-bv-notempty="true"
               data-bv-notempty-message="Имя не может быть пустым">
    </div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'patronymic', 'has-error')}">
    <label for="patronymic" class="col-sm-2 control-label">
        <g:message code="client.patronymic.label" default="Отчество"/>
    </label>

    <div class="col-sm-10">
        <input name="patronymic" required value="${clientInstance?.patronymic}" class="form-control"
               data-bv-notempty="true"
               data-bv-notempty-message="Отчество не может быть пустым">
    </div>

</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'email', 'has-error')}">
    <label for="email" class="col-sm-2 control-label">
        <g:message code="client.email.label" default="E-Mail"/>
    </label>

    <div class="col-sm-10">
        <input type="email" name="email" value="${clientInstance?.email}" class="form-control"
               data-bv-notempty="true"
               data-bv-notempty-message="Электронный адрес не может быть пустым"
               data-bv-emailaddress="true"
               data-bv-notempty-message="Электронный адрес заполнен неверно">
    </div>

</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'city', 'has-error')} ">
    <label for="city" class="col-sm-2 control-label">
        <g:message code="client.city.label" default="Город"/>
    </label>

    <div class="col-sm-10">
        <input name="city" value="${clientInstance?.city}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'phone', 'has-error')}">
    <label for="phone" class="col-sm-2 control-label">
        <g:message code="client.phone.label" default="Номер телефона"/>
    </label>

    <div class="col-sm-10">
        <input type="number" name="phone" value="${clientInstance?.phone}" class="form-control"/>
    </div>

</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'icq', 'has-error')} ">
    <label for="icq" class="col-sm-2 control-label">
        <g:message code="client.icq.label" default="Номер ICQ"/>
    </label>

    <div class="col-sm-10">
        <input name="icq" type="number" value="${clientInstance.icq}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'info', 'has-error')} ">
    <label for="info" class="col-sm-2 control-label">
        <g:message code="client.info.label" default="Дополнительно"/>
    </label>

    <div class="col-sm-10">
        <textarea name="info" class="form-control">${clientInstance?.info}</textarea>
    </div>
</div>

