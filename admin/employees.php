<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/lux.css">
    <link rel="stylesheet" href="../css/custom.css">
</head>
<body class="backgroundLightGray">
  <div class=" mainContainer">
  <?php
    include "header.php";
    include "headerAdmin.php";
    include "../class/BD.php";
  ?>
  <div class=" row" style=" margin-top:3%; margin-left:5%;">
      <h2>Inventario</h2>
  </div>
    </br>
      <?php
      echo $BD->generaTabla("SELECT nombreEmpleado, apePaterno,telefonoEmpleado,edadEmpleado,cveTipo,foto from empleado");

      echo '</br>
      <div class=" row">
          <div class=" col-1"></div>
          <h4>Editar registro</h4>
      </div>
      </br>
      <form  method="post">
        <div class=" row">
          <div class=" col-1"></div>
          <div class=" col-2">
              <div class="form-group">
                  <label class="col-form-label black" for="inputDefault">Nombre</label>
                  <input type="text" class="form-control" placeholder="" id="inputDefault">
              </div>
          </div>
          <div class=" col-2">
              <div class="form-group">
                  <label class="col-form-label black" for="inputDefault">Apellido</label>
                  <input type="text" class="form-control" placeholder="" id="inputDefault">
                </div>
          </div>
          <div class=" col-1">
              <div class="form-group">
                  <label class="col-form-label black" for="inputDefault">Telefono</label>
                  <input type="text" class="form-control" placeholder="" id="inputDefault">
                </div>
          </div>
          <div class=" col-1">
              <div class="form-group">
                  <label class="col-form-label black" for="inputDefault">Edad</label>
                  <input type="text" class="form-control" placeholder="" id="inputDefault">
              </div>
          </div>
          <div class=" col-2">
              <div class="form-group">
                  <label class="col-form-label black" for="">Tipo</label>
                  <select class="custom-select">
                    <option value="0">Cero</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
                </div>
          </div>
          <div class=" col-2">
            <div class="form-group" style="margin-top:5%;">
              <label for="exampleInputFile" class="black">File input</label>
              <input type="file" class="form-control-file black" id="exampleInputFile" aria-describedby="fileHelp">
            </div>
          </div>
          <div class=" col-1"></div>
        </div>
      </form>
      </br>
      <div class="row">
          <div class=" col-4"></div>
          <div class="col-2">
              <button type="button" class="btn btn-primary">Actualizar</button>
          </div>
          <button type="button" class="btn btn-success">Insertar</button>
          <div class=" col-1"></div>
          <div class="col-2">
              <button type="button" class="btn btn-danger">Eliminar</button>
          </div>
          <div class=" col-3"></div>
      </div>
      <div class=" divAux"></div>
    </div>
  </body>
  </html>';
?>
