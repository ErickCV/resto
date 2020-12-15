<?php
include "header.php";
if($_SESSION['tipoEmpleado']=="1")
{
include "headerAdmin.php";
}
elseif($_SESSION['tipoEmpleado']=="2")
{
include "headerReceptionist.php";
}
elseif($_SESSION['tipoEmpleado']=="3")
{
include "headerWaiter.php";
}
?>
<div class="container">
  <div class="row mt-3">

  </div>
</div>


</body>
</html>
