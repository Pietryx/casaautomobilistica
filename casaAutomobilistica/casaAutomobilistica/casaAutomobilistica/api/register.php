<?php
header("Content-Type: application/json");
$data = json_decode(file_get_contents("php://input"), true);

if (empty($data["username"]) || empty($data["email"]) || empty($data["password"])) {
    echo json_encode(["success"=>false, "msg"=>"Dati mancanti"]);
    exit;
}

$username = $data["username"];
$email = $data["email"];
$password = $data["password"];

function uuidv4() {
  $codiceOTP = random_bytes(16);
  $codiceOTP[6] = chr(ord($codiceOTP[6]) & 0x0f | 0x40); 
  $codiceOTP[8] = chr(ord($codiceOTP[8]) & 0x3f | 0x80); 
  return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($codiceOTP), 4));
}

$codOTP = uuidv4();

require_once __DIR__."/../classes/database.php";
require_once __DIR__."/invio_email.php";

$db = new database();

$sql = "INSERT INTO dipendente(Username, email, Password, OTP, Ruolo, isAbilitato) 
        VALUES('$username', '$email', '$password', '$codOTP', 'cliente', 0)";

if($db->query($sql)) {
    
    $emailInviata = inviaEmailOTP($email, $username, $codOTP);
    
    if($emailInviata) {
        echo json_encode(["success"=>true, "msg"=>"Registrazione ok! Controlla l'email."]);
    } else {
        echo json_encode(["success"=>false, "msg"=>"Registrato, ma errore invio email."]);
    }

} else {
    echo json_encode(["success"=>false, "msg"=>"Utente gia' esistente"]);
}
?>