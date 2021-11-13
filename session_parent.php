<?php
   include('database/dbconnect.php');
   session_start();
   
   $user_check = $_SESSION['myusername'];
   
   $ses_sql = mysqli_query($DBConn,"select USER from auth where USER = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['USER'];
   
   if(!isset($_SESSION['myusername'])){
      header("location:login.php");
      die();
   }
?>