<?php


require_once realpath(__DIR__ . "/vendor/autoload.php");

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

//DATABASE CONNECTION VARIABLES
$host = getenv("DB_HOST"); // Host name
$username = getenv("DB_USERNAME"); // Mysql username
$password = getenv("DB_PASSWORD"); // Mysql password
$db_name = getenv("DB_NAME"); // Database name
$db_port = getenv("DB_PORT"); //port
// echo $host;

// Create connection
$conn = new mysqli($host, $username, $password, $db_name, $db_port);

// Check connection
if (mysqli_connect_error()) {
    die("Database connection failed: " . mysqli_connect_error());
  }