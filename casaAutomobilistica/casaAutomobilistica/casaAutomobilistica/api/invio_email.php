<?php
function inviaEmailOTP($email, $nomeUtente, $codiceOTP) {

    $url = "https://agora.ismonnet.it/sendMail/send.php"; // cambia con il path reale
    $data = [
        "mail_invio" => "esercizio-5Binf@ismonnet.eu",
        "mail_destinazione" => "$email",
        "oggetto" => "Invio mail",
        "body" => "Ciao $nomeUtente, ecco il codice OTP: $codiceOTP"
    ];

    $ch = curl_init($url);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json"
    ]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        echo "Errore cURL: " . curl_error($ch);
    } else {
        echo "Risposta server: " . $response;
    }
}
?>

