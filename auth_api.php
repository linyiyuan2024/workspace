
<?php
require_once 'config.php';
session_start();

// Database connection using PDO
try {
    $pdo = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die(json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]));
}

// Handle API requests
$action = $_REQUEST['action'] ?? '';

switch($action) {
    case 'login':
        handleLogin();
        break;
    case 'register_start':
        handleRegisterStart();
        break;
    case 'register_complete':
        handleRegisterComplete();
        break;
    case 'forgot_password_start':
        handleForgotPasswordStart();
        break;
    case 'forgot_password_complete':
        handleForgotPasswordComplete();
        break;
    case 'check_auth':
        handleCheckAuth();
        break;
    case 'user_info':
        handleUserInfo();
        break;
    case 'update_user':
        handleUpdateUser();
        break;
    default:
        showApiDocumentation();
}

function handleLogin() {
    global $pdo;
    
    $email = $_REQUEST['email'] ?? '';
    $password = $_REQUEST['password'] ?? '';
    $remember = $_REQUEST['remember_me'] ?? false;

    if (empty($email) || empty($password)) {
        echo json_encode(['error' => 'Email and password are required']);
        return;
    }

    try {
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user || !password_verify($password, $user['password'])) {
            echo json_encode(['error' => 'Invalid email or password']);
            return;
        }

        // Set session
        $_SESSION['user_id'] = $user['uid'];
        $_SESSION['email'] = $user['email'];
        $_SESSION['logged_in'] = true;

        // Set cookie if remember me is checked
        if ($remember) {
            $token = bin2hex(random_bytes(32));
            $expire = time() + REMEMBER_ME_EXPIRE;
            setcookie('remember_token', $token, $expire, '/');
            
            // Store token in database
            $stmt = $pdo->prepare("UPDATE users SET remember_token = ? WHERE uid = ?");
            $stmt->execute([$token, $user['uid']]);
        }

        echo json_encode(['success' => true, 'user' => [
            'uid' => $user['uid'],
            'email' => $user['email'],
            'nickname' => $user['nickname']
        ]]);
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleRegisterStart() {
    global $pdo;
    
    $email = $_REQUEST['email'] ?? '';
    
    if (empty($email)) {
        echo json_encode(['error' => 'Email is required']);
        return;
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(['error' => 'Invalid email format']);
        return;
    }

    try {
        // Check if email already exists
        $stmt = $pdo->prepare("SELECT uid FROM users WHERE email = ?");
        $stmt->execute([$email]);
        
        if ($stmt->fetch()) {
            echo json_encode(['error' => 'Email already registered']);
            return;
        }

        // Generate verification code
        $code = str_pad(rand(0, 999999), 6, '0', STR_PAD_LEFT);
        $expires = time() + VERIFICATION_CODE_EXPIRE;

        // Store in session
        $_SESSION['register_email'] = $email;
        $_SESSION['register_code'] = $code;
        $_SESSION['register_expires'] = $expires;

        // In a real application, you would send the code via email
        // For demo purposes, we'll just return it
        echo json_encode([
            'success' => true,
            'message' => 'Verification code sent (simulated)',
            'code' => $code // Remove this in production
        ]);
        
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleRegisterComplete() {
    global $pdo;
    
    $email = $_REQUEST['email'] ?? '';
    $code = $_REQUEST['code'] ?? '';
    $password = $_REQUEST['password'] ?? '';
    $username = $_REQUEST['username'] ?? '';

    // Validate inputs
    if (empty($email) || empty($code) || empty($password) || empty($username)) {
        echo json_encode(['error' => 'All fields are required']);
        return;
    }

    // Verify code
    if (!isset($_SESSION['register_email']) || 
        !isset($_SESSION['register_code']) ||
        !isset($_SESSION['register_expires']) ||
        $_SESSION['register_email'] !== $email ||
        $_SESSION['register_code'] !== $code ||
        time() > $_SESSION['register_expires']) {
        echo json_encode(['error' => 'Invalid or expired verification code']);
        return;
    }

    try {
        // Hash password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Create user
        $stmt = $pdo->prepare("INSERT INTO users (email, password, nickname, username, register_at, verified) 
                              VALUES (?, ?, ?, ?, NOW(), 1)");
        $stmt->execute([$email, $hashedPassword, $username, $username]);

        // Clear session
        unset($_SESSION['register_email']);
        unset($_SESSION['register_code']);
        unset($_SESSION['register_expires']);

        echo json_encode(['success' => true, 'message' => 'Registration completed']);
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleForgotPasswordStart() {
    global $pdo;
    
    $email = $_REQUEST['email'] ?? '';
    
    if (empty($email)) {
        echo json_encode(['error' => 'Email is required']);
        return;
    }

    try {
        // Check if email exists
        $stmt = $pdo->prepare("SELECT uid FROM users WHERE email = ?");
        $stmt->execute([$email]);
        
        if (!$stmt->fetch()) {
            echo json_encode(['error' => 'Email not found']);
            return;
        }

        // Generate verification code
        $code = str_pad(rand(0, 999999), 6, '0', STR_PAD_LEFT);
        $expires = time() + VERIFICATION_CODE_EXPIRE;

        // Store in session
        $_SESSION['reset_email'] = $email;
        $_SESSION['reset_code'] = $code;
        $_SESSION['reset_expires'] = $expires;

        // In a real application, you would send the code via email
        // For demo purposes, we'll just return it
        echo json_encode([
            'success' => true,
            'message' => 'Password reset code sent (simulated)',
            'code' => $code // Remove this in production
        ]);
        
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleForgotPasswordComplete() {
    global $pdo;
    
    $email = $_REQUEST['email'] ?? '';
    $code = $_REQUEST['code'] ?? '';
    $new_password = $_REQUEST['new_password'] ?? '';

    // Validate inputs
    if (empty($email) || empty($code) || empty($new_password)) {
        echo json_encode(['error' => 'All fields are required']);
        return;
    }

    // Verify code
    if (!isset($_SESSION['reset_email']) || 
        !isset($_SESSION['reset_code']) ||
        !isset($_SESSION['reset_expires']) ||
        $_SESSION['reset_email'] !== $email ||
        $_SESSION['reset_code'] !== $code ||
        time() > $_SESSION['reset_expires']) {
        echo json_encode(['error' => 'Invalid or expired verification code']);
        return;
    }

    try {
        // Hash new password
        $hashedPassword = password_hash($new_password, PASSWORD_DEFAULT);

        // Update password
        $stmt = $pdo->prepare("UPDATE users SET password = ? WHERE email = ?");
        $stmt->execute([$hashedPassword, $email]);

        // Clear session
        unset($_SESSION['reset_email']);
        unset($_SESSION['reset_code']);
        unset($_SESSION['reset_expires']);

        echo json_encode(['success' => true, 'message' => 'Password updated successfully']);
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleCheckAuth() {
    global $pdo;
    
    // Check session authentication
    $authenticated = isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true;
    
    // If not authenticated by session, check remember token
    if (!$authenticated && isset($_COOKIE['remember_token'])) {
        try {
            $stmt = $pdo->prepare("SELECT uid FROM users WHERE remember_token = ?");
            $stmt->execute([$_COOKIE['remember_token']]);
            $user = $stmt->fetch();
            
            if ($user) {
                $_SESSION['user_id'] = $user['uid'];
                $_SESSION['logged_in'] = true;
                $authenticated = true;
            }
        } catch(PDOException $e) {
            // Log error if needed
        }
    }

    echo json_encode(['authenticated' => $authenticated]);
}

function handleUserInfo() {
    global $pdo;
    
    if (!isset($_SESSION['logged_in']) || !$_SESSION['logged_in']) {
        echo json_encode(['error' => 'Not authenticated']);
        return;
    }

    try {
        $stmt = $pdo->prepare("SELECT * FROM users WHERE uid = ?");
        $stmt->execute([$_SESSION['user_id']]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$user) {
            echo json_encode(['error' => 'User not found']);
            return;
        }

        // Remove sensitive fields before returning
        unset($user['password']);
        unset($user['remember_token']);
        unset($user['verification_token']);

        echo json_encode(['success' => true, 'user' => $user]);
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleUpdateUser() {
    global $pdo;
    
    if (!isset($_SESSION['logged_in']) || !$_SESSION['logged_in']) {
        echo json_encode(['error' => 'Not authenticated']);
        return;
    }

    $data = json_decode($_REQUEST['data'] ?? '', true);
    if (!$data || !is_array($data)) {
        echo json_encode(['error' => 'Invalid data format']);
        return;
    }

    // Remove fields that shouldn't be updated
    unset($data['uid']);
    unset($data['password']);
    unset($data['remember_token']);
    unset($data['verification_token']);

    try {
        // Build update query
        $setParts = [];
        $params = [];
        foreach ($data as $field => $value) {
            $setParts[] = "$field = ?";
            $params[] = $value;
        }
        $params[] = $_SESSION['user_id'];

        $query = "UPDATE users SET " . implode(', ', $setParts) . " WHERE uid = ?";
        $stmt = $pdo->prepare($query);
        $success = $stmt->execute($params);

        if ($success && $stmt->rowCount() > 0) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['error' => 'No changes made']);
        }
    } catch(PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function showApiDocumentation() {
    $docs = [
        'available_actions' => [
            'login' => [
                'description' => 'User login',
                'parameters' => ['email', 'password', 'remember_me (optional)']
            ],
            'register_start' => [
                'description' => 'Start registration by sending verification email',
                'parameters' => ['email']
            ],
            'register_complete' => [
                'description' => 'Complete registration with verification code',
                'parameters' => ['email', 'code', 'password', 'username']
            ],
            'forgot_password_start' => [
                'description' => 'Start password reset process',
                'parameters' => ['email']
            ],
            'forgot_password_complete' => [
                'description' => 'Complete password reset with verification code',
                'parameters' => ['email', 'code', 'new_password']
            ],
            'check_auth' => [
                'description' => 'Check if user is authenticated',
                'parameters' => []
            ],
            'user_info' => [
                'description' => 'Get current user information',
                'parameters' => []
            ],
            'update_user' => [
                'description' => 'Update user information',
                'parameters' => ['data (JSON)']
            ]
        ],
        'note' => 'All endpoints accept both GET and POST requests'
    ];
    echo json_encode($docs, JSON_PRETTY_PRINT);
}
?>
