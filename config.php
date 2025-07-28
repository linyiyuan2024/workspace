

<?php
// Database configuration
define('DB_HOST', 'localhost');
define('DB_NAME', 'mcmc');
define('DB_USER', 'root');
define('DB_PASS', '');

// Email configuration
define('SMTP_HOST', 'smtp.example.com');
define('SMTP_PORT', 587);
define('SMTP_USER', 'noreply@example.com');
define('SMTP_PASS', 'password');
define('FROM_EMAIL', 'noreply@example.com');
define('FROM_NAME', 'Authentication System');

// Security settings
define('VERIFICATION_CODE_EXPIRE', 900); // 15 minutes in seconds
define('SESSION_EXPIRE', 86400); // 1 day in seconds
define('REMEMBER_ME_EXPIRE', 2592000); // 30 days in seconds

// API response format
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
?>