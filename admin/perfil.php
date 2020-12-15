<?php
include "header.php";

include "../class/BD.php";
if(isset($_POST['Nombre']))
{
  $BD->getBlock("UPDATE empleado SET nombreEmpleado='".$_POST['Nombre']."',apePaterno='".$_POST['Apellido']."',telefonoEmpleado='".$_POST['Telefono']."',edadEmpleado='".$_POST['Edad']."', cve=sha1('".$_POST['Clave']."')
  WHERE cveEmpleado=".$_SESSION['cveEmpleado']);
  $_SESSION['nombre']=$_POST['Nombre'].' '.$_POST['Apellido'];
  if($_FILES['Foto']['name']>"")
  {
    $arreglo=explode(".",$_FILES['Foto']['name']);#buscando extension, en fotoname esta el nombre completo
    move_uploaded_file($_FILES['Foto']['tmp_name'],"../src/profilePhoto/".$_SESSION['cveEmpleado'].".".$arreglo[count($arreglo)-1]);
    $BD->getBlock("UPDATE empleado SET Foto='".$arreglo[count($arreglo)-1]."' WHERE cveEmpleado=".$_SESSION['cveEmpleado']);
    $_SESSION['foto']=$_SESSION['cveEmpleado'].".".$arreglo[count($arreglo)-1]."?".rand()%100;
  }
   else
    {
      header("location: perfil.php?m=2");
      $_SESSION['error']="formato de imagen incorrecto";
    }
}
if($_SESSION['tipoEmpleado']=="1")
  include "headerAdmin.php";
elseif($_SESSION['tipoEmpleado']=="2")
  include "headerReceptionist.php";
elseif($_SESSION['tipoEmpleado']=="3")
  include "headerWaiter.php";

$empleado=$BD->getRegistro( "SELECT * FROM empleado WHERE cveEmpleado=".$_SESSION['cveEmpleado']);

?>
    <div class="container">
      <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
          <div class="card text-white bg-dark mb-3" style="margin-top: 5%;border-radius: 1%;">
            <div class="form-group">
              <div class="">
                <img class="imageLogoLogin" alt=""
                src="https://drive.google.com/uc?id=1enFkZmWHUiIFRD90bdPPzqDwkRo233gS" >
                <a href="#"></a>
              </div>
            </div>
            <div class="card-body">
              <form class="" action="perfil.php" method="post" enctype="multipart/form-data" role="form">
                <fieldset>
                  <div class="form-group">
                    <label class="col-form-label" for="">Nombre</label>
                    <input name="Nombre" type="text" class="form-control" placeholder="" id="" value=<?php echo $empleado->nombreEmpleado; ?> >
                  </div>
                  <div class="form-group">
                    <label class="col-form-label" for="">Apellido</label>
                    <input name="Apellido" type="text" class="form-control" placeholder="" id="" value=<?php echo $empleado->apePaterno; ?> >
                  </div>
                  <div class="form-group">
                    <label class="col-form-label" for="">Telefono</label>
                    <input name="Telefono" type="text" class="form-control" placeholder="" id="" value=<?php echo $empleado->telefonoEmpleado; ?> >
                  </div>
                  <div class="form-group">
                    <label class="col-form-label" for="">Edad</label>
                    <input name="Edad" type="text" class="form-control" placeholder="" id="" value=<?php echo $empleado->edadEmpleado; ?> >
                  </div>
                  <div class="form-group">
                    <label for="">Clave</label>
                    <input name="Clave" type="password" class="form-control" id="" placeholder="********" value=<?php echo $empleado->cve; ?>>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Foto</label>
                    <input name="Foto" type="file" class="form-control-file" id="" aria-describedby="fileHelp">
                  </div>
                  <button type="submit" class="btn btn-secondary" style="margin-left: 37%;">Actualizar</button>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
        <div class="col-3"></div>
      </div>
    </div>
  </body>
</html>
