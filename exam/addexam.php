<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>L'Affectation des examens</title>
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<?php 
    include('../session.php');
    echo "<h1>Affectation des professeurs et des salles aux examens </h1>";
?>
	<form action="" method="POST">
         <select name="ID_MODULE" required aria-invalid="false">
         <option value="" selected>Choisissez Le module</option>
         <?php 
                $sql1 = "SELECT ID,NOM, ID_FILIERE FROM module";
                $result1 = mysqli_query($DBConn, $sql1);
                if (mysqli_num_rows($result1) > 0) {
                    while($row = mysqli_fetch_assoc($result1)){
                        echo "<option value=".$row["ID"].">".$row["ID_FILIERE"]." | ".$row["NOM"]."</option>";
                    }
                }
            ?>
        </select> 
        <select name="N" required aria-invalid="false">
        <p>Voici les salles disponibles pour le moment</p>
         <option value="" selected>Choisissez une salle</option>
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
        <select name="ID_PROF" required aria-invalid="false">
         <option value="" selected>Choisissez le professeur qui va être en charge</option>
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
        <input type="datetime-local" name="DATE" required>
        <input type="text" placeholder="Durée (exemple 02h00min)" name="DUREE" required>
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

    if(isset($_POST["submit"])){
        $idmodule = $_POST["ID_MODULE"];
        $nsalle = $_POST["N"];
        $idprof = $_POST["ID_PROF"];
        $date = $_POST["DATE"];
        $duree = $_POST["DUREE"];

        $sqlinsert = "INSERT INTO exam (ID_MODULE,N_SALLE,ID_PROF,DATE,DUREE)
                        VALUES ('$idmodule','$nsalle','$idprof','$date','$duree')";

        $sqlselect = "SELECT NOM,ID_FILIERE FROM module WHERE ID=$idmodule";
        $result4 = mysqli_query($DBConn,$sqlselect);
        if (mysqli_num_rows($result4) > 0) {
            $row = mysqli_fetch_assoc($result4);
                $module=$row["NOM"];
                $idfiliere=$row["ID_FILIERE"];
        }
        

        $sqlselect2 = "SELECT NOM FROM filiere WHERE ID='$idfiliere'";
        $result5 = mysqli_query($DBConn,$sqlselect2);
        $roww = mysqli_fetch_assoc($result5);
        $nomfiliere=$roww["NOM"];
  

        if (mysqli_query($DBConn, $sqlinsert)) 
        echo "<h3>L'examen du module <font color='red'>$module</font> de la filière <font color='red'>$nomfiliere</font> sera à la date <input readonly value='$date' type='datetime-local'> dans la salle <font color='red'>$nsalle</font> avec une durée de <font color='red'>$duree</font></h3>";
        else 
        echo "<h1>Redondance détécté! </h1></br><h3>Vous ne pouvez pas entrer les valeurs de la salle et du professeur en même date.</h3>";
        echo '<META HTTP-EQUIV="Refresh" Content="5; URL=../exam/exam.php">';
    }
    
?>


