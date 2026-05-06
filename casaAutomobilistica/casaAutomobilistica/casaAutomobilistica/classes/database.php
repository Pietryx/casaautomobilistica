<?php 
    class database{
        private $conn;

        public function __construct(){
            require_once __DIR__."\\..\\config\\config.php";
            $this->conn = new mysqli(
                Config::$hostname,
                Config::$username,
                Config::$password,
                Config::$db_name
            );
        }

        public function query($q){
            return $this->conn->query($q);
        }
    }
?>