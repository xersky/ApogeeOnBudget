<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Salles</title>
    <link rel="stylesheet" href="../css/table.css" />

</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<h1>Liste des salles</h1> <button onclick="location.href='addsalle.php'" style="background-color: #69D3B7;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Ajouter une salle</button>
<button onclick="location.href='../dashboard_admin.php'" style="float:right;background-color: #D6764B;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Revenir au tableau de bord</button>
</br>
</br></br></br>
<div class="container">
   <table class ="table table-bordered table-hover table-stripped">
   <strong> <tr><th>Numéro de la salle</th><th>Disponibilité</th></tr></strong>
        <?php
        include('../session.php');

        
        $sql = "SELECT * FROM salle";
        $result = mysqli_query($DBConn,$sql);
        while($row = mysqli_fetch_row($result)){   
            $n_salle=$row[0];
            $dsp=$row[1];
            if($dsp) $dsp="OUI"; else $dsp="NON";
                echo "</div><tr><td>$n_salle</td><td>$dsp</td>";
				echo"<td>";
				echo "<a href='modifysalle.php?id=$n_salle' class='btn modifier'>Modifier</a>";
                echo "<a href='deletesalle.php?id=$n_salle' class='btn supprimer' onclick='return confirm(\"Etes vous sur de vouloir supprimer cette salle?\")'> Supprimer</a>";
                echo "</tr>";
        }
        ?>

    </table>
    
    </div>
</body>
<style>     
   body {
        background-color: #D5C37C;
        }
      </style>
</html>