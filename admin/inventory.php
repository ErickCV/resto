<?php
  include "header.php";
  include "headerReceptionist.php";
  include "../class/BD.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/lux.css">
    <link rel="stylesheet" href="../css/custom.css">
</head>
<body class="backgroundLightGray ">

    <div class=" row" style="margin-top:2%;">
        <div class=" col-1"></div>
        <h2>Inventario</h2>

    </div>
    </br>
    <div class="row">
        <div class=" col-1"></div>
        <div class=" col-10">
          <?php
            $query="SELECT * FROM inventario";
            desplegarTabla($query);
          ?>
        </div>
        <div class=" col-1"></div>
    </div>
    </br>
    <div class=" row">
        <div class=" col-1"></div>
        <h4>Editar registro</h4>
    </div>
    </br>
    <div class=" row">
        <div class=" col-1"></div>
        <div class=" col-2">
            <div class="form-group">
                <fieldset disabled="">
                <label class="control-label black" for="disabledInput">Ingrediente</label>
                <input class="form-control" id="disabledInput" type="text" placeholder="" disabled="">
                </fieldset>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch1">
                    <label class="custom-control-label" for="customSwitch1"></label>
                </div>
            </div>
        </div>
        <div class=" col-2">
            <label for="exampleSelect1" class="black">Empleado</label>
                <select class="form-control" id="exampleSelect1">
                    <option>Empleado 1</option>
                    <option>Empleado 2</option>
                    <option>Empleado 3</option>
                    <option>Empleado 4</option>
                    <option>Empleado 5</option>
                </select>
        </div>
        <div class=" col-2" style="margin-top:-1.25%;">
            <div class="form-group" >
                <label class="col-form-label black" for="inputDefault">Existente</label>
                <input type="text" class="form-control" placeholder="" id="inputDefault">
            </div>
        </div>
        <div class=" col-2">
            <div class="form-group">
                <label for="fecha" class="black">Fecha</label>
                <input class="" type="date" id="fecha">
            </div>
        </div>
        <div class=" col-3"></div>
    </div>
    </br>
    <div class="row">
        <div class=" col-4"></div>
        <div class="col-2">
            <button type="button" class="btn btn-outline-info">Aceptar</button>
        </div>
        <div class=" col-1"></div>
        <div class="col-2">
            <button type="button" class="btn btn-outline-danger">Eliminar</button>
        </div>
        <div class=" col-3"></div>
    </div>

</body>
</html>
<?php
  function desplegarTabla($query)
  {
    global $BD;
    $registros=$BD->getBlock($query);
    $columas=mysqli_num_fields($registros);
    echo '<table class="table table-hover">';
    //cabecera
    echo '<tr class="table-dark">';
    echo '<th scope="col"> &nbsp; </th>';
    for ($j=0; $j < $columas; $j++)
    {
      $campo=mysqli_fetch_field_direct($registros,$j);//informacion de un campo(bloque,columna)
      echo '<th scope="col" >'.$campo->name.'</th>';
    }
    echo '</tr>';
    //fin cabecera
    for ($i=0; $i < $BD->nRegistros; $i++)
    {
      echo '<tr class="table-light">';
        echo '<td>
                <div class="form-check" >
                  <label class="form-check-label" style="vertical-align: top;">
                    <input class="form-check-input"  type="checkbox" value="" >
                  </label>
                </div>
              </td>';
      $campos=mysqli_fetch_array($registros);
      for ($j=0; $j < $columas; $j++)
          echo '<td>'.$campos[$j].'</td>';
      echo '</tr>';
    }
    echo '</table>';
  }
?>
