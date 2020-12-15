<?php
session_start();
session_destroy();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/lux.css">
</head>
<body>
  <div class="mainContainer">
   <div id="siteHeaderMain" class="">
      <header class="header ">
        <nav class="navbar navbar-expand-lg navbar-light bg-light " >
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="col-1">
              <button class="btn btn-secondary white btnMenu" type="button" onclick="location.href='admin/login.php'">
                <img src="https://drive.google.com/uc?id=1ngPmjVFqfybH2zWKsJGouqunmKcmZT7z">
              </button>
            </div>
            <div class="col-2">
              <div class="">
                <img class="imageLogo" alt=""
                src="https://drive.google.com/uc?id=1enFkZmWHUiIFRD90bdPPzqDwkRo233gS" >
                <a href="#"></a>
              </div>
            </div>
            <div class="col-1"></div>
            <div class=" col-4 ">
              <ul class="navbar-nav ">
                <li class="nav-item ">
                  <a class="nav-link white" href="#menu">Menu </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link white" href="#reservacion">Reservacion</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link white" href="#acercade">Acerca de</a>
                </li>
              </ul>
            </div>
            <div class=" col-1"></div>
            <div class=" col-3">
              <ul class="navbar-nav ">
                <li class="nav-item ">
                  <input type="text" class="form-control search white" placeholder="Buscar" id="inputDefault">
                </li>
                <li class="nav-item ">
                  <button class="btn btn-secondary white btnSearch" type="submit">
                    <img src="https://drive.google.com/uc?id=1NQj4Qg4F0k3W-19qf-Q6uwUMnqRX5F4V">
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
    </div>

    <div class=" divBackground1 " id="presentacion">
        <div class=" divAux "></div>
        <div class="divLeft"><h1 class="display-3 white">Que vas a comer hoy?</h1></div>
    </div>

    <div class=" divBackground2" id="menu">
      <div class=" divAux "></div>
      <div class="divLeft ">
        <div class="card bg-light mb-3" style="max-width: 20rem;"><!--tarjeta filtro-->
          <div class="card-header black">Filtros</div>
          <div class="card-body">
            <h4 class="card-title black">Proteinas</h4>
            <div class="form-group">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck1" checked="">
                <label class="custom-control-label black" for="customCheck1">Pollo</label>
              </div>
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck2" checked="">
                <label class="custom-control-label black" for="customCheck2">Filete</label>
              </div>
            </div>
            <h4 class="card-title black">Ensaladas</h4>
            <div class="form-group">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck3" checked="">
                <label class="custom-control-label black" for="customCheck3">Cesar</label>
              </div>
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck4" checked="">
                <label class="custom-control-label black" for="customCheck4">Vegano</label>
              </div>
            </div>
            <h4 class="card-title black">Sopa</h4>
            <div class="form-group">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck5" checked="">
                <label class="custom-control-label black" for="customCheck5">Champi&ntilde;ones</label>
              </div>
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck6" checked="">
                <label class="custom-control-label black" for="customCheck6">Zanahoria</label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class=" divBackground3" id="reservacion">
    </div>

    <div class=" divBackground4" id="acercade">
    </div>

  </div>
</body>
</html>
