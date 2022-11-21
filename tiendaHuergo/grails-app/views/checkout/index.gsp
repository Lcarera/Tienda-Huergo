<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Checkout</title>

		<link
			href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
			rel="stylesheet"
			/>
		<link
			href="https://fonts.googleapis.com/icon?family=Material+Icons"
			rel="stylesheet"
			/>

		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
			crossorigin="anonymous"
			/>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>

		<script
			src="https://code.iconify.design/iconify-icon/1.0.0/iconify-icon.min.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
			<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<link
				href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
				rel="stylesheet" />
			<script
				src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
			<style>
      :root {
        --main-bg-color: #0038a8;
      }

      /* Labels */

      label {
        width: 100%;
        font-size: 1rem;
      }

      body {
        padding-top: 80px;
      }

      .aclaraciones {
        font-size: 0.7rem;
        color: dimgray;
      }

      .label-resaltar {
        font-size: 1.5rem;
        font-weight: 700;
      }

      .secciones {
        font-weight: 500;
        font-size: 1.3rem;
        padding-top: 1.5rem;
        padding-bottom: 1rem;
      }

      .alinear-derecha {
        text-align: right;
      }

      /* Inputs  */

      .inputs {
        border-radius: 4px;
      }

      .comboBox {
        width: 100%;
        text-align: left;
      }

      /* Cards */

      .card-input-element + .card {
        height: calc(36px + 2 * 1rem);
        color: var(--main-bg-color);
        -webkit-box-shadow: none;
        box-shadow: none;
        border: 2px solid transparent;
        border-radius: 4px;
      }

      .card-input-element + .card:hover {
        cursor: pointer;
      }

      .card-input-element:checked + .card {
        border: 2px solid var(--main-bg-color);
        -webkit-transition: border 0.3s;
        -o-transition: border 0.3s;
        transition: border 0.3s;
      }

      @-webkit-keyframes fadeInCheckbox {
        from {
          opacity: 0;
          -webkit-transform: rotateZ(-20deg);
        }
        to {
          opacity: 1;
          -webkit-transform: rotateZ(0deg);
        }
      }

      @keyframes fadeInCheckbox {
        from {
          opacity: 0;
          transform: rotateZ(-20deg);
        }
        to {
          opacity: 1;
          transform: rotateZ(0deg);
        }
      }

      .divider {
        border-top: 4px solid #bbb;
        border-radius: 4px;
      }

      .card-total {
        border-radius: 8px;
        background-color: #ecf1f1;
        margin-top: 6.5rem;
        margin-left: 3rem;
      }

      .boton-card {
        width: 100%;
        color: --main-bg-color;
      }
    </style>
		</head>

		<body>
			<nav
				class="navbar navbar-expand-lg fixed-top navbar-dark d-flex flex-row"
				style="
				background-image: linear-gradient(#04519b, #033c73 60%, #02325f);
				background-repeat: no-repeat;
				">
				<a class="navbar-brand" href="https://huergo.com.ar/Login.aspx">Huergo -
					SIPA</a>
				<button
					class="navbar-toggler"
					type="button"
					data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent"
					aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<ul id="ulMenu" class="navbar-nav mx-auto">
					<li class="nav-item">
						<g:link controller="catalogo" action="index">
							<img
								src="https://huergo.com.ar/Img/logo.png"
								alt="apple icon"
								id="icon"
								width="50px"
								/></g:link>
					</li>
				</ul>
				<div style="padding-right: 5px">
					<g:link class="ml-auto" controller="carrito" action="index">
						<iconify-icon icon="bi:cart-fill" width="50px"></iconify-icon></g:link>
					<g:link class="ml-auto" controller="logout" action="index">
						<iconify-icon icon="ion:log-out-sharp" width="50px"></iconify-icon></g:link>
				</div>
			</nav>
			<div class="container">
				<div class="row">
					<div class="col">
						<h1 class="mt-3">Checkout</h1>
						<label class="secciones">Datos de contacto:</label>
						<div class="row">
							<div class="col">
								<div class="mb-3 inputs">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										placeholder="Celular"
										aria-label="Celular"
										aria-describedby="basic-addon1"
										id="celularContacto"
										/>
								</div>
							</div>
							<div class="col">
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										placeholder="Email"
										aria-label="Email"
										aria-describedby="basic-addon1"
										id="emailContacto"
										/>
								</div>
							</div>
						</div>
						<label class="secciones"> Entrega del producto: </label>
						<label class="mt-3">
							<input
								type="radio"
								id="retiro"
								name="demo"
								class="card-input-element d-none"
								/>
							<div
								class="card card-body bg-light d-flex flex-row justify-content-between
								align-items-center">
								Retiro en la institución
								<div class="aclaraciones">Secretaría - Lu a Vi de 8am a 12pm</div>
							</div>
						</label>

						<label class="mt-3">
							<input type="radio" id="entrega" name="demo" class="card-input-element
								d-none" />
							<div
								class="card card-body bg-light d-flex flex-row justify-content-between
								align-items-center">
								Entrega en la institución
							</div>
						</label>
						<label class="mt-3">
							<input type="radio" id="envio" name="demo" class="card-input-element
								d-none" />
							<div
								class="card card-body bg-light d-flex flex-row justify-content-between
								align-items-center">
								Envío a domicilio
							</div>
						</label>

						<label class="secciones"> Datos del comprador: </label>
						<div class="row">
							<div class="col">
								<div class="mb-3 inputs">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										placeholder="Nombre y Apellido"
										aria-label="Nombre y Apellido"
										aria-describedby="basic-addon1"
										id="nombre"
										/>
								</div>
								<div class="dropdown mb-3">
									<select id="cbRelacion" class="form-control" style="height: 100%;">
										<option value="alumno">Alumno</option>
										<option value="madre">Madre</option>
										<option value="padre">Padre</option>
										<option value="tutor">Tutor</option>
									</select>

								</div>
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="ciudad"
										placeholder="Localidad"
										aria-label="Localidad"
										aria-describedby="basic-addon1"
										/>
								</div>
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="direccion"
										placeholder="Calle/s"
										aria-label="Calle"
										aria-describedby="basic-addon1"
										/>
								</div>
							</div>

							<div class="col">
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="dni"
										placeholder="DNI"
										aria-label="DNI"
										aria-describedby="basic-addon1"
										/>
								</div>
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="celular"
										placeholder="Celular"
										aria-label="Celular"
										aria-describedby="basic-addon1"
										/>
								</div>
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="cp"
										placeholder="Código Postal"
										aria-label="Código Postal"
										aria-describedby="basic-addon1"
										/>
								</div>
								<div class="inputs mb-3">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="numero"
										placeholder="Número"
										aria-label="Numero"
										aria-describedby="basic-addon1"
										/>
								</div>
							</div>
						</div>

						<label class="secciones"> Datos del alumno: </label>
						<div class="row">
							<div class="col">
								<div class="mb-3 inputs">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										id="nombre"
										placeholder="Nombre y Apellido"
										aria-label="Nombre y Apellido"
										aria-describedby="basic-addon1"
										/>
								</div>
								<div class="dropdown mb-3">
									<select id="cbCiclo" class="form-control" style="height: 100%;">
										<option value="Superior">Superior</option>
										<option value="Básico">Básico</option>
									</select>
								</div>
							</div>
							<div class="col">
								<div class="mb-3 inputs">
									<div class="input-group-prepend"></div>
									<input
										type="text"
										class="form-control"
										placeholder="DNI"
										aria-label="dn"
										aria-describedby="basic-addon1"
										/>
								</div>
								<div class="dropdown mb-3">
									<select id="cbAno" class="form-control" style="height: 100%;">
										<option value="1ero">1ero</option>
										<option value="2do">2do</option>
										<option value="3ero">3ero</option>
										<option value="4to">4to</option>
										<option value="5to">5to</option>
										<option value="6to">6to</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card card-total">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<label class="label-resaltar">Total</label>
									</div>
									<div class="col">
										<label class="label-resaltar alinear-derecha">$${total}</label>
									</div>
									<hr class="divider" />
								</div>
								<div class="row">
									<div class="col">
										<label class="">Productos</label>
										<!-- <label class="">Descuento</label>
										<label class="">Envío</label> -->
									</div>
									<div class="col">
										<label class="alinear-derecha" >${cantidad}</label>
										<!-- <label class="alinear-derecha">$0.00</label>
										<label class="alinear-derecha">$0.00</label> -->
									</div>
								</div>
								<button
									type="button"
									onclick="hacerOrden();"
									class="btn btn-primary boton-card mt-3">
									Comprar
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	<script>
      	function revisarDatos() {
			var datoFaltante = null;
			if (!$("#nombre").val()) datoFaltante = "Nombre";

			if (!$("#celularContacto").val()) datoFaltante = "Celular de contacto";

			if (!$("#emailContacto").val()) datoFaltante = "Email de contacto";

			if (!$("#direccion").val()) datoFaltante = "Direccion";

			if (!$("#dni").val()) datoFaltante = "Direccion";

			if (!$("#cp").val()) datoFaltante = "Codigo Postal";

			if (!$("#ciudad").val()) datoFaltante = "Ciudad";

			if (datoFaltante) {
			Swal.fire({
				title: "Faltan datos",
				text: "No ingreso su " + datoFaltante,
				icon: 'error',
				confirmButtonText: "Ok.",
			});
			return false;
			}

			return true;
      	}

      function sleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
      }

      function hacerOrden() {
        if (revisarDatos()) {
          Swal.fire({
            title: "¿Estás seguro?",
            text: "Se realizara la compra",
            icon: "question",
            showCancelButton: true,
            confirmButtonText: "Si.",
            cancelButtonText: "No, cancelar.",
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax(
                "${createLink(controller:'checkout', action:'hacerCompra')}",
                {
                  dataType: "json",
                  data: {
                    nombreApellido:
                      $("#nombre").val() + " " + $("#apellido").val(),
                    direccion: $("#direccion").val(),
                    codigoPostal: $("#cp").val(),
                    ciudad: $("#ciudad").val(),
                    departamento: $("#departamento").val(),
                  },
                }
              ).done(function (data) {
                if (data.error) {
                  Swal.fire(
                    "Salio mal 🥺",
                    "Hubo un error haciendo tu orden, intentalo de nuevo",
                    "error"
                  );
                  return;
                } else {
                  Swal.fire({
                    title: "Compra realizada",
                    text: "",
                    icon: "success",
                    confirmButtonText: "Seguir comprando.",
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location.href = "../catalogo/index";
                    }
                  });
                }
              });
            }
          });
        }
      }
    </script>
		</body>
	</html>
