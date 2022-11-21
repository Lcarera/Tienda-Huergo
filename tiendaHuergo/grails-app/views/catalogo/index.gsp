<!DOCTYPE html>
<html>
  <head>
    <!--  <link
			href="https://fonts.googleapis.com/css?family=Arial&display=swap"
			rel="stylesheet"
		/> -->
    <meta name="layout" content="main" />

    <style>
      * {
        box-sizing: border-box;
      }
      body {
        font-size: 14px;
        padding-top: 80px;
      }
      .cardStock {
        width: 302px;
        height: 362px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: relative;
        top: 0px;
        left: 0px;
        border-top-left-radius: 17px;
        border-top-right-radius: 17px;
        border-bottom-left-radius: 17px;
        border-bottom-right-radius: 17px;
        box-shadow: 5.989869117736816px -2.994934558868408px 5px rgba(0, 0.21960794925689697, 0.658823549747467, 0.20999999344348907);
        overflow: hidden;
      }
      .btnAddCarrito {
        width: 302px;
        height: 68px;
        background: rgba(0, 44, 133, 1);
        opacity: 1;
        position: absolute;
        top: 294px;
        left: 0px;
        overflow: hidden;
        text-align: center;
        line-height: 65px;
        cursor: pointer;
      }
      .txtBtn {
        color: rgba(255, 255, 255, 1);
        font-family: Arial;
        font-weight: Regular;
        font-size: 26px;
        opacity: 1;
      }

      .btnAddCarrito:hover {
        filter: brightness(150%);
      }
      .txtPrecio {
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 262px;
        left: 128px;
        font-family: Arial;
        font-weight: Regular;
        font-size: 20px;
        opacity: 1;
        text-align: left;
      }
      .txtNombre {
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 229px;
        left: 64px;
        font-family: Arial;
        font-weight: Regular;
        font-size: 20px;
        opacity: 1;
        text-align: left;
      }
      .logoHuergo {
        width: 209px;
        height: 209px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 11px;
        left: 46px;
        overflow: hidden;
      }
    </style>
  </head>
  <body>
    <div class="row">
      <g:each var="producto" in="${productos}">
        <div class="col-lg-4">
          <br />
          <div class="cardStock">
            <img
              src="https://huergo.com.ar/Img/logo.png"
              class="logoHuergo"
              alt="..."
            />
            <span class="txtNombre">${producto.nombre}</span>
            <span class="txtPrecio">$${producto.precioToString()}</span>
            <btn
              class="btnAddCarrito"
              onclick="addToCarrito('${producto.id}');"
            >
              <span class="txtBtn">Agregar al carrito</span>
            </btn>
          </div>
        </div>
      </g:each>
    </div>

    <script type="text/javascript">
      function addToCarrito(id) {
        $.ajax(
          "${createLink(controller:'catalogo', action:'ajaxAgregarCarrito')}",
          {
            dataType: "json",
            data: { productoId: id },
          }
        ).done(function (data) {
          if (data.error) {
            Swal.fire(
              "Salio mal 🥺",
              "Hubo un error agregando el producto al carrito, intentalo de nuevo",
              "error"
            );
            return;
          }
          Swal.fire(
            "Salio joya 🥳",
            "Se agrego el producto a tu carrito",
            "success"
          );
          return;
        });
      }
    </script>
  </body>
</html>
