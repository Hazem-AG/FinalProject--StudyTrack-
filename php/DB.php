<?php
$host = 'localhost';
$db = 'student_system';
$user = 'root';
$pass = '';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

<div class="dropdown">
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
            data-bs-toggle="dropdown" aria-expanded="false" required>
            Select Subject
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li>
                <input type="radio" id="cs" name="department_id" value="1" required>
                <label for="cs" class="dropdown-item">DataBase</label>
            </li>
            <li>
                <input type="radio" id="Chm" name="department_id" value="2" required>
                <label for="Chm" class="dropdown-item">Chemistry</label>
            </li>
        </ul>
    </div>