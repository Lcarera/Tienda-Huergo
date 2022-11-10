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
                            <input type="text" class="form-control" id="nombre" placeholder="Nombre">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="apellido" placeholder="Apellido">
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
                            <input type="text" class="form-control" id="direccion" placeholder="Calle y numero">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="departamento" placeholder="Departamento (opcional)">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div class="form-row" style="padding-top: 2%;padding-bottom: 3%;">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="cp" placeholder="Codigo postal">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="ciudad" placeholder="Ciudad">
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
			<button style="float: right;background: rgba(0, 44, 133, 1)" onclick="hacerOrden();" class="btn btn-primary btn-block btn-lg">Terminar compra</button>
		</div>
	</div>
   
    <script>
        function revisarDatos() {
            var datoFaltante = null
            if(!$("#nombre").val()) 
                datoFaltante = "Nombre"

            if(!$("#apellido").val()) 
                datoFaltante = "Apellido"
            
            if(!$("#direccion").val()) 
                datoFaltante = "Direccion"

            if(!$("#cp").val()) 
                datoFaltante = "Codigo Postal"
            
            if(!$("#ciudad").val()) 
                datoFaltante = "Ciudad"

            if (datoFaltante) {
                Swal.fire({
                    title: 'Faltan datos',
                    text: "No ingreso su " + datoFaltante,
                    type:"error",
                    confirmButtonText: 'Ok.',
                })
                return false
            }
            
            return true
        }
        
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        function hacerOrden() {
            if (revisarDatos()) {
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: "Se realizara la compra",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Si.',
                    cancelButtonText: 'No, cancelar.'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax("${createLink(controller:'checkout', action:'hacerCompra')}", {
                            dataType: "json",
                            data: {
                                nombreApellido: $("#nombre").val() + " " + $("#apellido").val(),
                                direccion: $("#direccion").val(),
                                codigoPostal: $("#cp").val(),
                                ciudad: $("#ciudad").val(),
                                departamento: $("#departamento").val()
                            }
                        }).done(function(data) {
                            if (data.error) {
                                Swal.fire("Salio mal 🥺", "Hubo un error haciendo tu orden, intentalo de nuevo", "error");
                                return
                            }
                            else {
                                Swal.fire({
                                    title: 'Compra realizada',
                                    text: "",
                                    icon: 'success',
                                    confirmButtonText: 'Seguir comprando.',
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.href = "../catalogo/index"
                                    } 
                                })
                            }
                        });
                    }
                })
            }
        }
    </script>
</body>
</html>