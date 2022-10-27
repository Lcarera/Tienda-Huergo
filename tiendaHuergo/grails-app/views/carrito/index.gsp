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
		width: 132px; 
		color: rgba(43,43,43,1);
		top: 20px;
		left: 15%;
		font-family: Arial;
		font-weight: Bold;
		font-size: 40px;
		opacity: 1;
		text-align: left;
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
	  .precio{
		width: 400px; 
		color: rgba(43,43,43,1);
		top: 20px;
		left: 15%;
		font-family: Arial;
		font-size: 25px;
		opacity: 1;
		text-align: left;
		padding-top: 40%;
	  }
	  p{
		color: rgba(43,43,43,1);
		top: 20px;
		left: 15%;
		font-family: Arial;
		font-size: 20px;
		opacity: 1;
		text-align: left;
	  }

	  img{
		max-width:100%;
		max-height:100%
		}

	  .img-wraper{
		height: 150px;
		width: 150px;
	  }
	</style>
</head>
<body>
 	<div class="form-row">
		<div class="col-sm-1"></div>
		<div class="col-sm-2">
			<br>
			<span class="titulo">Carrito</span>
		</div>
	</div>
	<g:each var = "producto" in="${carrito?.productosVenta.sort{it.id}}">
		<div class="form-row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="card">
					<div class="card-body">
						<div class="form-row">
							<div class="col-sm-2">
								<div class="img-wraper">
									<img
									src="http://www.newdesignfile.com/postpic/2012/09/small-apple-logo_154074.jpg"
									alt="..."
									/>
								</div>
							</div> 
							<div class="col-sm-8">
								<div class="form-row">
									<h4 class="subTitulo">${producto.producto.nombre}</h4>
									<br>
									<br>
								</div>
								<div class="form-row">
									<div class="col-sm-1">
										<p >Talle</p>
									</div>
									<div id="talles${producto.id}" onclick="revisarNuevoTalle(this.id);" class="col-sm-11">
										<g:hiddenField id="${producto.id}" name="talleSeleccionado" value="${producto.producto.talle.talle}"/>
										<input type="radio" class="btn-check" name="talles${producto.id}" id="S${producto.id}" autocomplete="off">
										<label class="btn btn-secondary" for="S${producto.id}">S</label>
										<input type="radio" class="btn-check" name="talles${producto.id}" id="M${producto.id}" autocomplete="off">
										<label class="btn btn-secondary" for="M${producto.id}">M</label>
										<input type="radio" class="btn-check" name="talles${producto.id}" id="L${producto.id}" autocomplete="off">
										<label class="btn btn-secondary" for="L${producto.id}">L</label>
										<input type="radio" class="btn-check" name="talles${producto.id}" id="XL${producto.id}" autocomplete="off">
										<label class="btn btn-secondary" for="XL${producto.id}">XL</label>
									<br>
									<br>
									</div>
								</div>
								<div class="form-row">
									<div class="col-sm-2">
											<p >Cantidad</p>
									</div>
									<div class="col-sm-10">
										<div class="form-row">
											<g:hiddenField id="${producto.id}" name="cantidadProducto" value="${producto.cantidad}"/>
											<button id="menos${producto.id}" onclick="menosCantidad(this.id);" class="btn btn-light">-</button>
											<p id="cantidad${producto.id}" style="padding-left: 20px;padding-right: 20px; padding-top: 5px;">${producto.cantidad}</p>
											<button id="mas${producto.id}" onclick="masCantidad(this.id);" class="btn btn-light">+</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-2">
								<g:hiddenField id="${producto.id}" name="precioProducto" value="${producto.producto.precio * producto.cantidad}"/>
								<h4 id="precioProducto${producto.id}" value="" class="precio"></h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</g:each>
<script>
	$(document).ready(function () {
		let talles = document.getElementsByName("talleSeleccionado");
		talles.forEach(element => {
			var talle = $("#" + element.id.toString()).val();
			$("#" + talle + element.id.toString()).prop("checked",true);
		});

		let cantidades = document.getElementsByName("cantidadProducto");
		cantidades.forEach(element => {
			if(element.value == 1){
				$("#menos" + element.id.toString()).hide();
			}
		});

		let precios = document.getElementsByName("precioProducto");
		precios.forEach(element => {
			var precio = element.value.toString().split(".0")[0];
			$("#precioProducto" + element.id.toString()).text("ARS $" + precio);
		});
	});

	function revisarNuevoTalle(id) {
		id = id.split("talles")[1]
		if(document.getElementById("S" + id.toString()).checked) {
			cambiarTalle(id.toString(),"S");
		}
		if(document.getElementById("M" + id.toString()).checked) {
			cambiarTalle(id.toString(),"M");
		}
		if(document.getElementById("L" + id.toString()).checked) {
			cambiarTalle(id.toString(),"L");
		}
		if(document.getElementById("XL" + id.toString()).checked) {
			cambiarTalle(id.toString(),"XL");
		}
	}

	function cambiarTalle(productoId, talle) {
		$.ajax("${createLink(controller:'carrito', action:'ajaxCambiarTalle')}", {
			dataType: "json",
			data: {
				productoVentaId: productoId,
				talle: talle
			}
		}).done(function(data) {
			if (data.error) {
				swal("Salio mal 🥺", "Hubo un error cambiando el talle de tu producto, intentalo de nuevo", "error")
			}
			return
		});
	}

	function menosCantidad(productoId) {
		var id = productoId.split("menos")[1]
		$.ajax("${createLink(controller:'carrito', action:'restarCantidad')}", {
			dataType: "json",
			data: {
				productoVentaId: id
			}
		}).done(function(data) {
			if (data.error) {
				swal("Salio mal 🥺", "Hubo un error cambiando la cantidad de tu producto, intentalo de nuevo", "error")
				return
			}
			
			$("#cantidad" + id).text(data.cantidad);
			$("#precioProducto" + id).text("ARS $" + data.precio.toString());
			if (data.cantidad == 1) {
				$("#menos" + id).hide();
			}
			
			return
		});
	}

	function masCantidad(productoId) {
		var id = productoId.split("mas")[1];
		$.ajax("${createLink(controller:'carrito', action:'sumarCantidad')}", {
			dataType: "json",
			data: {
				productoVentaId: id
			}
		}).done(function(data) {
			if (data.error) {
				swal("Salio mal 🥺", "Hubo un error cambiando la cantidad de tu producto, intentalo de nuevo", "error")
				return
			}
			$("#cantidad" + id).text(data.cantidad);
			$("#precioProducto" + id).text("ARS $" + data.precio.toString());
			$("#menos" + id).show();
			return
		});
	}
</script>
</body>

</html>
