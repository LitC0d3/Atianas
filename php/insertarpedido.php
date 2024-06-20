<?php
session_start();
include './conexion.php';
if(!isset($_SESSION['carrito'])){header("Location: ../index.php");}
$arreglo = $_SESSION['carrito'];
$total = 0;
for($i=0; $i<count($arreglo);$i++){
  $total = $total + ($arreglo[$i]['Precio'] * $arreglo[$i]['Cantidad']);
}
$password="";
if(isset($_POST['c_account_password'])){
  if($_POST['c_account_password']!=""){
      $password = $_POST['c_account_password']; 
  }
}
$conexion -> query("insert into usuario(nombre,telefono,email,password,img_perfil,nivel) 
  values(
    '".$_POST['c_fname']." ".$_POST['c_lname']."',
    '".$_POST['c_phone']."',
    '".$_POST['c_email_address']."',
    '".sha1($password)."',
    'default.jpg',
    'cliente'
    )
") or die($conexion->error);
$id_usuario = $conexion->insert_id;
       
$fecha = date('Y-m-d-h:m:s');
$conexion -> query("insert into ventas(id_usuario,total,fecha,status) values($id_usuario,$total,'$fecha','preparacion')") or die($conexion->error);
$id_venta = $conexion ->insert_id;

for($i=0; $i<count($arreglo);$i++){
  $conexion -> query("insert into productos_venta (id_venta,id_producto,cantidad,precio,subtotal)
  values(
  $id_venta,
  ".$arreglo[$i]['Id'].",
  ".$arreglo[$i]['Cantidad'].",
  ".$arreglo[$i]['Precio'].",
  ".$arreglo[$i]['Cantidad']*$arreglo[$i]['Precio']."
  ) ") or die($conexion->error);
   $conexion->query("update productos set inventario =inventario -".$arreglo[$i]['Cantidad']." where id=".$arreglo[$i]['Id'] )or die($conexion->error);
}
$conexion->query(" insert into envios(Contacto,Provincia,Distrito,direccion,cp,id_venta)  
  values
    (
      '".$_POST['country']."',
      '".$_POST['c_companyname']."',
      '".$_POST['c_address']."',
      '".$_POST['c_state_country']."',
      '".$_POST['c_postal_zip']."',
      $id_venta
    )
")or die($conexion->error);

unset($_SESSION['carrito']);
header("Location: ../pagar.php?id_venta=".$id_venta);
?>