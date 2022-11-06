<!doctype html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
            <g:layoutTitle default="Tienda Huergo"/>
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <script src="https://code.iconify.design/iconify-icon/1.0.0/iconify-icon.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <asset:stylesheet src="application.css"/>

        <g:layoutHead/>
    </head>

    <body>
        

        <nav class="navbar navbar-expand-lg fixed-top navbar-dark d-flex flex-row" style="background-color: #7B8A8B">
            <a class="navbar-brand" href="https://huergo.com.ar/Login.aspx">Huergo - SIPA</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <ul id="ulMenu" class="navbar-nav mx-auto">
                <li class="nav-item">
                     <g:link controller="catalogo" action="index"> <img src="http://www.newdesignfile.com/postpic/2012/09/small-apple-logo_154074.jpg" alt="apple icon" id="icon" width="50px"/></g:link>
                </li>
            </ul>
           <div style="padding-right: 5px">
                <g:link class="ml-auto" controller="carrito" action="index"> <iconify-icon icon="bi:cart-fill" width="50px"></iconify-icon></g:link>
                <g:link class="ml-auto" controller="logout" action="index"> <iconify-icon icon="ion:log-out-sharp" width="50px"></iconify-icon></g:link>
            </div>
        </nav>

        <g:layoutBody/>
        <asset:javascript src="application.js"/>
    </body>
</html>
