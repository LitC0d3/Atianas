<?php
include './php/conexion.php';
if(!isset($_GET['id_venta'])){
    header('Location: ./');
}

$datos = $conexion->query("select 
    ventas.*, 
    usuario.nombre, usuario.telefono, usuario.email 
    from ventas 
    inner join usuario on ventas.id_usuario = usuario.id 
    where ventas.id=".$_GET['id_venta'])or die($conexion->error);
$datosUsuario = mysqli_fetch_row($datos);

$datos2 = $conexion->query("select * from envios where id_venta=".$_GET['id_venta'])or die($conexion->error);
$datosEnvio = mysqli_fetch_row($datos2);

$datos3 = $conexion->query("select productos_venta.*, 
    productos.nombre as nombre_producto, productos.imagen 
    from productos_venta inner join productos on productos_venta.id_producto = productos.id 
    where id_venta=".$_GET['id_venta'])or die($conexion->error);

// SDK De Mercado Pago
require __DIR__ . '/vendor/autoload.php';

// Agrega credenciales
MercadoPago\SDK::setAccessToken('APP_USR-8878195255141821-061913-582a8d02eff29a3675a6eb61a30b6083-1863656975');

// Crea un objeto de preferencia
$preference = new MercadoPago\Preference();
$preference->back_urls = array(
    "success" => "http://localhost/Atianas-1/thankyou.php?id_venta=".$_GET['id_venta']."&metodo=mercadopago",
    "failure" => "http://localhost/Atianas-1/errorpago.php?error=failure", /* Falta Pagina De Error De Pago */
    "pending" => "http://localhost/Atianas-1/errorpago.php?error=pending" /* Falta Pagina De Pago Pendiente */
);
$preference->auto_return = "approved";

// Crea un ítem en la preferencia
$datos=array();
while($f = mysqli_fetch_array($datos3)){
    $item = new MercadoPago\Item();
    $item->title = $f['nombre_producto'];
    $item->quantity = $f['cantidad'];
    $item->unit_price = $f['precio'];
    $datos[]=$item;   
}

$preference->items = $datos;
$preference->save();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Elige Metodo De Pago</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <script 
    src="https://www.paypal.com/sdk/js?client-id=AcyJ5Lx9YbRF0s5Qv0MvtIu-6Ei5T1u-9_u5h9xHoYRIFlgifxaUSKSQXsVH63Uymyb11Si96VxKXQwZ&currency=USD">
    </script>

    <div class="site-wrap">
    <?php include('./layouts/header.php'); ?>
    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Elige Metodo de Pago</h2>
                </div>
                <div class="col-md-7">
                    <form action="#" method="post">

                        <div class="p-3 p-lg-5 border">

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Venta #<?php echo $_GET['id_venta']; ?></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Nombre <?php echo $datosUsuario[4]; ?></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Email <?php echo $datosUsuario[6]; ?></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Telefono <?php echo $datosUsuario[5]; ?></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Company <?php echo $datosEnvio[2]; ?></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Direccion <?php echo $datosEnvio[3]; ?></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_fname" class="text-black">Direccion <?php echo $datosEnvio[4]; ?></label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-5 ml-auto">
                <h4 class="h1">Total: <?php echo $datosUsuario[2]; ?></h4>

                <form action="http://localhost/Atianas-1/thankyou.php?id_venta=.$_GET['id_venta']."&metodo=mercadopago" method="POST">
                <script src="https://www.mercadopago.com.pe/integrations/v1/web-payment-checkout.js" 
                        data-preference-id="<?php echo $preference->id; ?>"
                        data-button-label="Paga Con Mercado Pago">
                </script>
                <img src="./images/mercadopago_logo_icon_248494.png" alt="Mercado Pago Logo" class="mercado-pago-logo">
            </form>  
                <div id="paypal-button-container"></div>
            </div>
            <?php include('./layouts/footer.php'); ?>
    </div>
</div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>

<script>
    paypal.Buttons({
      createOrder: function(data, actions) {
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: '<?php echo $datosUsuario[2]; ?>'
            }
          }]
        });
      },
      onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {
          if(details.status == 'COMPLETED'){
           location.href = "./thankyou.php?id_venta=<?php echo $_GET['id_venta'];?>&metodo=paypal";
          }
        });
      }
    }).render('#paypal-button-container');
  </script>

</body>
</html>