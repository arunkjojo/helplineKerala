<?php
define("SERVER","localhost");
define("USER","helpline_kerala");
define("PASSWORD","helplinekerala@123.");
define("DATABASE","helpline_kerala");

$con = new mysqli(SERVER,USER,PASSWORD,DATABASE) or die("Error establishing connection");
$con->set_charset("utf8");
global $con;

date_default_timezone_set('Asia/Calcutta');
?>