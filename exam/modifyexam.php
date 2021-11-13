<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Modification Des examens</title>
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<?php
        include("../session.php");
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
    
    
    $sqlselect = "SELECT * FROM exam WHERE ID=$id";
    $result = mysqli_query($DBConn,$sqlselect);
    while($row = mysqli_fetch_row($result)){  
        $id=$row[0];
        $n_salle=$row[1];
        $idprof=$row[2];
        $idmodule=$row[3];
        $date=$row[4];
        $duree=$row[5];


        $sqlselect2 = "SELECT NOM,ID_FILIERE FROM module WHERE ID=$idmodule";
        $result2 = mysqli_query($DBConn,$sqlselect2);
        if (mysqli_num_rows($result2) > 0) {
            $roww = mysqli_fetch_assoc($result2);
                $module=$roww["NOM"];
                $idfiliere=$roww["ID_FILIERE"];
        }

        $sqlselect3 = "SELECT NOM,PRENOM FROM professeur WHERE ID=$idprof";
        $result3 = mysqli_query($DBConn,$sqlselect3);
        if (mysqli_num_rows($result3) > 0) {
            $roww = mysqli_fetch_assoc($result3);
                $nom=$roww["NOM"];
                $prenom=$roww["PRENOM"];
        }

        echo "<h1>Modification de l'affectation de l'examen du module $module | filiere $idfiliere </h1>";
            echo "<div><h4>ID : <font color='blue'>$id</font></br> Code Filière : <font color='blue'>$idfiliere</font></br> Nom du module : <font color='blue'>$module</font></br> Salle : $n_salle</br> Professeur en charge: <font color='blue'>$nom $prenom</font></br> Date d'examen: <input readonly value='$date' type='datetime-local'></br> Duree d'examen: <font color='blue'>$duree</font></h4></div>";

    }
}
?>

<form action="" method="POST">
<h3><font color='red'>Laisser une option vide va conduire à garder la valeur précédente de cette option</font></h3>
<br>
         <select name="ID_MODULE">
         <option value="<?php echo "$idmodule";?>" selected>Gardez le module precedent</option>
         <?php 
                $sql1 = "SELECT ID, NOM, ID_FILIERE FROM module";
                $result1 = mysqli_query($DBConn, $sql1);
                if (mysqli_num_rows($result1) > 0) {
                    while($row = mysqli_fetch_assoc($result1)){
                        echo "<option value=".$row["ID"].">".$row["ID_FILIERE"]." | ".$row["NOM"]."</option>";
                    }
                }
            ?>
        </select> 
        <select name="N">
         <option value="<?php echo "$n_salle";?>" selected>Gardez la salle precedente</option>
            <?php 
                $sql2 = "SELECT N FROM salle WHERE DISPONIBILITE=1";
                $result2 = mysqli_query($DBConn, $sql2);
                if (mysqli_num_rows($result2) > 0) {
                    while($row = mysqli_fetch_assoc($result2)){
                        echo "<option value=".$row["N"].">".$row["N"]."</option>";
                    }
                }
            ?>
        </select>
        <select name="ID_PROF">
         <option value="<?php echo "$idprof";?>" selected>Gardez le professeur precedent</option>
            <?php 
                $sql3 = "SELECT ID,NOM,PRENOM FROM professeur";
                $result3 = mysqli_query($DBConn, $sql3);
                if (mysqli_num_rows($result3) > 0) {
                    while($row = mysqli_fetch_assoc($result3)){
                        echo "<option value=".$row["ID"].">".$row["NOM"]." ".$row["PRENOM"]."</option>";
                    }
                }
            ?>
        </select>
        <input value="<?php echo "$date";?>"type="datetime-local" placeholder="Date (2020-06-13 23:59)" name="DATE">
        <input value="<?php echo "$duree";?>" type="text" placeholder="Durée (exemple 02h00min)" name="DUREE">
    <input type="submit" name="submit">
    </form>
        </body>
        <style>     
                body {
                    background-color: #D5C37C;
                }
      </style>
    </html>

<?php
    if(!empty($id))
    {
        if(isset($_POST["submit"])){
            if(!empty($_POST["ID_MODULE"])) $idmodule = $_POST["ID_MODULE"];
            if(!empty($_POST["N"])) $nsalle = $_POST["N"];
            if(!empty($_POST["ID_PROF"])) $idprof = $_POST["ID_PROF"];
            if(!empty($_POST["DATE"])) $date = $_POST["DATE"];
            if(!empty($_POST["DUREE"])) $duree = $_POST["DUREE"];

        $request = "UPDATE exam SET ID_MODULE=$idmodule , ID_PROF=$idprof, N_SALLE='$nsalle', DATE='$date', DUREE='$duree' WHERE ID=$id";
        if (mysqli_query($DBConn,$request)) {
            echo "<h3>L'examen $id est modifié avec succès</h3>";
          } else {
            echo "<h1>Redondance détécté! </h1></br><h3>Vous ne pouvez pas entrer les valeurs de la salle et du professeur en même date.</h3>";
          }
          echo '<META HTTP-EQUIV="Refresh" Content="5; URL=../exam/exam.php">';
        }
          mysqli_close($DBConn);
    }  

?>