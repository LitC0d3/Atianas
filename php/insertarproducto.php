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
                $params = ['success' => true];
                header("Location: ../admin/productos.php?" . http_build_query($params));
                exit;
            } else {
                $params = ['error' => 'No se Pudo Subir la Imagen'];
                header("Location: ../admin/productos.php?" . http_build_query($params));
                exit;
            }
        } else {
            $params = ['error' => 'Porfavor Subir un Archivo Valido (jpg o png)'];
            header("Location: ../admin/productos.php?" . http_build_query($params));
            exit;
        }
    } else {
        $params = ['error' => 'No se Selecciono Ninguna Imagen'];
        header("Location: ../admin/productos.php?" . http_build_query($params));
        exit;
    }
} else {
    $params = ['error' => 'Porfavor Rellena Todos Los Campos'];
    header("Location: ../admin/productos.php?" . http_build_query($params));
    exit;
}
?>