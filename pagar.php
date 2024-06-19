<?php
// SDK De Mercado Pago
require __DIR__ . '/vendor/autoload.php';

// Agrega credenciales
MercadoPago\SDK::setAccessToken('APP_USR-8878195255141821-061913-582a8d02eff29a3675a6eb61a30b6083-1863656975');

// Crea un objeto de preferencia
$preference = new MercadoPago\Preference();
$preference->back_urls = array(
    "success" => "http://localhost/Atianas-1/thankyou.php",
    "failure" => "http://localhost/Atianas-1/errorpago.php?error=failure",
    "pending" => "http://localhost/Atianas-1/errorpago.php?error=pending"
);
$preference->auto_return = "approved";

// Crea un ítem en la preferencia
$datos=array();
for($x = 0; $x < 10; $x++){
    $item = new MercadoPago\Item();
    $item->title = "Pantalon";
    $item->quantity = 2;
    $item->unit_price = 120;
    $datos[]=$item;   
}

$preference->items = $datos;
$preference->save();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="http://localhost/Atianas-1/insertarpago.php" method="POST">
        <script
            src="https://www.mercadopago.com.pe/integrations/v1/web-payment-checkout.js"
            data-preference-id="<?php echo $preference->id; ?>">
        </script>
    </form>   
</body>
</html>