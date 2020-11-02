<?php
    include_once('core/response.php');
    $response = new response();
    $response->error_number = 5;
    
    $response->get_json();
?>