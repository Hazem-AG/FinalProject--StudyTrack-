<?php
session_start();
include 'DB.php'; // تأكد من تضمين ملف الاتصال بقاعدة البيانات

header('Content-Type: application/json');
// تحقق من أن المستخدم قد سجل الدخول
if (!isset($_SESSION['user_id']) || !isset($_SESSION['department_id'])) {
    echo json_encode([]);
    exit();
}

$departmentId = $_SESSION['department_id'];

// استعلام لاسترجاع المواد بناءً على معرف القسم
$sql = "SELECT * FROM courses WHERE department_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $departmentId);
$stmt->execute();
$result = $stmt->get_result();

$courses = [];
while ($row = $result->fetch_assoc()) {
    $courses[] = $row;
}

echo json_encode($courses);
$stmt->close();
