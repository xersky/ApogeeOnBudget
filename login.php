<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/favicon.ico"/>

    <title>Se connecter - Gestion D'Affectation Des Examens</title>
  
  </head>
  <?php
   include("database/dbconnect.php");
   session_start();
   $error = "";
   if($_SERVER["REQUEST_METHOD"] == "POST") {

      $myusername = mysqli_real_escape_string($DBConn,$_POST['user']);
      $mypassword = mysqli_real_escape_string($DBConn,$_POST['pass']); 
      
      $sql = "SELECT ID FROM auth WHERE USER = '$myusername' AND PASSWORD = '$mypassword'";
      $result = mysqli_query($DBConn,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $count = mysqli_num_rows($result);
 
		
      if($count == 1) {

         $_SESSION['myusername'] = $myusername;
         header("location: dashboard_admin.php");
      }else {
         $error = "Votre nom d'utilisateur ou votre mot de passe est incorrect";
      }
   }

?>

    <body>

    <div style="background-color: #000000;">
      <center><img src="images/logo-ensa.png" alt=""></center>
    </div>
    
    <form action="#" method="post">
      <div class="imgcontainer">
        <img src="images/login.png" alt="" class="avatar">
      </div>


      <div class="container">
        <center>
          <label for="user"><br><b><h4>Utilisateur</b></br></label>
          <input class="label" type="text" placeholder="Entrer votre nom d'utilisateur" name="user" required>
          </br>
          <label for="pass"><br><b>Mot de passe</b></br></label>
          <input class="label" type="password" placeholder="Entrer votre mot de passe" name="pass" required>
          </br>
          <button type="submit"><strong>Login</strong></button>
      </center>
      </div>
      </form>
    <div class="container" style="background-color:coral">
    <div style = "font-weight:bold;font-size:11px; color:#cc0000; margin-top:10px"><center><?php echo $error; ?><center></div>
    <div><button type="submit" onclick="location.href='dashboard_guest.php'" style="width:300px;background-color:#6495ED;"><strong>Je suis un étudiant</strong></button></div></div>
 



    <style>
      body {font-family: Arial, Helvetica, sans-serif;}
      form {border: 5px solid black;background-color:#FC7E5F;}
      
      input[type=text], input[type=password] {
        width: 350px;
        padding: 12px 15px;
        margin: 10px 0;
        display: inline-block;
        border: 2px solid #ccc;
        box-sizing: border-box;
      }
      
      button {
        background-color: #4CAF50;
        color: black;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100px;
      }
      
      button:hover {
        opacity: 0.8;
      }
      
      .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
      }
      
      .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
      }
      

      img.avatar {
        width: 15%;
        border-radius: 50%;
      }
      
      .container {
        padding: 16px;
      }
      

      body {
        background-color: coral;
        }
      
      </style>

    </body>
    </html>
    