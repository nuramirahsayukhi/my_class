<?php
$servername = "localhost";
$username   = "saujanae_myclassadmin";
$password   = "^s#3dx+vNP;8";
$dbname     = "saujanae_myclass";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>