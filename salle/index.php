<?php     

  include('../session.php');

  if(isset($_SESSION['myusername']))echo '<META HTTP-EQUIV="Refresh" Content="0; URL=../salle/salle.php">';  
   
?>