<?php

include ('DB.php');

if($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'],PASSWORD_BCRYPT);
    $department = $_POST['department_id'];


    $sql = "INSERT INTO `users` (`id`, `username`, `password`, `department_id`)
    VALUES(NULL,' $username','$password ',' $department')";

  
$result = mysqli_query($conn,$sql);

   if($result){
    header("Location: ../Index.html");
  }
   else{
    echo "Failed: ".mysqli_error($conn);
  }
    
}
?>















