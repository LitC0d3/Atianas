<?php
include "./conexion.php";

// Verifica si se han enviado todos los campos necesarios
if (isset($_POST['nombre']) && isset($_POST['descripcion']) && isset($_POST['precio']) && isset($_POST['inventario']) && isset($_POST['categoria']) && isset($_POST['talla']) && isset($_POST['color']) && isset($_POST['id'])) {
    
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $carpeta = "../images/";
        $nombre = $_FILES['imagen']['name'];
        $temp = explode('.', $nombre);
        $extension = strtolower(end($temp)); // Convierte la extensión a minúsculas

        // Verifica si la extensión es válida
        if ($extension === 'jpg' || $extension === 'png') {
            $nombreFinal = time() . '.' . $extension;
            $fila = $conexion->query("SELECT imagen FROM productos WHERE id=" . $_POST['id']);
            $id = mysqli_fetch_row($fila);
            if (file_exists('../images/' . $id[0])) {
                unlink('../images/' . $id[0]);
            }
            $conexion->query("UPDATE productos SET imagen='" . $nombreFinal . "' WHERE id=" . $_POST['id']);
            move_uploaded_file($_FILES['imagen']['tmp_name'], $carpeta . $nombreFinal);
        }
    }

    $sql = "UPDATE productos SET
        nombre='" . $_POST['nombre'] . "',
        descripcion='" . $_POST['descripcion'] . "',
        precio=" . $_POST['precio'] . ",
        inventario=" . $_POST['inventario'] . ",
        id_categoria=" . $_POST['categoria'] . ",
        talla='" . $_POST['talla'] . "',
        color='" . $_POST['color'] . "'
        WHERE id=" . $_POST['id'];

    if (!$conexion->query($sql)) {
        echo "Error al actualizar: " . $conexion->error;
    } else {
        echo "Se actualizó correctamente";
    }
}
?>