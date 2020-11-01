<?php 

class db{
    public $conn;
    function __construct() {
        global $conn;
        $servername = "localhost";
        $username = "cinquery";
        $password = "BNjcmHFwkMXVNx3C";
        $dbname = "cinema_db";
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            //die($conn->connect_error);
        }
    }
    
    function get_conn(){
        global $conn;
        return $conn;
    }
    
    function close(){
        global $conn;
        $conn->close();
    }
    
    
}

?>