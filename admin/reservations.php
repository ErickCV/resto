<?php
include "header.php";
include "headerReceptionist.php";
include "../class/BD.php";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body class="backgroundLightGray">
    <div class="" style="margin-top:2%;margin-left:3%;">
        <h2>Reservaciones</h2>
    </div>

      <div class="col-10" style="margin-left:3%;">
        <?php
          $query="SELECT * FROM reservacion";
          desplegarTabla($query);
        ?>
      </div>

      <div class="form-group inlineInput" style="margin-left:4%;">
          <label class="col-form-label black" for="inputDefault">NombreCliente</label>
          <input type="text" class="form-control" placeholder="" id="inputDefault">
      </div>
      <div class="form-group inlineInput">
          <label class="col-form-label black" for="inputDefault">Telefono</label>
          <input type="text" class="form-control" placeholder="" id="inputDefault">
      </div>
      <div class="form-group inlineInput">
          <label for="fecha" class="black">FechaReservacion</label>
          <input class="" type="date" id="fecha">
      </div>
      <div class="form-group inlineInput">
          <label for="fecha" class="black">Fecha</label>
          <input class="" type="date" id="fecha">
      </div>
      <div class="form-group inlineInputSmall" >
          <label class="col-form-label black" for="inputDefault">Acompa</label>
          <input type="text" class="form-control" placeholder="" id="inputDefault">
      </div>
      <div class="form-group inlineInputSmall" >
          <label class="col-form-label black" for="inputDefault">Mesa</label>
          <input type="text" class="form-control" placeholder="" id="inputDefault">
      </div>
      <div class="form-group inlineInputSmall" >
          <label class="col-form-label black" for="inputDefault">Empleado</label>
          <input type="text" class="form-control" placeholder="" id="inputDefault">
      </div>

      <button type="button" style="margin-left: 35%;margin-bottom:5%;margin-top:2%;" class="btn btn-outline-info">Actualizar</button>
      <button type="button" style="margin-left: 15%;margin-bottom:5%;margin-top:2%;" class="btn btn-outline-danger">Eliminar</button>
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
