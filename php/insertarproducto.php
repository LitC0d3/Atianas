<?php
include "./conexion.php";

// Verifica si se han enviado todos los campos necesarios
if (isset($_POST['nombre']) && isset($_POST['descripcion']) && isset($_POST['precio']) && isset($_POST['inventario']) && isset($_POST['categoria']) && isset($_POST['talla']) && isset($_POST['color'])) {
    $carpeta = "../images/";

    // Verifica si se ha cargado un archivo
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $nombre = $_FILES['imagen']['name'];
        $temp = explode('.', $nombre);
        $extension = end($temp);
        $extension = strtolower($extension); // Convierte la extensión a minúsculas

        // Verifica si la extensión es válida
        if ($extension === 'jpg' || $extension === 'png') {
            $nombreFinal = time() . '.' . $extension;

            // Verifica si se puede mover el archivo a la carpeta de destino
            if (move_uploaded_file($_FILES['imagen']['tmp_name'], $carpeta . $nombreFinal)) {
                // Inserta los datos en la base de datos
                $conexion->query("INSERT INTO productos (nombre, descripcion, imagen, precio, talla, color, id_categoria, inventario) VALUES (
                    '" . $_POST['nombre'] . "',
                    '" . $_POST['descripcion'] . "',
                    '$nombreFinal',
                    " . $_POST['precio'] . ",
                    '" . $_POST['talla'] . "',
                    '" . $_POST['color'] . "',
                    " . $_POST['categoria'] . ",
                    '" . $_POST['inventario'] . "'
                )") or die($conexion->error);
                header("Location: ../admin/productos.php?success");
            } else {
                header("Location: ../admin/productos.php?error=No se Pudo Subir la Imagen");
            }
        } else {
            header("Location: ../admin/productos.php?error=Porfavor Subir un Archivo Valido (jpg o png)");
        }
    } else {
        header("Location: ../admin/productos.php?error=No se Selecciono Ninguna Imagen");
    }
} else {
    header("Location: ../admin/productos.php?error=Porfavor Rellena Todos Los Campos");
}
?>