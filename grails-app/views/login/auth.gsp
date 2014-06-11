<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="shortcut icon" href="${createLinkTo(dir:'images', file:'favicon.ico')}" type="image/x-icon" />

    <title>SEO Tracker - Авторизация</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/css/sb-admin.css" rel="stylesheet">

    <script src="${resource(dir: 'js', file: 'jquery-1.10.2.js')}"></script>
    <script src="${resource(dir: 'js/bs', file: 'bootstrap.min.js')}"></script>
    <script src="${resource(dir: 'js/bs/plugins/metisMenu', file: 'jquery.metisMenu.js')}"></script>

</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Авторизация</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action='${postUrl}' method='POST'>
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Логин" name="j_username" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Пароль" name="j_password" type="password" value="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="${rememberMeParameter}" type="checkbox" value="Оставаться в системе" <g:if test='${hasCookie}'>checked='checked'</g:if>>Оставаться в системе
                                </label>
                            </div>
                            <button type="submit" class="btn btn-lg btn-success btn-block">Вход</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
