<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="../images/favicon.ico"/>
    <title>L'Ajout Des Professeurs</title>
</head>

<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<h1>L'ajout d'un professeur</h1>
		<form action="" method="POST">
        <input type="text" style="width:240px" placeholder="Entrez le nom du professeur" name="NOM" required>
        <input type="text" style="width:240px" placeholder="Entrez le prénom du professeur" name="PRENOM" required>
        <input type="email" style="width:240px" placeholder="Entrez l'email du professeur" name="EMAIL" required>
				<select name="DEPARTEMENT" required aria-invalid="false">
				<option value="" selected>Choisissez le departement</option>
                <?php 
                        include('../session.php');
						$sql = "SELECT DISTINCT DEPARTEMENT FROM professeur";
						$result = mysqli_query($DBConn, $sql);

					if (mysqli_num_rows($result) > 0) {
						while($row = mysqli_fetch_assoc($result)) {
							echo "<option>".$row["DEPARTEMENT"]. "</option>";
					    }
					}
				?>
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

             if(isset($_POST["submit"])){
                $nom = $_POST["NOM"];
				$prenom = $_POST["PRENOM"];
				$email = $_POST["EMAIL"];
				$departement = $_POST["DEPARTEMENT"];
        		$sqlinsert = "INSERT INTO professeur (NOM,PRENOM,EMAIL,DEPARTEMENT) 
								VALUES ('$nom','$prenom','$email','$departement')";
				if (mysqli_query($DBConn, $sqlinsert)) 
				echo "<h3>Le professeur <font color='red'>$nom $prenom</font> est ajouté avec succés</h3>";
				else 
				echo "Error: " . $sqlinsert . "<br>" . mysqli_error($DBConn);
				header("Refresh:5; url=prof.php");
        }
		
?>