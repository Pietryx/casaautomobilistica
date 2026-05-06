<?php
session_start();
ini_set('display_errors', 0); 
header("Content-Type: application/json");

if (isset($_SESSION["username"])) {
    echo json_encode([
        "logged" => true,
        "username" => $_SESSION["username"],
        "ruolo" => $_SESSION["ruolo"] 
    ]);
} else {
    echo json_encode([
        "logged" => false
    ]);
}
exit;