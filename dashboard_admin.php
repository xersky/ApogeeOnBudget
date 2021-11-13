<?php
   include('session_parent.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Administrateur - Tableau de bord</title>
      <link rel="icon" href="images/favicon.ico"/>
   </head>
   
   <body>
   <div style="background-color: #ff9800;">
      <center><img src="images/logo-ensa.png" alt=""></center>
    </div>
      <h1>Bonjour <?php echo $login_session; ?></h1> </br>
      </br>
      </br>
      </br>
      </br>
      </br>
      </br>
      </br>
   <center>  <button onclick="location.href='module/module.php'" type="submit"><h3>GESTION MODULE</h3></button>
      <button onclick="location.href='prof/prof.php'" type="submit"><h3>GESTION PROFESSEUR</h3></button></br>
      <button onclick="location.href='salle/salle.php'" type="submit"><h3>GESTION SALLE</h3></button>
      <button onclick="location.href='exam/exam.php'" type="submit"><h3>AFFECTION EXAMEN</h3></button></center> 
      </br></br></br></br></br></br></br></br></br></br></br>
   </body>
<style>     
   body {
        background-color: #D5C37C;
   }

   button{
      width: 320px;
      background-color: #CD5F5F;
      cursor: pointer;
      padding: 14px 20px;

   }


        
      </style>
   <footer>   <button onclick="location.href='logout.php'" style="padding:7px 10px;width:200px;background-color: #CB2121; color: white;cursor: pointer;"><h3>Se déconnecter</h3></button>
   <button onclick="location.href='dashboard_guest.php'" style="float:right;padding:7px 10px;width:200px;background-color: #47B034; color: white;cursor: pointer;"><h3>Affichage des examens en tant qu'étudiant</h3></button>
   </footer>
</html>