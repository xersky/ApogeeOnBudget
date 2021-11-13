<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Examens</title>
    <link rel="stylesheet" href="css/table.css" />
    <link rel="icon" href="images/favicon.ico"/>
</head>
<body>
<div style="background-color: #000000;">
      <center><img src="images/logo-ensa.png" alt=""></center>
    </div>
<h1>Listes Des Examens</h1> 
<div class="container">
   <table class ="table table-bordered table-hover table-stripped">
        <tr><th>Filiere | Module</th><th>Salle</th><th>Date d'examen</th><th>Durée d'examen</th></tr>
        <?php

        include('database/dbconnect.php');

        $sql = "SELECT * FROM exam GROUP BY N_SALLE,DATE";
        $result = mysqli_query($DBConn,$sql);
        $count = mysqli_num_rows($result);
        while($row = mysqli_fetch_row($result)){   
				$id=$row[0];
                $nsalle=$row[1];
				$idmodule=$row[3];
                $date=$row[4];
                $duree=$row[5];
                
                $sqlselect = "SELECT NOM,ID_FILIERE FROM module WHERE ID=$idmodule";
                $result2 = mysqli_query($DBConn,$sqlselect);
                if (mysqli_num_rows($result2) > 0) {
                    $roww = mysqli_fetch_assoc($result2);
                        $module=$roww["NOM"];
                        $idfiliere=$roww["ID_FILIERE"];
                }

                echo "<tr><td>$idfiliere | $module</td><td>$nsalle</td><td><input readonly value='$date' type='datetime-local'></td><td>$duree</td></tr>";

        }
        ?>

    </table>
    
    </div>
    <div><button type="submit" onclick="location.href='index.php'" style="width:300px;background-color:#6495ED;"><strong>Revient à la page principale</strong></button></div></div>

</body>
<style>     
                body {
                    background-color: #B3C4F3;
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
      
      </style>
</html>