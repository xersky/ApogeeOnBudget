<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Modification Des Salles</title>
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
    echo "<h1>Modification de la salle $id</h1>";
    $sqlselect = "SELECT * FROM salle WHERE N='$id'";
    $result = mysqli_query($DBConn,$sqlselect);
    while($row = mysqli_fetch_row($result)){  
        $n_salle=$row[0];
        $dsp=$row[1];

        if($dsp) $dsp="OUI"; else $dsp="NON";
            echo "<div><h4>Salle : <font color='blue'>$n_salle</font></br> Disponibilité : <font color='blue'>$dsp</font></h4></div>";

    }
}
?>

<form action="" method="POST">
<h3><font color='red'>Laisser une option vide va conduire à garder la valeur précédente de cette option</font></h3>
<br>
        <input value="<?php echo "$n_salle";?>" type="text"  placeholder="Entrez le numéro ou bien le nom de la salle" name="N_SALLE">
				<select name="DISPONIBILITE">
                <option value="<?php echo "$dsp";?>" selected>Gardez la disponibilité precedente</option>
                <option value=1>Oui</option>
                <option value=0>Non</option>
	        </select>
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
            if(!empty($_POST["N_SALLE"])) $n_salle = $_POST["N_SALLE"];
            $dsp = $_POST["DISPONIBILITE"];
            $request = "UPDATE salle SET N='$n_salle', DISPONIBILITE=$dsp WHERE N='$id'";
        if (mysqli_query($DBConn,$request)) {
            echo "<h3>La salle $id est modifié avec succès</h3>";
          } else {
            echo "Error modification record: " . mysqli_error($DBConn);
          }
          header("refresh:5;url=salle.php");
        }
          mysqli_close($DBConn);
        


    }  



?>



