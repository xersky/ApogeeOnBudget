<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Professeurs</title>
    <link rel="stylesheet" href="../css/table.css" />
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<h1>Liste des professeurs</h1> <button onclick="location.href='addprof.php'" style="background-color: #69D3B7;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Ajouter un professeur</button>
<button onclick="location.href='../dashboard_admin.php'" style="float:right;background-color: #D6764B;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Revenir au tableau de bord</button>
</br>
</br></br></br>
<div class="container">
   <table class ="table table-bordered table-hover table-stripped">
   <strong><tr><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Département</th></tr></strong>
        <?php
        include('../session.php');

        
        $sql = "SELECT * FROM professeur";
        $result = mysqli_query($DBConn,$sql);
        $count = mysqli_num_rows($result);
        while($row = mysqli_fetch_row($result)){   
				$id=$row[0];
                $nom=$row[1];
                $prenom=$row[2];
				$email=$row[3];
				$departement=$row[4];
                echo "</div><tr><td>$id</td><td>$nom</td><td>$prenom</td><td>$email</td><td>$departement</td>";
				echo"<td>";
				echo "<a href='modifyprof.php?id=$id' class='btn modifier'>Modifier</a>";
                echo "<a href='deleteprof.php?id=$id' class='btn supprimer' onclick='return confirm(\"Etes vous sur de vouloir supprimer ce professeur?\")'> Supprimer</a>";
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