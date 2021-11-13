<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Modules</title>
    <link rel="stylesheet" href="../css/table.css" />
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<h1>Liste des modules</h1> <button onclick="location.href='addmodule.php'" style="background-color: #69D3B7;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Ajouter un module</button>
<button onclick="location.href='../dashboard_admin.php'" style="float:right;background-color: #D6764B;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Revenir au tableau de bord</button>
</br>
</br></br></br>
<div class="container">
   <table class ="table table-bordered table-hover table-stripped">
   <strong><tr><th>ID</th><th>Nom du module</th><th>Filière</th></tr></strong>
        <?php
        include('../session.php');

        
        $sql = "SELECT * FROM module";
        $result = mysqli_query($DBConn,$sql);
        $count = mysqli_num_rows($result);
        while($row = mysqli_fetch_row($result)){   
                $id=$row[0];
                $nom_module=$row[1];
                $id_filiere=$row[2];
                echo "</div><tr><td>$id</td><td>$nom_module</td><td>$id_filiere</td>";
                echo"<td>";
                echo "<a href='modifymodule.php?id=$id' class='btn modifier'>Modifier</a>";
                echo "<a href='deletemodule.php?id=$id' class='btn supprimer' onclick='return confirm(\"Etes vous sur de vouloir supprimer ce module?\")'> Supprimer</a>";
                echo "</tr>";
        }
        ?>

    </table>
    
    </div>
    <style>     
                body {
                    background-color: #D5C37C;
                }
      </style>
</body>

</html>