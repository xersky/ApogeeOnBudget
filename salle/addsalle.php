<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>L'Ajout Des Salles</title>
</head>

<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
        <h1>L'ajout d'une salle</h1>
		<form action="" method="POST">
        <input type="text" style="width:269px;" placeholder="Entrez le numéro ou bien le nom de la salle" name="N_SALLE" required>
				<select name="DISPONIBILITE" required aria-invalid="false">
                <option value="" selected>Choisissez si la salle est disponible ou non</option>
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
    include('../session.php');

        if(isset($_POST["submit"])){
            $n_salle = $_POST["N_SALLE"];
            $dsp = $_POST["DISPONIBILITE"];
            $sqlinsert = "INSERT INTO salle (N,DISPONIBILITE)
                            VALUES('$n_salle',$dsp)";
            if (mysqli_query($DBConn, $sqlinsert)) 
            echo "<h3>La salle <font color='red'>$n_salle</font> est ajoutée avec succés</h3>";
            else 
            echo "Error: " . $sqlinsert . "<br>" . mysqli_error($DBConn);
            header("Refresh:5; url=salle.php");
        }
        
?>

