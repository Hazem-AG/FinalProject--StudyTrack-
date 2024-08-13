<?php
session_start();
include 'DB.php'; // تأكد من تضمين ملف الاتصال بقاعدة البيانات

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    
    // استعلام للتحقق من بيانات المستخدم
    $stmt = $conn->prepare("SELECT id, department_id, password FROM users WHERE username = ?");
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        $stmt->bind_result($userId, $departmentId, $hashedPassword);
        $stmt->fetch();

        if (password_verify($password, $hashedPassword)) {
            $_SESSION['user_id'] = $userId;
            $_SESSION['department_id'] = $departmentId;
            header('Location: ../Dashboard.html'); // انتقل إلى صفحة المستخدم
        } else {
            $_SESSION['error_message'] = "Invalid password";
            header("Location: error-login.php");
            exit();
        }
    } else {
        $_SESSION['error_message'] = "No user found with this Username";
        header("Location: error-login.php");
        exit();
    }
    $stmt->close();
}