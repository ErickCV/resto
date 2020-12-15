<?php  ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/custom.css">
    <link rel="stylesheet" href="../css/lux.css">
    <title></title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">Resto</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarColor02">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="employees.php">Empleados</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Ventas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="perfil.php">Perfil</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../home.php">Cerrar Sesion</a>
          </li>
        </ul>
          <span class="" style="margin-right:5%;">
            <img class="fotoPerfil" style="border-radius: 25%; margin-left:15%" src="../src/profilePhoto/<?php echo $_SESSION['foto'];?>" alt="" ><p class="white"> <?php echo $_SESSION['nombre'];?></p>
          </span>
      </div>

    </nav>
  </body>
</html>
