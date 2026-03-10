<?php
// Database Configuration
// Use environment variables in production for sensitive data

db_host = getenv('DB_HOST') ?: 'localhost';
db_user = getenv('DB_USER') ?: 'root';
db_password = getenv('DB_PASS') ?: 'corro';
db_name = getenv('DB_NAME') ?: 'bagong_silang_incident';

// Create connection
$conn = new mysqli($db_host, $db_user, $db_password, $db_name);

// Check connection
if ($conn->connect_error) {
    error_log("Database Connection Failed: " . $conn->connect_error);
    die("Database Connection Error. Please try again later.");
}

// Set charset to UTF-8
$conn->set_charset("utf8mb4");
?>