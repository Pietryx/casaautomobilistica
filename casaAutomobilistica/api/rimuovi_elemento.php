<?php
session_start();
header("Content-Type: application/json");

if (!isset($_SESSION["username"])) {
    echo json_encode([
        "success" => false,
        "msg" => "effettua il login per rimuovere elementi"
    ]);
    exit;
}

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

// controllo dati
if (!isset($data["tipo"]) || !isset($data["codice"])) {
    echo json_encode([
        "success" => false,
        "msg" => "Dati mancanti"
    ]);
    exit;
}

$tipo = $data["tipo"];
$codice = $data["codice"];

require_once __DIR__ . "/../classes/gestione_admin.php";

$adminManager = new GestioneAdmin();

if ($adminManager->rimuovi($tipo, $codice)) {
    echo json_encode([
        "success" => true
    ]);
} else {
    echo json_encode([
        "success" => false,
        "msg" => "Errore"
    ]);
}
?>