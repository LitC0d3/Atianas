<?php
include "./conexion.php";

header('Content-Type: application/json');

if ($conexion->connect_error) {
    die(json_encode(array("error" => "Conexión fallida: " . $conexion->connect_error)));
}

$sql = "SELECT id, nombre, precio FROM productos";
$result = $conexion->query($sql);

if (!$result) {
    die(json_encode(array("error" => "Error en la consulta: " . $conexion->error)));
}

$productos = array();

while ($row = $result->fetch_assoc()) {
    $productos[] = array(
        "id" => $row["id"],
        "nombre" => $row["nombre"],
        "precio" => floatval($row["precio"])
    );
}

$conexion->close();

echo json_encode($productos);
