<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>L'Ajout Des Modules</title>
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<h1>L'ajout d'un module</h1>
	<form action="" method="POST">
		<input type="text" placeholder="Entrez le nom du module" name="NOM" required>
         <select name="ID" required aria-invalid="false">
         <option value="" selected>Choisissez l'année et la filière</option>
            <?php 
                include('../session.php');
                $sqlselect = "SELECT ID,NOM FROM filiere";
                $result = mysqli_query($DBConn, $sqlselect);
                if (mysqli_num_rows($result) > 0) {
                    while($row = mysqli_fetch_assoc($result)){
                        echo "<option value=".$row["ID"].">".$row["ID"]." | ".$row["NOM"]."</option>";
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
        $idfiliere = $_POST["ID"];     
        $sqlinsert = "INSERT INTO module (NOM,ID_FILIERE)
                        VALUES ('$nom','$idfiliere')";
        if (mysqli_query($DBConn, $sqlinsert)) 
        echo "<h3>Le module <font color='red'>$nom</font> est ajouté avec succés</h3>";
        else 
        echo "Error: " . $sqlinsert . "<br>" . mysqli_error($DBConn);
        header("Refresh:5; url=module.php");
    }
   

?>


