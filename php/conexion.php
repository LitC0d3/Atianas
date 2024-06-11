<?php
    $servidor="localhost";
    $nombreBd="carrito";
    $usuario="root";
    $pass="";
    
    $conexion=mysqli_connect($servidor,$usuario,$pass,$nombreBd);
    if (!$conexion){
        die("Error de conexión: ".mysqli_connect_error());
        }
?>