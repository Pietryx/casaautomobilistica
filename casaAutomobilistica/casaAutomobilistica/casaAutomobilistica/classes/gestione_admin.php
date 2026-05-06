<?php

class GestioneAdmin {

    public function aggiungi($tipo, $codice, $descrizione, $costo) {
        
        require_once __DIR__."/database.php";
        $db = new database();

        $sql = "";

        if ($tipo === "servizio") {
            $sql = "INSERT INTO SERVIZIO (Codice, CostoOrario, Descrizione) 
                    VALUES ('$codice', '$costo', '$descrizione')";
        } 
        else if ($tipo === "ricambio") {
            $sql = "INSERT INTO PEZZO_RICAMBIO (CodicePezzo, CostoUnitario, Descrizione) 
                    VALUES ('$codice', '$costo', '$descrizione')";
        } 
        else if ($tipo === "accessorio") {
            $sql = "INSERT INTO ACCESSORIO (CodiceArticolo, CostoUnitario, Descrizione) 
                    VALUES ('$codice', '$costo', '$descrizione')";
        }

        if ($db->query($sql)) {
            return true;
        } else {
            return false;
        }
    }

    public function rimuovi($tipo, $codice){
        require_once __DIR__."/database.php";
        $db = new database();

        $sql = "";

        if ($tipo === "servizio") {
            $sql = "DELETE FROM `servizio` WHERE `servizio`.`codice` = $codice;";
        } 
        else if ($tipo === "ricambio") {
            $sql = "DELETE FROM `pezzoricambio` WHERE `pezzoricambio`.`codice` = $codice;";

        } 
        else if ($tipo === "accessorio") {
            $sql = "DELETE FROM `accessorio` WHERE `accessorio`.`codice` = $codice;";

        }

        if ($db->query($sql)) {
            return true;
        } else {
            return false;
        }
    }
}
?>