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
    </br>
    <span class="titulo">Carrito</span>
    ${carrito}
  </div>
 </div>
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
              <h4 class="subTitulo">Remera azul y gris</h4>
              </br>
              </br>
            </div>
              <div class="form-row">
                <div class="col-sm-1">
                  <p >Talle</p>
                </div>
                <div class="col-sm-11">
                  <input type="radio" class="btn-check" name="talles" id="S" autocomplete="off">
                  <label class="btn btn-secondary" for="S">S</label>
                  <input type="radio" class="btn-check" name="talles" id="M" autocomplete="off">
                  <label class="btn btn-secondary" for="M">M</label>
                  <input type="radio" class="btn-check" name="talles" id="L" autocomplete="off">
                  <label class="btn btn-secondary" for="L">L</label>
                  <input type="radio" class="btn-check" name="talles" id="XL" autocomplete="off">
                  <label class="btn btn-secondary" for="XL">XL</label>
                </br>
              </br>
                </div>
              </div>
              <div class="form-row">
                <div class="col-sm-2">
                  <p >Cantidad</p>
                </div>
                <div class="col-sm-10">
                  <div class="form-row">
                    <button class="btn btn-light">-</button>
                    <p style="padding-left: 20px;padding-right: 20px; padding-top: 5px;">2</p>
                    <button class="btn btn-light">+</button>
                  </div>
                </div>
              </div>
          </div>
          <div class="col-sm-2">
            <h4 class="precio">ARS $300</h4>
          </div>
        </div>
      </div>
    </div>
  </div>
 </div>
</body>
</html>
