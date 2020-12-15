<?php
session_start();
include "class/BD.php";

$query = "SELECT * FROM empleado WHERE cve=sha1 ('".$_POST['cve']."')";
$registro =$BD->getRegistro($query);
if($BD->nRegistros==1)
    {
        $_SESSION['cveEmpleado']=$registro->cveEmpleado;
        $_SESSION['nombre']=$registro->nombreEmpleado.' '.$registro->apePaterno;
        $_SESSION['tipoEmpleado']=$registro->cveTipo;
        $_SESSION['foto']=$registro->cveEmpleado.".".$registro->foto;
        header("location: admin/home.php");
    }
else
{
   header("location: admin/login.php?m=1 ");
   $_SESSION['error']="clave errorea";
}
?>
