<?php
include('DB.php');

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username='$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['department'] = $row['department'];
            header("Location: ../Dashboard.html");
            exit();
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
}

$conn->close();
?>
