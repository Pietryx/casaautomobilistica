<?php

class Officina {

    public function cercaCompatibili($servizio, $pezzo, $accessorio) {
        
        require_once __DIR__."/database.php";
        $db = new database();

        $sql = "SELECT DISTINCT * FROM OFFICINA WHERE 1=1";

        //  filtri solo se l'utente ha compilato il campo
        if (!empty($servizio)) {
            $sql += " AND WHERE Codice IN (SELECT CodiceOfficina FROM OFFICINA_OFFRE_SERVIZIO WHERE CodiceServizio = '$servizio')";
        }

        if (!empty($pezzo)) {
            $sql += " AND WHERE Codice IN (SELECT CodiceOfficina FROM OFFICINA_PRESENTE_RICAMBIO WHERE CodicePezzo = '$pezzo')";
        }

        if (!empty($accessorio)) {
            $sql += " AND WHERE Codice IN (SELECT CodiceOfficina FROM OFFICINA_PRESENTE_ACCESSORIO WHERE CodiceArticolo = '$accessorio')";
        }

        $r = $db->query($sql);
        
        $risultati = [];
        
        if($r){
            while ($row = $r->fetch_assoc()) {
                $risultati[] = $row; 
            }
        }

        return $risultati;
    }
}
?>