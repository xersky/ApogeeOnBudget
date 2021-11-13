<?php     

  include('session_parent.php');

  if(!isset($_SESSION['myusername'])){
    header("location:login.php");
    die();
  }else   header("location:dashboard_admin.php");  
   
?>