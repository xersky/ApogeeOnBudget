<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Examens</title>
    <link rel="stylesheet" href="../css/table.css" />
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<h1>Liste des examens</h1> <button onclick="location.href='addexam.php'" style="background-color: #69D3B7;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Affection des examens</button>
<button onclick="location.href='../dashboard_admin.php'" style="float:right;background-color: #D6764B;color: black;border: 3px solid black;font-size: 20px;cursor: pointer;" type="submit">Revenir au tableau de bord</button>
</br>
</br></br></br>
<div class="container">
   <table class ="table table-bordered table-hover table-stripped">
   <strong><tr><th>ID</th><th>Salle</th><th>Filiere | Module</th><th>Professeur en charge</th><th>Date d'examen</th><th>Durée d'examen</th></tr></strong>
        <?php
        include('../session.php');

        
        $sql = "SELECT * FROM exam ORDER BY ID_MODULE";
        $result = mysqli_query($DBConn,$sql);
        while($row = mysqli_fetch_row($result)){   
				$id=$row[0];
                $nsalle=$row[1];
                $idprof=$row[2];
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

                $sqlselect2 = "SELECT NOM,PRENOM FROM professeur WHERE ID=$idprof";
                $result3 = mysqli_query($DBConn,$sqlselect2);
                if (mysqli_num_rows($result3) > 0) {
                    $roww = mysqli_fetch_assoc($result3);
                        $nom=$roww["NOM"];
                        $prenom=$roww["PRENOM"];
                }

                echo "</div><tr><td>$id</td><td>$nsalle</td><td>$idfiliere | $module</td><td>$nom $prenom</td><td><input readonly value='$date' type='datetime-local'></td><td>$duree</td>";
				echo"<td>";
				echo "<a href='modifyexam.php?id=$id' class='btn modifier'>Modifier</a>";
                echo "<a href='deleteexam.php?id=$id' class='btn supprimer' onclick='return confirm(\"Etes vous sur de vouloir supprimer cet exam?\")'> Supprimer</a>";
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