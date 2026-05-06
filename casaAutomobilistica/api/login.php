<?php
session_start();
header("Content-Type: application/json");
$data = json_decode(file_get_contents("php://input"), true);                                       

if (empty($data["username"]) || empty($data["password"])) {
    echo json_encode(["success"=>false, "msg"=>"Mancano dati"]);
    exit;
}

$username = $data["username"];
$password = $data["password"];

require_once __DIR__ . "/../classes/credentials.php";
require_once __DIR__ . "/../classes/database.php";
require_once __DIR__ . "/invio_email.php"; 


function uuidv4() {
  $codiceOTP = random_bytes(16);
  $codiceOTP[6] = chr(ord($codiceOTP[6]) & 0x0f | 0x40); 
  $codiceOTP[8] = chr(ord($codiceOTP[8]) & 0x3f | 0x80); 
  return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($codiceOTP), 4));
}

$cred = new credentials();
$userData = $cred->doLogin($username, $password);

if($userData){
    
    $nuovo_otp = uuidv4(); 
    
    $email = $userData["email"];
    $id_utente = $userData["ID_utente"];

    $db = new database();
    $db->query("UPDATE dipendente SET OTP = '$nuovo_otp' WHERE ID_utente = $id_utente");

    // sessione provvisoria
    $_SESSION["temp_user_id"] = $id_utente;
    $_SESSION["temp_username"] = $userData["Username"];
    $_SESSION["temp_ruolo"] = $userData["Ruolo"];

    $emailInviata = inviaEmailOTP($email, $username, $nuovo_otp);

    if($emailInviata) {
        echo json_encode(["success"=>true, "richiede_otp"=>true]);
    } else {
        echo json_encode(["success"=>false, "msg"=>"Errore invio email OTP."]);
    }

} else {
    echo json_encode(["success"=>false, "msg"=>"Username o password errati"]);
}
?>