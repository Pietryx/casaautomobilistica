<?php
session_start();

if (!isset($_SESSION["username"])) {
    header("Location: login.html");
    }
?>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestione Officine</title>
</head>

<body>

    <h1>Officine</h1>

    <a href="login.html">Login</a><br>
    <a href="register.html">Registrati</a>

    <br><br>
    <hr>

    <h2>Menu Principale</h2>  
        <h3><a href="ricerca.html">Trova un'Officina Compatibile</a></h3>
        <p>Cercare le officine in base a servizi, pezzi di ricambio o accessori di cui hai bisogno.</p>
        <br>
        <h3><a href="admin.html">Pannello Admin</a></h3>
        <p>Aggiunta/Rimozione nuovi servizi, pezzi o accessori al database</p>
</body>

</html>