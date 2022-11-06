<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="layout" content="main" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>

        * {
          box-sizing: border-box;
        }
        body {
          font-size: 14px;
          padding-top: 80px;
        }
        .titulo{
          width: 300px; 
          color: rgba(43,43,43,1);
          font-family: Arial;
          font-weight: Bold;
          font-size: 40px;
          opacity: 1;
        }
        .subTitulo{
		width: 400px; 
		color: rgba(43,43,43,1);
		top: 20px;
		left: 15%;
		font-family: Arial;
		font-size: 25px;
		opacity: 1;
		text-align: left;
	  }
    </style>
</head>
<body>
    <div class="form-row">
        <div class="col-md-3"></div>
        <div class="col-md-6" style="display: flex;flex-direction: column;justify-content: center;text-align: center;">
            <h1 class="titulo" >Hacer orden</h1>
            <div class="card">
                <form>
                    <div class="form-row">
                        <div class="col-md-1"></div>
                        <div class="col-md-11">
                            <h2 class="subTitulo"><iconify-icon icon="fa-regular:user" width="25px"></iconify-icon> Informacion de contacto</h2>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" placeholder="Nombre">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" placeholder="Apellido">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-1"></div>
                        <div class="col-md-11">
                            <h2 class="subTitulo"><iconify-icon icon="fa:map-marker" width="20px"></iconify-icon> Direccion</h2>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" placeholder="Calle y numero">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Departamento (opcional)">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div class="form-row" style="padding-top: 2%;padding-bottom: 3%;">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" placeholder="Codigo postal">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" placeholder="Ciudad">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="form-row">
		<div class="col-md-7"></div>
		<div class="col-md-2">
			<br>
			<g:link controller="checkout" action="comprar" style="float: right;background: rgba(0, 44, 133, 1)" class="btn btn-primary btn-block btn-lg">Terminar compra</g:link>
		</div>
	</div>
   
</body>
</html>