<?php
include 'DB.php';
header('Content-Type: application/json');
$sql = "SELECT * FROM `courses` ";
$result = $conn->query($sql);
$tasks = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $tasks[] = $row;
    }
}
echo json_encode($tasks);
