<?php
class credentials{
    public function doLogin($user, $pass){
        require_once __DIR__."/database.php";
        $db = new database();

        $r = $db->query("SELECT * FROM dipendente WHERE Username='$user' AND Password='$pass'");

        if($row = $r->fetch_assoc()){
            return $row; 
        }

        return false;
    }
}
?>