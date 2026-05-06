<?php
session_start();
header("Content-Type: application/json");

if (!isset($_SESSION["username"]) || $_SESSION["ruolo"] !== "admin") {
    echo json_encode([
        "success" => false,
        "msg" => "Accesso negato: devi essere Admin."
    ]);
    exit;
}

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

// controllo dati
if (!isset($data["tipo"]) || !isset($data["codice"]) || !isset($data["descrizione"]) || !isset($data["costo"])) {
    echo json_encode([
        "success" => false,
        "msg" => "Dati mancanti"
    ]);
    exit;
}

$tipo = $data["tipo"];
$codice = $data["codice"];
$descrizione = $data["descrizione"];
$costo = $data["costo"];

require_once __DIR__ . "/../classes/gestione_admin.php";

$adminManager = new GestioneAdmin();

if ($adminManager->aggiungi($tipo, $codice, $descrizione, $costo)) {
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