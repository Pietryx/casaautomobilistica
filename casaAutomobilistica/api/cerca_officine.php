<?php
header("Content-Type: application/json");


$data = json_decode(file_get_contents("php://input"), true);

// stringa vuota di default
$servizio = $data["servizio"] ?? "";
$pezzo = $data["pezzo"] ?? "";
$accessorio = $data["accessorio"] ?? "";

require_once __DIR__ . "/../classes/officina.php";

$officinaManager = new Officina();

$listaOfficine = $officinaManager->cercaCompatibili($servizio, $pezzo, $accessorio);

echo json_encode([
    "success" => true,
    "data" => $listaOfficine
]);

?>