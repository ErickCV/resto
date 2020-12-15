<?php
class RestoBD
{
  var $conexion;
  var $nRegistros;
  function Resto()
  {}

  function conecta()//
  {
    $this->conexion = mysqli_connect("localhost","erick","11dpr2474d","resto");
  }

  function cierra()
  {
    mysqli_close($this->conexion);
  }

  function getBlock($query)
  {
    $this->conecta();
    $tupla=mysqli_query($this->conexion,$query);
    if(strpos(strtoupper($query),"SELECT")!==false)
      $this->nRegistros=mysqli_num_rows($tupla);
    else
      $this->nRegistros=0;

      $this->error=mysqli_error($this->conexion);
      if($this->error >""){
        echo $query." -> ".$this->error;
        exit;
      }
      $this->cierra();
    return $tupla;
  }

  function getRegistro($query)
  {
    $this->conecta();
    $bloque=mysqli_query($this->conexion,$query);
    $this->nRegistros=mysqli_num_rows($bloque);
    $this->cierra();
    return mysqli_fetch_object($bloque);
  }

  function insertRegistro($query)
  {
    $this->conecta();
    $bloque=mysqli_query($this->conexion,$query);
    $this->cierra();
  }

  function generaTabla($query)
  {
    $registros=$this->getBlock($query);
    $columnas=mysqli_num_fields($registros);
    $result='<div class="container" style="background-color:white;"> <table class="table table-hover">';
    $result.= '<tr class="table-dark">';
    $result.= '<th scope="col"> &nbsp; </th>';

    for ($j=0; $j < $columnas; $j++)
    {
      $campo=mysqli_fetch_field_direct($registros,$j);
      $result.= '<td style="width:'.(100/$columnas).'% !important" >'.$campo->name.'</td>';
    }
    $result.= '</tr>';
    for ($i=0; $i < $this->nRegistros; $i++)
    {
      $result.= '<tr>';
      $result.= '<td>
              <div class="form-check" >
                <label class="form-check-label" style="vertical-align: top;">
                  <input class="form-check-input"  type="checkbox" value="" >
                </label>
              </div>
            </td>';
      $campos=mysqli_fetch_array($registros);
      for ($j=0; $j < $columnas; $j++)
        $result.= '<td >'.$campos[$j].'</td>';
      $result.= '</tr>';
    }
    $result.= '</table></div>';
    return $result;
  }

}
$BD = new RestoBD();
?>
